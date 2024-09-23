@implementation APSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  APSettingsStorageFile *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = [APSettingsStorageFile alloc];
  v7 = (void *)objc_msgSend_initWithDefaultValues_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)settings
{
  objc_class *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  NSObject *v13;
  uint8_t v15[16];

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mapTable(a1, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init((Class)objc_opt_class());
    if (v11)
    {
      objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, (uint64_t)v4);
    }
    else
    {
      APLogForCategory(0x29uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_ERROR, "Failed to initialize settings storage.", v15, 2u);
      }

      v11 = 0;
    }
  }
  objc_sync_exit(v8);

  return v11;
}

+ (NSMapTable)mapTable
{
  if (qword_1ED2BC758 != -1)
    dispatch_once(&qword_1ED2BC758, &unk_1E8C47F90);
  return (NSMapTable *)(id)qword_1ED2BC700;
}

- (APSettings)init
{
  APSettings *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  APSettingsStorableProtocol *storage;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APSettings;
  v2 = -[APSettings init](&v14, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_class();
    objc_msgSend_defaultValues(v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    objc_msgSend_storageWithDefaultValues_(v8, v9, (uint64_t)v7, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    storage = v2->_storage;
    v2->_storage = (APSettingsStorableProtocol *)v11;

  }
  return v2;
}

+ (id)defaultValues
{
  return 0;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id location;

  v4 = a3;
  v8 = (const char *)objc_msgSend_selector(v4, v5, v6, v7);
  NSStringFromSelector(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasPrefix_(v9, v10, (uint64_t)CFSTR("set"), v11))
  {
    objc_msgSend__propertyNameFromSetSelectorString_(self, v12, (uint64_t)v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_msgSend_getArgument_atIndex_(v4, v15, (uint64_t)&location, 2);
    v16 = objc_loadWeakRetained(&location);
    objc_msgSend_setValue_forUndefinedKey_(self, v17, (uint64_t)v16, (uint64_t)v14);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_valueForUndefinedKey_(self, v12, (uint64_t)v9, v13);
    location = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_retainArguments(v4, v18, v19, v20);
    objc_msgSend_setReturnValue_(v4, v21, (uint64_t)&location, v22);

  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  objc_msgSend__gatherSubclassProperties(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10))
  {
    objc_msgSend_storage(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__namespacedKey_(self, v15, (uint64_t)v4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v14, v18, (uint64_t)v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (APSettingsStorableProtocol)storage
{
  return self->_storage;
}

- (id)_namespacedKey:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("%@%@%@"), v8, v6, CFSTR("."), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__gatherSubclassProperties(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_hasPrefix_(v5, v10, (uint64_t)CFSTR("set"), v11))
  {
    if (objc_msgSend_containsObject_(v9, v12, (uint64_t)v5, v13))
    {
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v20, (uint64_t)"@@:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v19 = (void *)v22;
      goto LABEL_9;
    }
LABEL_7:
    v24.receiver = self;
    v24.super_class = (Class)APSettings;
    -[APSettings methodSignatureForSelector:](&v24, sel_methodSignatureForSelector_, a3);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend__propertyNameFromSetSelectorString_(self, v12, (uint64_t)v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_containsObject_(v9, v15, (uint64_t)v14, v16))
  {

    goto LABEL_7;
  }
  objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v17, (uint64_t)"v@:@", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v19;
}

- (id)_gatherSubclassProperties
{
  objc_class *v2;
  objc_property_t *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  unint64_t i;
  void *v9;
  const char *Name;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unsigned int outCount;

  outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  v3 = class_copyPropertyList(v2, &outCount);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend_initWithCapacity_(v4, v5, outCount, v6);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      Name = property_getName(v3[i]);
      objc_msgSend_stringWithUTF8String_(v9, v11, (uint64_t)Name, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v14, (uint64_t)v13, v15);

    }
  }
  free(v3);
  return v7;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  objc_msgSend__gatherSubclassProperties(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v10, v11, (uint64_t)v6, v12))
  {
    objc_msgSend_storage(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__namespacedKey_(self, v17, (uint64_t)v6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v20, (uint64_t)v21, (uint64_t)v19);

  }
}

- (id)_propertyNameFromSetSelectorString:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
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
  void *v24;

  objc_msgSend_substringFromIndex_(a3, a2, 3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_length(v4, v5, v6, v7);
  objc_msgSend_substringToIndex_(v4, v9, v8 - 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_substringToIndex_(v11, v12, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v11, v19, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v18, v22, (uint64_t)v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)synchronize
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_storage(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronize(v7, v4, v5, v6);

}

@end
