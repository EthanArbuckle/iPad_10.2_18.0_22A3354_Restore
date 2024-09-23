@implementation CLSUtil

+ (BOOL)isAppleInternalInstall
{
  if (qword_1ED0FB830 != -1)
    dispatch_once(&qword_1ED0FB830, &unk_1E9749B70);
  return byte_1ED0FB828;
}

+ (BOOL)isSystemIntegrityEnabled
{
  if (qword_1EFE35FE8 != -1)
    dispatch_once(&qword_1EFE35FE8, &unk_1E974B990);
  return byte_1EFE35E50;
}

+ (id)percentageStringFromNumber:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend_percentNumberFormatter(a1, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v7, v8, (uint64_t)v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)percentNumberFormatter
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_threadDictionary(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("kCLSUtilPercentNumberFormatter"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend_setNumberStyle_(v8, v9, 3);
    objc_msgSend_setUsesGroupingSeparator_(v8, v10, 0);
    objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_threadDictionary(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v8, CFSTR("kCLSUtilPercentNumberFormatter"));

  }
  return v8;
}

+ (id)mediumStringFromDate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_mediumDateFormatter(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)stringFromTimeInterval:(double)a3
{
  uint64_t v3;

  if (qword_1ED0FB840 != -1)
    dispatch_once(&qword_1ED0FB840, &unk_1E974B9B0);
  return (id)MEMORY[0x1E0DE7D20](qword_1ED0FB838, sel_stringFromTimeInterval_, v3);
}

+ (id)mediumDateFormatter
{
  if (qword_1ED0FB850 != -1)
    dispatch_once(&qword_1ED0FB850, &unk_1E974B9D0);
  return (id)qword_1ED0FB848;
}

+ (id)dataFromPath:(id)a3 makeBackwardCompatible:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  id v14;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v24;
  id v25;
  uint64_t v26;
  id v27;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend_count(v7, v8, v9))
  {
    objc_msgSend_validatedContextIdentifierPathFromPath_(CLSContext, v10, (uint64_t)v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v27 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v12, v11, 1, &v27);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v27;
    if (v14)
    {
      v16 = v14;
      objc_msgSend_cls_debug_(v14, v15, CLSLogDefault);
      if (a5)
      {
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a5 = v16;
LABEL_18:

        v7 = (id)v11;
        goto LABEL_19;
      }
LABEL_11:
      v17 = 0;
      goto LABEL_18;
    }
    if (v6)
    {
      v25 = 0;
      v26 = 0;
      objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v15, (uint64_t)v13, 0, &v26, &v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      if (v19)
      {
        v16 = v19;
        objc_msgSend_cls_debug_(v19, v20, CLSLogDefault);
        if (a5)
          *a5 = objc_retainAutorelease(v16);

        goto LABEL_11;
      }
      v24 = 0;
      objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v20, (uint64_t)v18, v26, 0, &v24);
      v21 = objc_claimAutoreleasedReturnValue();
      v16 = v24;

      if (v16)
      {
        objc_msgSend_cls_debug_(v16, v22, CLSLogDefault);
        if (a5)
          *a5 = objc_retainAutorelease(v16);
      }

      v13 = (id)v21;
    }
    else
    {
      v16 = 0;
    }
    v13 = v13;
    v17 = v13;
    goto LABEL_18;
  }
  v17 = 0;
LABEL_19:

  return v17;
}

