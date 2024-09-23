@implementation CKDPackageDirectoryPurger

- (id)initInternal
{
  CKDPackageDirectoryPurger *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableArray *v7;
  NSMutableArray *rootDirectories;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDPackageDirectoryPurger;
  v2 = -[CKDPackageDirectoryPurger init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.cloudkit.packagepurger", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rootDirectories = v2->_rootDirectories;
    v2->_rootDirectories = v7;

  }
  return v2;
}

- (void)registerXPCActivity
{
  if (qword_1ED700880 != -1)
    dispatch_once(&qword_1ED700880, &unk_1E7833A28);
}

- (void)purgeAll
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_queue(self, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEB18430;
  v6[3] = &unk_1E782EF38;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)purgeDirectory:(id)a3
{
  MEMORY[0x1E0DE7D20](MEMORY[0x1E0C94FC8], sel_gcPackagesInDirectory_dbInUseBlock_, a3);
}

- (void)purgeRootDirectory:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int ResourceValue_forKey_error;
  id v24;
  id v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  char v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  _QWORD v80[4];

  v80[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99A90];
  v8 = *MEMORY[0x1E0C999D0];
  v80[0] = *MEMORY[0x1E0C99A90];
  v80[1] = v8;
  v63 = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v80, 2);
  v10 = objc_claimAutoreleasedReturnValue();
  v59 = v3;
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v11, (uint64_t)v3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v10;
  v58 = v6;
  objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v6, v13, (uint64_t)v12, v10, 0, &unk_1E7833AC8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v15 = v14;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v69, v79, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v70;
    v61 = *MEMORY[0x1E0C953F8];
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v70 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v21);
        v67 = 0;
        v68 = 0;
        ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v22, v18, (uint64_t)&v68, v7, &v67);
        v24 = v68;
        v25 = v67;
        v27 = v25;
        if (!ResourceValue_forKey_error)
        {
          v48 = 0;
          v33 = v25;
LABEL_23:
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v49 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v50 = v49;
            objc_msgSend_CKSanitizedPath(v22, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v74 = v59;
            v75 = 2112;
            v76 = v53;
            v77 = 2112;
            v78 = v33;
            _os_log_error_impl(&dword_1BE990000, v50, OS_LOG_TYPE_ERROR, "Error enumerating %@ for package purges, failed to get the resource value at %@: %@", buf, 0x20u);

          }
          goto LABEL_30;
        }
        v28 = v19;
        v29 = v20;
        v30 = v7;
        v31 = v15;
        v65 = 0;
        v66 = 0;
        v32 = objc_msgSend_getResourceValue_forKey_error_(v22, v26, (uint64_t)&v66, v63, &v65);
        v64 = v66;
        v33 = v65;

        if ((v32 & 1) == 0)
        {
          v15 = v31;
          v7 = v30;
          v20 = v29;
          v19 = v28;
          v48 = v64;
          goto LABEL_23;
        }
        v15 = v31;
        if (v24)
        {
          if (!v64)
          {
            v7 = v30;
            v20 = v29;
            v19 = v28;
            v48 = 0;
            goto LABEL_30;
          }
          v62 = objc_msgSend_BOOLValue(v64, v34, v35);
          v7 = v30;
          v20 = v29;
          v19 = v28;
          if ((objc_msgSend_isEqualToString_(v24, v36, v61) & 1) != 0
            || objc_msgSend_isEqualToString_(v24, v37, (uint64_t)CFSTR("com.apple.cloudkit.UploadPackages")))
          {
            if ((v62 & 1) == 0)
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v37, v38);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v55, (uint64_t)a2, self, CFSTR("CKDPackageDirectoryPurger.m"), 103, CFSTR("Expected: %@ to be a directory"), v22);

            }
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v39 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v22;
              _os_log_debug_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEBUG, "Purging packages in: %@", buf, 0xCu);
            }
            objc_msgSend_path(v22, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_purgeDirectory_(self, v43, (uint64_t)v42);

            objc_msgSend_skipDescendants(v15, v44, v45);
          }
          if ((unint64_t)objc_msgSend_level(v15, v37, v38) >= 3)
            objc_msgSend_skipDescendants(v15, v46, v47);
        }
        else
        {
          v7 = v30;
          v20 = v29;
          v19 = v28;
        }
        v48 = v64;
LABEL_30:

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v69, v79, 16);
    }
    while (v19);
  }

}

- (void)addRootDirectory:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_queue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB18BA8;
  block[3] = &unk_1E782EF60;
  v8 = v4;
  v12 = v8;
  objc_copyWeak(&v13, &location);
  dispatch_async(v7, block);

  objc_msgSend_purgeAll(self, v9, v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

+ (id)sharedPurger
{
  if (qword_1ED702898 != -1)
    dispatch_once(&qword_1ED702898, &unk_1E7833AE8);
  return (id)qword_1ED7028A0;
}

+ (void)schedulePeriodicPurgesInDirectory:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_sharedPurger(v4, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRootDirectory_(v8, v7, (uint64_t)v3);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)rootDirectories
{
  return self->_rootDirectories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDirectories, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
