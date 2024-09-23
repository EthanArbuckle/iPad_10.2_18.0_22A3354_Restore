@implementation APConfigurationMediator

+ (id)configurationForClass:(Class)a3 usingCache:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  char isKindOfClass;
  const char *v9;
  uint64_t v10;
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
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  id v26;
  APConfiguration *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  id v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v4 = a4;
  v74 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(a3);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    APLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v69 = (id)objc_opt_class();
      v26 = v69;
      _os_log_impl(&dword_235C39000, v25, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, class is not Subclass of APConfiguration", buf, 0xCu);

    }
    APSimulateCrash();
    v27 = [APConfiguration alloc];
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v28, v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(APConfigurationCache, v30, v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithConfig_notifier_(v27, v33, (uint64_t)v11, v32);
    goto LABEL_19;
  }
  objc_msgSend_path(a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v11, v12, v13))
  {
    APLogForCategory();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = (void *)objc_opt_class();
      v56 = v55;
      NSStringFromClass(a3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v69 = v55;
      v70 = 2113;
      v71 = v57;
      _os_log_impl(&dword_235C39000, v54, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, getting path for class %{private}@", buf, 0x16u);

    }
    APSimulateCrash();
    v58 = [a3 alloc];
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v59, v60);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(APConfigurationCache, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithConfig_notifier_(v58, v64, (uint64_t)v32, v63);

    goto LABEL_19;
  }
  if (!v4)
    goto LABEL_9;
  objc_msgSend_sharedInstance(APConfigurationCache, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(a3, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configurationForPath_(v16, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_9:
    v67 = 0;
    objc_msgSend__loadFromJSONForClass_error_(a1, v14, (uint64_t)a3, &v67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v67;
    if (v32)
    {
      APLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_opt_class();
        v38 = v37;
        objc_msgSend_localizedFailureReason(v32, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userInfo(v32, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v69 = v37;
        v70 = 2113;
        v71 = v41;
        v72 = 2113;
        v73 = v44;
        _os_log_impl(&dword_235C39000, v36, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to load file, error: %{private}@ %{private}@", buf, 0x20u);

      }
      APSimulateCrash();
      v45 = [a3 alloc];
      objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedInstance(APConfigurationCache, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_initWithConfig_notifier_(v45, v52, (uint64_t)v48, v51);

      v21 = (void *)v53;
    }
    else
    {
      if (!v4)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend_sharedInstance(APConfigurationCache, v34, v35);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setConfiguration_(v48, v65, (uint64_t)v21);
    }

    goto LABEL_19;
  }
  objc_msgSend_sharedInstance(APConfigurationCache, v14, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recentlyAccessedObject_(v23, v24, (uint64_t)v21);

LABEL_20:
  return v21;
}

+ (NSString)configSystemDirectoryPath
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v13, v14, (uint64_t)CFSTR("APCS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

+ (id)configurationForClass:(Class)a3
{
  return (id)MEMORY[0x24BEDD108](a1, sel_configurationForClass_usingCache_, a3);
}

+ (NSString)resourcesBundleDirectoryPath
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend__resourcesBundleDirectoryPathError_(a1, a2, (uint64_t)&v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_resourcesBundleDirectoryPathError:(id *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], a2, (uint64_t)CFSTR("com.apple.ap.APConfigurationSystem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend_pathForResource_ofType_(v5, v6, (uint64_t)CFSTR("APCS"), &stru_2506FE700);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (v8)
    {
      v11 = v8;
    }
    else if (a3)
    {
      objc_msgSend__configSystemErrorWithDescription_(a1, v9, (uint64_t)CFSTR("Error Loading Default Bundle: Unable to get path to resources."));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a3)
  {
    objc_msgSend__configSystemErrorWithDescription_(a1, v6, (uint64_t)CFSTR("Error Loading Default Bundle: Unable to get bundle."));
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_loadFromJSONForClass:(Class)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  id v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(a3, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v13, v14, (uint64_t)CFSTR("ConfigurationNode.json"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v10, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_fileExistsAtPath_(v7, v18, (uint64_t)v17))
  {
    objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v19, (uint64_t)v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v20, (uint64_t)v21, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = [a3 alloc];
        objc_msgSend_sharedInstance(APConfigurationCache, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend_initWithConfig_notifier_(v23, v27, (uint64_t)v22, v26);

      }
      else
      {
        APLogForCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          v39 = (id)objc_opt_class();
          v37 = v39;
          _os_log_impl(&dword_235C39000, v33, OS_LOG_TYPE_ERROR, "[%{private}@]: Error parsing JSON file.", buf, 0xCu);

        }
        objc_msgSend__removeFileAtPath_(a1, v34, (uint64_t)v17);
        objc_msgSend__loadFromDefaultsForClass_error_(a1, v35, (uint64_t)a3, a4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      APLogForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v39 = (id)objc_opt_class();
        v30 = v39;
        _os_log_impl(&dword_235C39000, v29, OS_LOG_TYPE_ERROR, "[%{private}@]: Error getting data for JSON", buf, 0xCu);

      }
      objc_msgSend__removeFileAtPath_(a1, v31, (uint64_t)v17);
      objc_msgSend__loadFromDefaultsForClass_error_(a1, v32, (uint64_t)a3, a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend__loadFromDefaultsForClass_error_(a1, v19, (uint64_t)a3, a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

+ (id)_loadFromDefaultsForClass:(Class)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;

  objc_msgSend__resourcesBundleDirectoryPathError_(a1, a2, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_path(a3, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v9, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v12, v13, (uint64_t)CFSTR("ConfigurationNode.json"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_fileExistsAtPath_(v17, v18, (uint64_t)v14))
    {
      objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v19, (uint64_t)v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v20, (uint64_t)v21, 0, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = [a3 alloc];
          objc_msgSend_sharedInstance(APConfigurationCache, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend_initWithConfig_notifier_(v24, v28, (uint64_t)v23, v27);

        }
        else if (a4)
        {
          objc_msgSend__configSystemErrorWithDescription_(a1, v22, (uint64_t)CFSTR("Error Loading Default Bundle: Dictionary for default node is nil."));
          v29 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
        }

      }
      else if (a4)
      {
        objc_msgSend__configSystemErrorWithDescription_(a1, v20, (uint64_t)CFSTR("Error Loading Default Bundle: Data for default node is nil."));
        v29 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }

    }
    else if (a4)
    {
      objc_msgSend__configSystemErrorWithDescription_(a1, v19, (uint64_t)CFSTR("Error Loading Default Bundle: JSON file for Node doesn't exist."));
      v29 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (id)_configSystemErrorWithDescription:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1540];
  v4 = a3;
  v5 = [v3 alloc];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("CPConfigSystem"), 0, v7);
  return v9;
}

+ (void)_removeFileAtPath:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend_defaultManager(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend_removeItemAtPath_error_(v7, v8, (uint64_t)v4, &v19);

  v9 = v19;
  if (v9)
  {
    APLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend_localizedFailureReason(v9, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(v9, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v21 = v11;
      v22 = 2113;
      v23 = v15;
      v24 = 2113;
      v25 = v18;
      _os_log_impl(&dword_235C39000, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed delete corrupted file, error: %{private}@ %{private}@", buf, 0x20u);

    }
  }

}

@end