+ (id)pathFromData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cls_secureUnarchiveObjectOfClasses_withData_(v3, v10, (uint64_t)v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dataFromError:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;
  id v9;

  if (!a3)
    return 0;
  v9 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)a3, 1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v6 = v4;
  if (v4)
  {
    objc_msgSend_cls_debug_(v4, v5, CLSLogDefault);
    v7 = 0;
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

+ (id)errorFromData:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = a3;
    v5 = objc_opt_class();
    objc_msgSend_cls_secureUnarchiveObjectOfClass_withData_(v3, v6, v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)hashData:(id)a3 lastHash:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_dataUsingEncoding_(a4, v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hashData_lastHashData_(a1, v9, (uint64_t)v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hashData:(id)a3 lastHashData:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const void *v10;
  const char *v11;
  uint64_t v12;
  CC_LONG v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const void *v17;
  const char *v18;
  uint64_t v19;
  CC_LONG v20;
  const char *v21;
  id v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  CC_SHA256_CTX c;
  unsigned __int8 md[28];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  memset(&c, 0, sizeof(c));
  CC_SHA224_Init(&c);
  v7 = objc_retainAutorelease(v5);
  v10 = (const void *)objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  CC_SHA224_Update(&c, v10, v13);
  if (v6)
  {
    v14 = objc_retainAutorelease(v6);
    v17 = (const void *)objc_msgSend_bytes(v14, v15, v16);
    v20 = objc_msgSend_length(v14, v18, v19);
    CC_SHA224_Update(&c, v17, v20);
  }
  CC_SHA224_Final(md, &c);
  v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  for (i = 0; i != 28; ++i)
    objc_msgSend_appendFormat_(v22, v21, (uint64_t)CFSTR("%02x"), md[i]);
  v25 = (void *)objc_msgSend_copy(v22, v21, v24);

  return v25;
}

+ (id)hashArrayOfStrings:(id)a3 lastHash:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t i;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;

  v5 = a3;
  objc_msgSend_firstObject(v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend_count(v5, v8, v9);
    objc_msgSend_dataUsingEncoding_(v10, v12, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hashData_lastHash_(a1, v14, (uint64_t)v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 < 2)
    {
      v22 = v15;
    }
    else
    {
      for (i = 1; i != v11; ++i)
      {
        objc_msgSend_objectAtIndex_(v5, v16, i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dataUsingEncoding_(v18, v19, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_hashData_lastHash_(a1, v21, (uint64_t)v20, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v22;
      }
    }
  }
  else
  {
    objc_msgSend_data(MEMORY[0x1E0C99D50], v8, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hashData_lastHash_(a1, v24, (uint64_t)v23, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

+ (id)dictionaryStrippingNSNullValues:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  int isEqual;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v5 = v3;
  if (v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, v26, 16);
    v9 = v5;
    if (v6)
    {
      v10 = v6;
      v11 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v5);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend_null(MEMORY[0x1E0C99E38], v7, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v5, v16, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v15, v18, (uint64_t)v17);

          if (isEqual)
          {
            if (!v11)
              v11 = (void *)objc_msgSend_mutableCopy(v5, v7, v8);
            objc_msgSend_setObject_forKeyedSubscript_(v11, v7, 0, v14);
          }
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v22, v26, 16);
      }
      while (v10);
      v9 = v5;
      if (v11)
      {
        if (objc_msgSend_count(v11, v7, v8))
        {
          objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v20, (uint64_t)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)postNotification:(char *)a3
{
  uint32_t v4;
  NSObject *v5;
  int v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = notify_post(a3);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v5 = CLSLogDefault;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = a3;
      _os_log_error_impl(&dword_1D4054000, v5, OS_LOG_TYPE_ERROR, "Notification post failed: '%s'", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = a3;
    _os_log_impl(&dword_1D4054000, v5, OS_LOG_TYPE_INFO, "Notification posted: '%s'", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)postNotificationAsync:(char *)a3
{
  NSObject *v4;
  _QWORD block[5];

  clsNotificationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40AE080;
  block[3] = &unk_1E9749D50;
  block[4] = a3;
  dispatch_async(v4, block);

}

+ (id)userDefaultsConfigurationDictionaryAndReturnError:(id *)a3
{
  const char *v4;
  void *v5;
  dispatch_block_t v6;
  id v7;
  const char *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1D40AE2D0;
  v28 = sub_1D40AE2E0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1D40AE2D0;
  v22 = sub_1D40AE2E0;
  v23 = 0;
  objc_msgSend_sharedDefaults(CLSUserDefaults, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1E974B9F0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D40AE2EC;
    v14[3] = &unk_1E974BA18;
    v16 = &v18;
    v17 = &v24;
    v7 = v6;
    v15 = v7;
    objc_msgSend_userDefaultsConfigurationDictionaryWithCompletion_(v5, v8, (uint64_t)v14);
    v9 = dispatch_time(0, 60000000000);
    if (!dispatch_block_wait(v7, v9))
      goto LABEL_6;
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1D4054000, v10, OS_LOG_TYPE_ERROR, "Timed out when getting user defaults configuration dictionary!", v13, 2u);
      if (!a3)
        goto LABEL_8;
    }
    else
    {
LABEL_6:
      if (!a3)
      {
LABEL_8:
        v11 = (id)v19[5];

        goto LABEL_12;
      }
    }
    *a3 = objc_retainAutorelease((id)v25[5]);
    goto LABEL_8;
  }
  if (a3)
  {
    objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v4, 4, CFSTR("Not authorized to userDefaultsConfigurationDictionaryAndReturnError"));
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

+ (void)fetchInfoForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, void *, void *);
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  id v27;

  v27 = a3;
  v5 = (void (**)(id, void *, void *, void *))a4;
  v6 = (void *)MEMORY[0x1D82573E4]();
  if (objc_msgSend_length(v27, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0CA5870]);
    v11 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v9, v10, (uint64_t)v27, 0, 0);
    v14 = v11;
    if (v11)
    {
      objc_msgSend_localizedName(v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_teamIdentifier(v14, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_iTunesMetadata(v14, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_storeItemIdentifier(v21, v22, v23);
      if (v24)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("%lld"), v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
      v18 = 0;
      v15 = 0;
    }

  }
  else
  {
    v26 = 0;
    v18 = 0;
    v15 = 0;
  }
  v5[2](v5, v15, v26, v18);

  objc_autoreleasePoolPop(v6);
}

@end
