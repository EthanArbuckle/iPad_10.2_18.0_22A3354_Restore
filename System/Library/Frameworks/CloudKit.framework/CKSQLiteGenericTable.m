@implementation CKSQLiteGenericTable

+ (id)uniqueSubclassClassNameForClassName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSString *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("%@_%@"), v8, v6, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (NSClassFromString((NSString *)v9))
  {
    v10 = 0;
    do
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("%@_%@_%u"), v14, v12, v4, v10);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();

      v10 = (v10 + 1);
      v9 = v15;
    }
    while (NSClassFromString(v15));
  }
  else
  {
    v15 = (NSString *)v9;
  }

  return v15;
}

+ (Class)genericTableClassForTOCTableEntry:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  objc_class *v32;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend_propertyData(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbVersion(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("dbVersion");
  v34[1] = CFSTR("propertyData");
  v35[0] = v13;
  v35[1] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v35, (uint64_t)v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend_objectForKey_(0, v16, (uint64_t)v15, v17);
  if (!v21)
  {
    objc_msgSend_creatingClass(v4, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniqueSubclassClassNameForClassName_(a1, v23, (uint64_t)v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend_unsignedIntegerValue(v13, v26, v27, v28);
    v21 = (id)objc_msgSend_tableClassWithName_properties_version_entryClass_(a1, v30, (uint64_t)v25, (uint64_t)v9, v29, 0);
    objc_msgSend_setObject_forKey_(0, v31, (uint64_t)v21, (uint64_t)v15);

  }
  objc_sync_exit(v5);

  v32 = (objc_class *)v21;
  return v32;
}

+ (id)genericTableForTOCEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
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

  v4 = a3;
  v7 = objc_alloc((Class)objc_msgSend_genericTableClassForTOCTableEntry_(a1, v5, (uint64_t)v4, v6));
  objc_msgSend_logicalTableName(v4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithLogicalTableName_(v7, v12, (uint64_t)v11, v13);

  objc_msgSend_dbTableName(v4, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDbTableName_(v14, v19, (uint64_t)v18, v20);
  return v14;
}

+ (BOOL)useNSCoding
{
  return 0;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return (id)objc_msgSend_objectForKey_(a5, a2, (uint64_t)a3, (uint64_t)a4);
}

- (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return (id)objc_msgSend_objectForKey_(a5, a2, (uint64_t)a3, (uint64_t)a4);
}

+ (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
  if (a3)
    objc_msgSend_setObject_forKey_(a6, a2, (uint64_t)a3, (uint64_t)a4, a5);
  else
    objc_msgSend_removeObjectForKey_(a6, a2, (uint64_t)a4, (uint64_t)a4, a5);
}

- (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
  if (a3)
    objc_msgSend_setObject_forKey_(a6, a2, (uint64_t)a3, (uint64_t)a4, a5);
  else
    objc_msgSend_removeObjectForKey_(a6, a2, (uint64_t)a4, (uint64_t)a4, a5);
}

@end
