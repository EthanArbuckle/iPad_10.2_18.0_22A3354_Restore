@implementation CKSQLiteTable

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void (*v13)(void);
  objc_class *Class;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  _QWORD aBlock[5];

  v6 = (void *)objc_msgSend_entryClass(a1, a2, v2, v3);
  if (v6)
  {
    v10 = v6;
    if (objc_msgSend__cksql_isTableEntry(v6, v7, v8, v9))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_18A6C3CF4;
      aBlock[3] = &unk_1E1F5FCA0;
      aBlock[4] = a1;
      v11 = _Block_copy(aBlock);
      v12 = _Block_copy(v11);
      v13 = imp_implementationWithBlock(v12);

      Class = object_getClass(v10);
      if (!class_addMethod(Class, sel_tableClass, v13, 0))
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)a1, CFSTR("CKSQLiteTable.m"), 474, CFSTR("failed to add method"));

      }
    }
  }
  if ((id)objc_opt_class() == a1)
  {
    qword_1EDF6F738 = (uint64_t)objc_getClass("CKSQLiteUnsetPropertySentinel");
    v18 = objc_alloc(MEMORY[0x1E0C99E08]);
    v21 = objc_msgSend_initWithCapacity_(v18, v19, 32, v20);
    v22 = (void *)qword_1EDF6F740;
    qword_1EDF6F740 = v21;

  }
}

+ (BOOL)shouldValidateEntryClass
{
  return 1;
}

+ (unint64_t)dbVersion
{
  return 1;
}

+ (Class)entryClass
{
  return 0;
}

+ (id)dbProperties
{
  return 0;
}

+ (void)enumerateClassPropertyDictionariesWithBlock:(id)a3
{
  void (**v4)(id, id, char *);
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void (*v9)(id, char *);
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v4 = (void (**)(id, id, char *))a3;
  v7 = (id)objc_opt_class();
  v8 = 0;
  v16 = 0;
  do
  {
    v9 = (void (*)(id, char *))objc_msgSend_methodForSelector_(a1, v5, (uint64_t)sel_dbProperties, v6);
    v9(a1, sel_dbProperties);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 != v8)
    {
      v12 = v10;

      v4[2](v4, v12, &v16);
      v8 = v12;
    }
    if (a1 == v7)
      v16 = 1;

    a1 = (id)objc_msgSend_superclass(a1, v13, v14, v15);
  }
  while (!v16);

}

+ (void)enumeratePropertyDataWithBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6C3E78;
  v8[3] = &unk_1E1F5FCF0;
  v9 = v4;
  v7 = v4;
  objc_msgSend_enumerateClassPropertyDictionariesWithBlock_(a1, v5, (uint64_t)v8, v6);

}

+ (unsigned)propertyCount
{
  uint64_t v2;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A6C3FDC;
  v5[3] = &unk_1E1F5FD18;
  v5[4] = &v6;
  objc_msgSend_enumerateClassPropertyDictionariesWithBlock_(a1, a2, (uint64_t)v5, v2);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)allPropertyNames
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6C4094;
  v8[3] = &unk_1E1F5FD40;
  v4 = v3;
  v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v5, (uint64_t)v8, v6);

  return v4;
}

+ (id)propertyInfo:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18A6C4188;
  v17 = sub_18A6C4198;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6C41A0;
  v10[3] = &unk_1E1F5FD68;
  v12 = &v13;
  v5 = v4;
  v11 = v5;
  objc_msgSend_enumerateClassPropertyDictionariesWithBlock_(a1, v6, (uint64_t)v10, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)flattenedDBProperties
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6C427C;
  v8[3] = &unk_1E1F5FD40;
  v4 = v3;
  v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v5, (uint64_t)v8, v6);

  return v4;
}

+ (Class)tableClassWithName:(id)a3 properties:(id)a4 version:(unint64_t)a5 entryClass:(Class)a6
{
  NSString *v10;
  id v11;
  void *v12;
  Class ClassPair;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  objc_class *Class;
  void *v26;
  void (*v27)(void);
  void *v28;
  objc_class *v29;
  void *v30;
  void (*v31)(void);
  void *v32;
  objc_class *v33;
  void *v34;
  void (*v35)(void);
  objc_class *v36;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD aBlock[4];
  id v41;

  v10 = (NSString *)a3;
  v11 = a4;
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  ClassPair = NSClassFromString(v10);
  if (!ClassPair)
  {
    v14 = objc_retainAutorelease(v10);
    v18 = (const char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
    ClassPair = objc_allocateClassPair((Class)a1, v18, 0);
    v22 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_18A6C4504;
      aBlock[3] = &unk_1E1F5FD90;
      v23 = (id)objc_msgSend_copy(v11, v19, v20, v21);
      v41 = v23;
      v24 = _Block_copy(aBlock);
      Class = object_getClass(ClassPair);
      v26 = _Block_copy(v24);
      v27 = imp_implementationWithBlock(v26);
      class_addMethod(Class, sel_dbProperties, v27, 0);

      v22 = MEMORY[0x1E0C809B0];
    }
    if (a5)
    {
      v39[0] = v22;
      v39[1] = 3221225472;
      v39[2] = sub_18A6C450C;
      v39[3] = &unk_1E1F5FDB0;
      v39[4] = a5;
      v28 = _Block_copy(v39);
      v29 = object_getClass(ClassPair);
      v30 = _Block_copy(v28);
      v31 = imp_implementationWithBlock(v30);
      class_addMethod(v29, sel_dbVersion, v31, 0);

    }
    if (a6)
    {
      v38[0] = v22;
      v38[1] = 3221225472;
      v38[2] = sub_18A6C4514;
      v38[3] = &unk_1E1F5FDD0;
      v38[4] = a6;
      v32 = _Block_copy(v38);
      v33 = object_getClass(ClassPair);
      v34 = _Block_copy(v32);
      v35 = imp_implementationWithBlock(v34);
      class_addMethod(v33, sel_entryClass, v35, 0);

    }
    objc_registerClassPair(ClassPair);
  }
  objc_sync_exit(v12);

  v36 = ClassPair;
  return v36;
}

+ (void)encodeEntry:(id)a3 withCoder:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6C45C0;
  v12[3] = &unk_1E1F5FDF8;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v8 = v7;
  v11 = v6;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v9, (uint64_t)v12, v10);

}

+ (void)decodeEntry:(id)a3 withCoder:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6C46E8;
  v12[3] = &unk_1E1F5FDF8;
  v14 = v6;
  v15 = a1;
  v13 = v7;
  v8 = v6;
  v11 = v7;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v9, (uint64_t)v12, v10);

}

+ (unint64_t)hashForEntry:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6C48CC;
  v10[3] = &unk_1E1F5FE20;
  v12 = &v14;
  v13 = a1;
  v5 = v4;
  v11 = v5;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v6, (uint64_t)v10, v7);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (BOOL)entriesHaveEqualProperties:(id)a3 other:(id)a4 includePrimaryKeys:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A6C4A60;
  v15[3] = &unk_1E1F5FE48;
  v20 = a5;
  v19 = a1;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v17 = v11;
  v18 = &v21;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v12, (uint64_t)v15, v13);
  LOBYTE(a1) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)a1;
}

+ (id)copyOfEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v8 = objc_alloc_init((Class)objc_msgSend_entryClass(a1, v5, v6, v7));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A6C4BF0;
  v13[3] = &unk_1E1F5FE70;
  v14 = v4;
  v15 = a1;
  v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v10, (uint64_t)v13, v11);

  return v8;
}

+ (id)descriptionOfProperties:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  const char *v23;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v10)
  {
    v13 = v10;
    v14 = 1;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16);
        if ((v14 & 1) == 0)
          objc_msgSend_appendString_(v8, v11, (uint64_t)CFSTR(", "), v12);
        objc_msgSend_propertyInfo_(a1, v11, v17, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_unsignedIntValue(v18, v19, v20, v21);
        objc_msgSend_valueForProperty_propertyInfo_inObject_allowFetchingUnsetPropertySentinel_(a1, v23, v17, (uint64_t)v18, v7, 1);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v27 = v24;
        if (v24 == (__CFString *)qword_1EDF6F738)
        {

          v27 = CFSTR("<unfetched>");
        }
        if (v22 == 8)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("{ %@ }"), v26, v27);
          v28 = objc_claimAutoreleasedReturnValue();

          v27 = (__CFString *)v28;
        }
        objc_msgSend_appendFormat_(v8, v25, (uint64_t)CFSTR("%@ = %@"), v26, v17, v27);

        v14 = 0;
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v31, (uint64_t)v35, 16);
      v14 = 0;
    }
    while (v13);
  }

  return v8;
}

+ (id)descriptionOfEntry:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  __CFString *v37;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithFormat_(v5, v8, (uint64_t)CFSTR("%@(%p): "), v9, v7, v4);

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_18A6C4188;
  v36[4] = sub_18A6C4198;
  v37 = &stru_1E1F66ED0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_18A6C4188;
  v34 = sub_18A6C4198;
  v35 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_18A6C5048;
  v24[3] = &unk_1E1F5FE98;
  v29 = a1;
  v11 = v4;
  v25 = v11;
  v27 = &v30;
  v12 = v10;
  v26 = v12;
  v28 = v36;
  objc_msgSend_enumeratePropertyDataWithBlock_(a1, v13, (uint64_t)v24, v14);
  v17 = (void *)v31[5];
  if (v17)
  {
    objc_msgSend_componentsJoinedByString_(v17, v15, (uint64_t)CFSTR(", "), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v19, (uint64_t)CFSTR(" (unfetched: %@)"), v20, v18);

  }
  v21 = v26;
  v22 = v12;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v36, 8);

  return v22;
}

+ (BOOL)useNSCoding
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_entryClass(a1, a2, v2, v3);
  return MEMORY[0x1E0DE7D20](v4, sel_instancesRespondToSelector_, sel_initWithCoder_, v5);
}

- (CKSQLiteTable)init
{
  objc_class *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  CKSQLiteTable *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CKSQLiteTable *)objc_msgSend_initWithLogicalTableName_(self, v5, (uint64_t)v4, v6);

  return v7;
}

- (CKSQLiteTable)initWithLogicalTableName:(id)a3
{
  id v5;
  CKSQLiteTable *v6;
  CKSQLiteTable *v7;
  unint64_t *p_flags;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  CKSQLiteTable *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  NSString *primaryKeyProperty;
  NSNumber *primaryKeyPropertyInfo;
  uint64_t v26;
  NSArray *primaryKeyProperties;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  CKSQLiteTable *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  objc_super v49;

  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CKSQLiteTable;
  v6 = -[CKSQLiteTable init](&v49, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logicalTableName, a3);
    p_flags = &v7->_flags;
    do
    {
      while (1)
      {
        v9 = *p_flags;
        v10 = __ldxr(p_flags);
        if (v10 == v9)
          break;
        __clrex();
      }
    }
    while (__stxr(v9 | 1, p_flags));
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_18A6C4188;
    v47 = sub_18A6C4198;
    v48 = 0;
    v11 = (void *)objc_opt_class();
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = sub_18A6C5428;
    v40 = &unk_1E1F5FEC0;
    v42 = &v43;
    v12 = v7;
    v41 = v12;
    objc_msgSend_enumeratePropertyDataWithBlock_(v11, v13, (uint64_t)&v37, v14);
    v18 = objc_msgSend_count((void *)v44[5], v15, v16, v17, v37, v38, v39, v40);
    if (v18 >= 2)
    {
      do
      {
        while (1)
        {
          v22 = *p_flags;
          v23 = __ldxr(p_flags);
          if (v23 == v22)
            break;
          __clrex();
        }
      }
      while (__stxr(v22 & 0xFFFFFFFFFFFFFFFELL, p_flags));
      primaryKeyProperty = v12->_primaryKeyProperty;
      v12->_primaryKeyProperty = 0;

      primaryKeyPropertyInfo = v12->_primaryKeyPropertyInfo;
      v12->_primaryKeyPropertyInfo = 0;

    }
    v26 = objc_msgSend_copy((void *)v44[5], v19, v20, v21);
    primaryKeyProperties = v12->_primaryKeyProperties;
    v12->_primaryKeyProperties = (NSArray *)v26;

    v28 = (void *)objc_opt_class();
    if ((objc_msgSend_useNSCoding(v28, v29, v30, v31) & 1) != 0)
    {
      do
      {
        while (1)
        {
          v32 = *p_flags;
          v33 = __ldxr(p_flags);
          if (v33 == v32)
            break;
          __clrex();
        }
      }
      while (__stxr(v32 | 8, p_flags));
    }
    else
    {
      do
      {
        while (1)
        {
          v34 = *p_flags;
          v35 = __ldxr(p_flags);
          if (v35 == v34)
            break;
          __clrex();
        }
      }
      while (__stxr(v34 & 0xFFFFFFFFFFFFFFF7, p_flags));
    }

    _Block_object_dispose(&v43, 8);
  }

  return v7;
}

- (void)dealloc
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = (id)qword_1EDF6F740;
  objc_sync_enter(v3);
  objc_msgSend_removeAllObjects((void *)qword_1EDF6F740, v4, v5, v6);
  objc_sync_exit(v3);

  v7.receiver = self;
  v7.super_class = (Class)CKSQLiteTable;
  -[CKSQLiteTable dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *logicalTableName;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  logicalTableName = self->_logicalTableName;
  objc_msgSend_tableGroup(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("%@(%p) named %@ in group %@, dbTable: %@"), v16, v5, self, logicalTableName, v14, self->_dbTableName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)didCreateDatabaseTable
{
  return 0;
}

- (id)wakeFromDatabase
{
  return 0;
}

- (id)finishInitializing
{
  return 0;
}

+ (id)nonKeyProperties
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_class *Class;
  void *v16;
  void (*v17)(void);
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18A6C585C;
  v22[3] = &unk_1E1F5FD40;
  v23 = v4;
  v7 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(v5, v8, (uint64_t)v22, v9);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = sub_18A6C58A8;
  v20[3] = &unk_1E1F5FEE8;
  v13 = (id)objc_msgSend_copy(v7, v10, v11, v12);
  v21 = v13;
  v14 = _Block_copy(v20);
  Class = object_getClass(a1);
  v16 = _Block_copy(v14);
  v17 = imp_implementationWithBlock(v16);
  class_addMethod(Class, a2, v17, 0);

  v18 = v13;
  return v18;
}

- (void)setTableGroup:(id)a3
{
  CKSQLiteTableGroup **p_tableGroup;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKSQLiteDatabase *v9;
  CKSQLiteDatabase *db;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  p_tableGroup = &self->_tableGroup;
  v5 = a3;
  objc_storeWeak((id *)p_tableGroup, v5);
  objc_msgSend_db(v5, v6, v7, v8);
  v9 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  self->_db = v9;

  v14 = (id)objc_msgSend_setupReferencedTableCache(self, v11, v12, v13);
}

- (id)db
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  const char *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableGroup);
  if (!WeakRetained)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteTable.m"), 869, CFSTR("nil table group in %@"), v12);

  }
  objc_msgSend_db(WeakRetained, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)serialize:(id)a3
{
  pthread_mutex_t *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = _CKSQLDBSerializerLock((uint64_t)&self->_db->_serializer);
  v5[2]();
  if (v4)
  {
    v4[1].__sig = 0;
    pthread_mutex_unlock(v4);
  }

}

- (id)performTransaction:(id)a3
{
  CKSQLiteTableGroup **p_tableGroup;
  id v4;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  void *v8;

  p_tableGroup = &self->_tableGroup;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tableGroup);
  objc_msgSend_performTransaction_(WeakRetained, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)performInTransaction:(id)a3
{
  CKSQLiteTableGroup **p_tableGroup;
  id v4;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  void *v8;

  p_tableGroup = &self->_tableGroup;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tableGroup);
  objc_msgSend_performInTransaction_(WeakRetained, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addTransactionCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTransactionCompletionHandler_(v10, v8, (uint64_t)v4, v9);

}

- (void)setDbTableName:(id)a3
{
  objc_storeStrong((id *)&self->_dbTableName, a3);
}

- (id)checkConstraintForProperty:(id)a3
{
  return 0;
}

- (id)createTableSQL
{
  id v4;
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSArray *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  id v71;
  id v72;
  const char *v73;
  uint64_t v74;
  id v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v91;
  objc_class *v92;
  void *v93;
  const char *v94;
  id v95;
  id v96;
  id obj;
  id obja;
  CKSQLiteTable *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[4];
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  CKSQLiteTable *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = sub_18A6C4188;
  v139 = sub_18A6C4198;
  v140 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v99 = self;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_dbTableName(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v4, v12, (uint64_t)CFSTR("CREATE TABLE '%@' ("), v13, v11);

  v131 = 0;
  v132 = &v131;
  v133 = 0x2020000000;
  v134 = 1;
  v14 = (void *)objc_opt_class();
  v121[0] = MEMORY[0x1E0C809B0];
  v121[1] = 3221225472;
  v121[2] = sub_18A6C63AC;
  v121[3] = &unk_1E1F5FF30;
  v128 = &v131;
  v15 = v4;
  v122 = v15;
  v123 = self;
  obj = v5;
  v124 = obj;
  v127 = &unk_1E1F58318;
  v96 = v6;
  v125 = v96;
  v130 = 0xFC00000003F0000;
  v95 = v7;
  v126 = v95;
  v129 = &v135;
  objc_msgSend_enumeratePropertyDataWithBlock_(v14, v16, (uint64_t)v121, v17);
  if (*((_BYTE *)v132 + 24))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19, v20);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (objc_class *)objc_opt_class();
    NSStringFromClass(v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v91, v94, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteTable.m"), 971, CFSTR("Table class %@ defines no properties"), v93);

  }
  if (objc_msgSend_count(self->_primaryKeyProperties, v18, v19, v20))
  {
    objc_msgSend_appendString_(v15, v21, (uint64_t)CFSTR(", PRIMARY KEY ("), v22);
    *((_BYTE *)v132 + 24) = 1;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v23 = self->_primaryKeyProperties;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v117, (uint64_t)v144, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v118;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v118 != v28)
            objc_enumerationMutation(v23);
          v30 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
          if (*((_BYTE *)v132 + 24))
            *((_BYTE *)v132 + 24) = 0;
          else
            objc_msgSend_appendString_(v15, v25, (uint64_t)CFSTR(","), v26);
          objc_msgSend_appendString_(v15, v25, v30, v26);
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v117, (uint64_t)v144, 16);
      }
      while (v27);
    }

    objc_msgSend_appendString_(v15, v31, (uint64_t)CFSTR(")"), v32);
  }
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = sub_18A6C66EC;
  v115[3] = &unk_1E1F5FF58;
  v33 = v15;
  v116 = v33;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v96, v34, (uint64_t)v115, v35);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v36 = (id)v136[5];
  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v111, (uint64_t)v143, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v112 != v41)
          objc_enumerationMutation(v36);
        v43 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j);
        objc_msgSend_tableForReferenceProperty_(v99, v38, v43, v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_primaryKeyProperty(v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dbTableName(v44, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v33, v53, (uint64_t)CFSTR(", FOREIGN KEY(%@) REFERENCES '%@'(%@)"), v54, v43, v52, v48);

      }
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v111, (uint64_t)v143, 16);
    }
    while (v40);
  }

  objc_msgSend_appendString_(v33, v55, (uint64_t)CFSTR(");"), v56);
  objc_msgSend_dbTableName(v99, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  obja = obj;
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v61, (uint64_t)&v107, (uint64_t)v142, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v108 != v65)
          objc_enumerationMutation(obja);
        v67 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * k);
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v62, (uint64_t)CFSTR("%@.index_%@"), v63, v60, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v33, v69, (uint64_t)CFSTR("CREATE INDEX '%@' on '%@' (%@);"), v70, v68, v60, v67);

      }
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v62, (uint64_t)&v107, (uint64_t)v142, 16);
    }
    while (v64);
  }

  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = sub_18A6C6768;
  v104[3] = &unk_1E1F5FF80;
  v71 = v60;
  v105 = v71;
  v72 = v33;
  v106 = v72;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v95, v73, (uint64_t)v104, v74);
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v75 = (id)v136[5];
  v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v100, (uint64_t)v141, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v101;
    do
    {
      for (m = 0; m != v79; ++m)
      {
        if (*(_QWORD *)v101 != v80)
          objc_enumerationMutation(v75);
        v82 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * m);
        objc_msgSend_tableForReferenceProperty_(v99, v77, v82, v78);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_refcountTriggerSQLForProperty_inTable_(v83, v84, v82, (uint64_t)v99);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v72, v86, (uint64_t)v85, v87);

      }
      v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v77, (uint64_t)&v100, (uint64_t)v141, 16);
    }
    while (v79);
  }

  v88 = v106;
  v89 = v72;

  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);

  return v89;
}

- (id)extraGroupTables:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, v3);
}

+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5 allowFetchingUnsetPropertySentinel:(BOOL)a6
{
  return sub_18A6C684C(a3, a5, a4, a6);
}

+ (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return sub_18A6C684C(a3, a5, a4, 0);
}

- (id)valueForProperty:(id)a3 propertyInfo:(id)a4 inObject:(id)a5
{
  return sub_18A6C684C(a3, a5, a4, 0);
}

+ (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
  sub_18A6C6E1C(a3, a4, a5, a6);
}

- (void)setValue:(id)a3 forProperty:(id)a4 propertyInfo:(id)a5 inObject:(id)a6
{
  sub_18A6C6E1C(a3, a4, a5, a6);
}

- (id)primaryKeyValuesInEntry:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_primaryKeyProperties(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v10, (uint64_t)v9, (uint64_t)v5, &v21, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;

  if (v12)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_error_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("%@"), v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v17, v18, v19, v20);
    _os_crash();
    __break(1u);
  }

  return v11;
}

- (id)predicateForMatchingPrimaryKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_primaryKeyProperties(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__predicateForMatchingProperties_(self, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requestCallbackWithDate:(id)a3 coalescingInterval:(double)a4 minimumSeparation:(double)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v8 = a3;
  objc_msgSend_tableGroup(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestCallbackForTarget_withDate_coalescingInterval_minimumSeparation_(v12, v13, (uint64_t)self, (uint64_t)v8, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)setupReferencedTableCache
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *referencedGroups;
  NSDictionary *referencedTablesByProperty;
  NSDictionary *v11;
  id v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_18A6C4188;
  v25 = sub_18A6C4198;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_18A6C4188;
  v19 = sub_18A6C4198;
  v20 = 0;
  v3 = (void *)objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A6C74B0;
  v14[3] = &unk_1E1F5FFD0;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  objc_msgSend_enumeratePropertyDataWithBlock_(v3, v4, (uint64_t)v14, v5);
  if (v22[5])
  {
    referencedGroups = self->_referencedGroups;
    self->_referencedGroups = 0;

    referencedTablesByProperty = self->_referencedTablesByProperty;
    self->_referencedTablesByProperty = 0;
  }
  else
  {
    v11 = (NSDictionary *)objc_msgSend_copy((void *)v16[5], v6, v7, v8);
    referencedTablesByProperty = self->_referencedTablesByProperty;
    self->_referencedTablesByProperty = v11;
  }

  v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)tableForReferenceProperty:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v5 = a3;
  v6 = a4;
  if (ck_log_initialization_predicate != -1)
    goto LABEL_5;
  while (1)
  {
    v7 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_ERROR, "Subclasses must implement", v14, 2u);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Subclasses must implement"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v10, v11, v12, v13);
    _os_crash();
    __break(1u);
LABEL_5:
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
}

- (id)tableForReferenceProperty:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectForKey_(self->_referencedTablesByProperty, a2, (uint64_t)a3, v3);
}

- (id)referenceProperties
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_allKeys(self->_referencedTablesByProperty, a2, v2, v3);
}

- (BOOL)migrateEntryDataFromTable:(id)a3 entry:(id)a4 toEntry:(id)a5 addedProperties:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  CKSQLiteTable *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_class();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A6C77F4;
  v19[3] = &unk_1E1F5FFF8;
  v20 = v9;
  v21 = v10;
  v22 = self;
  v23 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  objc_msgSend_enumeratePropertyDataWithBlock_(v12, v16, (uint64_t)v19, v17);

  return 1;
}

- (BOOL)migrateDataFromTable:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  id v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = (void *)objc_opt_class();
  v9 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_18A6C7B70;
  v47[3] = &unk_1E1F60020;
  v10 = v5;
  v48 = v10;
  v11 = v6;
  v49 = v11;
  v12 = v7;
  v50 = v12;
  objc_msgSend_enumeratePropertyDataWithBlock_(v8, v13, (uint64_t)v47, v14);
  v46 = 0;
  v44[0] = v9;
  v44[1] = 3221225472;
  v44[2] = sub_18A6C7BDC;
  v44[3] = &unk_1E1F60048;
  v15 = v11;
  v45 = v15;
  objc_msgSend_entriesWithValues_label_error_setupBlock_(v10, v16, 0, 0, &v46, v44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v46;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v17;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v40, (uint64_t)v51, 16);
  if (!v20)
  {
LABEL_14:

    if (a4 && v18)
    {
      v18 = objc_retainAutorelease(v18);
      *a4 = v18;
    }
    goto LABEL_17;
  }
  v21 = v20;
  v37 = v15;
  v22 = *(_QWORD *)v41;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v41 != v22)
        objc_enumerationMutation(obj);
      v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
      v25 = (void *)MEMORY[0x18D76DE4C]();
      v26 = (void *)objc_opt_class();
      v30 = objc_alloc_init((Class)objc_msgSend_entryClass(v26, v27, v28, v29));
      if ((objc_msgSend_migrateEntryDataFromTable_entry_toEntry_addedProperties_(self, v31, (uint64_t)v10, v24, v30, v12) & 1) == 0)
      {

        objc_autoreleasePoolPop(v25);
LABEL_13:
        v15 = v37;
        goto LABEL_14;
      }
      objc_msgSend_insertObject_(self, v32, (uint64_t)v30, v33);
      v34 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v25);
      if (v34)
      {
        v18 = (id)v34;
        goto LABEL_13;
      }
      v18 = 0;
    }
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v40, (uint64_t)v51, 16);
    v18 = 0;
    if (v21)
      continue;
    break;
  }

  v18 = 0;
  v15 = v37;
LABEL_17:

  return v18 == 0;
}

- (BOOL)isIntegerPrimaryKeyTable
{
  return self->_flags & 1;
}

- (BOOL)databaseTableWasCreated
{
  return (self->_flags >> 1) & 1;
}

- (BOOL)logOperations
{
  return (self->_flags >> 2) & 1;
}

- (void)setLogOperations:(BOOL)a3
{
  unint64_t *p_flags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  p_flags = &self->_flags;
  if (a3)
  {
    do
    {
      while (1)
      {
        v4 = *p_flags;
        v5 = __ldxr(p_flags);
        if (v5 == v4)
          break;
        __clrex();
      }
    }
    while (__stxr(v4 | 4, p_flags));
  }
  else
  {
    do
    {
      while (1)
      {
        v6 = *p_flags;
        v7 = __ldxr(p_flags);
        if (v7 == v6)
          break;
        __clrex();
      }
    }
    while (__stxr(v6 & 0xFFFFFFFFFFFFFFFBLL, p_flags));
  }
}

- (id)compiledStatementWithLabel:(id *)a3 creationBlock:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  CKSQLiteCompiledStatementCacheKey *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v6 = (void (**)(_QWORD))a4;
  v7 = v6;
  if (a3)
  {
    v8 = [CKSQLiteCompiledStatementCacheKey alloc];
    v10 = (void *)objc_msgSend_initWithTable_label_(v8, v9, (uint64_t)self, (uint64_t)a3);
    v11 = (id)qword_1EDF6F740;
    objc_sync_enter(v11);
    objc_msgSend_objectForKey_((void *)qword_1EDF6F740, v12, (uint64_t)v10, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_removeObjectForKey_((void *)qword_1EDF6F740, v14, (uint64_t)v10, v15);
      objc_sync_exit(v11);

    }
    else
    {
      objc_sync_exit(v11);

      v7[2](v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLabel_(v16, v17, (uint64_t)v10, v18);
    }

  }
  else
  {
    v6[2](v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)cacheStatement:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  v3 = (id)qword_1EDF6F740;
  objc_sync_enter(v3);
  if (qword_1EDF6F740)
  {
    if ((unint64_t)objc_msgSend_count((void *)qword_1EDF6F740, v4, v5, v6) >= 0x20)
      objc_msgSend_removeAllObjects((void *)qword_1EDF6F740, v7, v8, v9);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v13 = objc_msgSend_initWithCapacity_(v10, v11, 32, v12);
    v14 = (void *)qword_1EDF6F740;
    qword_1EDF6F740 = v13;

  }
  v15 = (void *)qword_1EDF6F740;
  objc_msgSend_label(v18, v7, v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v17, (uint64_t)v18, (uint64_t)v16);

  objc_sync_exit(v3);
}

- (id)_predicateForMatchingProperties:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6) == 1)
  {
    objc_msgSend_objectAtIndex_(v3, v7, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%@=$%@"), v11, v9, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v13, (uint64_t)v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v3;
    v17 = v3;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v35, (uint64_t)v39, 16);
    if (v19)
    {
      v22 = v19;
      v23 = *(_QWORD *)v36;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v17);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%@=$%@"), v21, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v26, (uint64_t)v25, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v29, (uint64_t)v28, v30);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v35, (uint64_t)v39, 16);
      }
      while (v22);
    }

    objc_msgSend_andPredicateWithSubpredicates_(MEMORY[0x1E0CB3528], v31, (uint64_t)v16, v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v34;
  }

  return v15;
}

- (id)_valueDictionaryForProperties:(id)a3 inObject:(id)a4 nilPropertyError:(id *)a5 selForNilPropertyError:(SEL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  id v34;
  const char *aSelector;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (void *)objc_opt_class();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v9;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v14)
  {
    v17 = v14;
    aSelector = a6;
    v18 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend_propertyInfo_(v12, v15, v20, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v22, v20, (uint64_t)v21, v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          if (a5)
          {
            NSStringFromSelector(aSelector);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_logicalTableName(self, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v32, (uint64_t)CFSTR("CKInternalErrorDomain"), 1, CFSTR("%@ requires a value for primary key %@ in table %@"), v27, v20, v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = objc_retainAutorelease(v33);
            *a5 = v34;

            v11 = 0;
            goto LABEL_13;
          }
          objc_msgSend_null(MEMORY[0x1E0C99E38], v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_setObject_forKey_(v11, v23, (uint64_t)v26, v20);

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v39, (uint64_t)v43, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_13:

  return v11;
}

- (void)_addPredicateForMatching:(id)a3 toStatement:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  id v15;

  v15 = a3;
  v9 = a4;
  if (v9 && objc_msgSend_count(v15, v6, v7, v8))
  {
    objc_msgSend__predicateForMatchingProperties_(self, v10, (uint64_t)v15, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend_setSearchPredicate_forProperties_(v9, v13, (uint64_t)v12, (uint64_t)v15);

  }
}

- (id)statementForFetchingProperties:(id)a3 inEntriesMatchingColumns:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  void *v9;
  const char *v10;

  v7 = a4;
  objc_msgSend_statementForFetchingColumns_inTable_(CKSQLiteCompiledStatement, v8, (uint64_t)a3, (uint64_t)self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addPredicateForMatching_toStatement_(self, v10, (uint64_t)v7, (uint64_t)v9);

  return v9;
}

- (id)_bindProperties:(id)a3 valueObject:(id)a4 inStatement:(id)a5 includePrimaryKeys:(BOOL)a6
{
  id v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  CKSQLiteTable *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v32 = self;
  v33 = a5;
  v11 = (void *)objc_opt_class();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v10;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend_propertyInfo_(v11, v15, v20, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend_unsignedIntValue(v21, v22, v23, v24);
        v27 = v25;
        if (a6 || (v25 & 0x100) == 0)
        {
          objc_msgSend_valueForProperty_propertyInfo_inObject_(v32, v26, v20, (uint64_t)v21, v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bindValueColumn_type_value_(v33, v29, v20, v27, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {

            goto LABEL_13;
          }
        }

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v35, (uint64_t)v39, 16);
      if (v17)
        continue;
      break;
    }
  }
  v30 = 0;
LABEL_13:

  return v30;
}

- (BOOL)hasEntry:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  objc_msgSend_primaryKeyProperties(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v11, 0, (uint64_t)v6, v10, off_1E1F60068);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15 = objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v13, (uint64_t)v12, v14);
    if (a4)
    {
      if ((v15 & 1) == 0)
        *a4 = objc_retainAutorelease(v12);
    }
  }

  return v12 == 0;
}

- (id)entryWithPrimaryKey:(id)a3 fetchProperties:(id)a4 label:(id *)a5 error:(id *)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (objc_msgSend_count(self->_primaryKeyProperties, v13, v14, v15) == 1)
  {
    v44 = CFSTR("PRIMARY_KEY");
    v45[0] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v45, (uint64_t)&v44, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_18A6C8838;
    v35[3] = &unk_1E1F60088;
    v35[4] = self;
    v36 = v12;
    objc_msgSend_entryWithValues_label_error_setupBlock_(self, v18, (uint64_t)v17, (uint64_t)a5, &v37, v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v37;

    if (!v20)
      goto LABEL_11;
LABEL_5:
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v29 = v27;
      objc_msgSend_logicalTableName(self, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v33;
      v40 = 2114;
      v41 = v34;
      v42 = 2114;
      v43 = v20;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

      if (!a6)
        goto LABEL_10;
    }
    else if (!a6)
    {
LABEL_10:

      v19 = 0;
      goto LABEL_11;
    }
    *a6 = objc_retainAutorelease(v20);
    goto LABEL_10;
  }
  NSStringFromSelector(a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalTableName(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 1, CFSTR("%@ requires a single primary key property (table %@)"), v21, v25);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  if (v20)
    goto LABEL_5;
LABEL_11:

  return v19;
}

- (id)entryWithValues:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v25;
  SEL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v11 = a3;
  v12 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_18A6C4188;
  v31 = sub_18A6C4198;
  v32 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_18A6C8A50;
  v21[3] = &unk_1E1F600D8;
  v21[4] = self;
  v13 = v11;
  v22 = v13;
  v25 = a4;
  v14 = v12;
  v23 = v14;
  v24 = &v27;
  v26 = a2;
  objc_msgSend_performInTransaction_(self, v15, (uint64_t)v21, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a5 && v17)
    *a5 = objc_retainAutorelease(v17);
  v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (id)_fetchPropertiesUsingStatement:(id)a3 inObject:(id)a4 matchingDBProperties:(id)a5 label:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  int v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  int v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CKSQLiteTable *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t i;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  __CFString *v62;
  void *v63;
  NSObject *v64;
  objc_class *v65;
  void *v66;
  const char *v67;
  void *v68;
  char v69;
  void *v70;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  CKSQLiteTable *v77;
  const char *v78;
  const char *v79;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v80;
  void *v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  CKSQLiteTable *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  __CFString *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v82 = a4;
  v86 = 0;
  v13 = objc_msgSend_step_(v10, v11, (uint64_t)&v86, v12);
  v14 = v86;
  if (v14)
    v18 = 0;
  else
    v18 = v13;
  if (v18 == 1)
  {
    objc_msgSend_strongObjectsPointerArray(MEMORY[0x1E0CB3868], v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = sub_18A6C9134;
    v84[3] = &unk_1E1F5FB40;
    v20 = v19;
    v85 = v20;
    objc_msgSend_enumerateResultColumnsWithBlock_(v10, v21, (uint64_t)v84, v22);
    v83 = 0;
    v25 = objc_msgSend_step_(v10, v23, (uint64_t)&v83, v24);
    v26 = v83;
    v30 = v26;
    if (v25)
    {
      NSStringFromSelector(a2);
      v31 = self;
      v32 = a2;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v34, (uint64_t)CFSTR("CKInternalErrorDomain"), 1051, CFSTR("Matched more than one database row in %@"), v33);
      v35 = objc_claimAutoreleasedReturnValue();

      a2 = v32;
      self = v31;
      v30 = (void *)v35;
    }
    else if (!v26)
    {
      v36 = objc_msgSend_count(v20, v27, v28, v29);
      if (v36)
      {
        v39 = v36;
        v78 = a2;
        v80 = a6;
        for (i = 0; i < v39; i += 3)
        {
          objc_msgSend_pointerAtIndex_(v20, v37, i, v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pointerAtIndex_(v20, v42, i + 1, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pointerAtIndex_(v20, v45, i + 2, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forProperty_propertyInfo_inObject_(self, v48, (uint64_t)v47, (uint64_t)v41, v44, v82);

        }
        v30 = 0;
        a2 = v78;
        a6 = v80;
      }
      else
      {
        v30 = 0;
      }
    }

  }
  else
  {
    v30 = v14;
    if (v14)
    {
      v18 = 1;
      goto LABEL_18;
    }
    NSStringFromSelector(a2);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v49, (uint64_t)CFSTR("CKInternalErrorDomain"), 1050, CFSTR("No matching database row in %@"), v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
  if (objc_msgSend_logOperations(self, v15, v16, v17))
  {
    v79 = a2;
    objc_msgSend_fetchedColumns(v10, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v53, v54, (uint64_t)CFSTR(", "), v55);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_searchBindingsDescription(v10, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (((v30 != 0) & ~v18) != 0)
    {
      v62 = CFSTR("No matching row");
    }
    else
    {
      v60 = (void *)objc_opt_class();
      objc_msgSend_descriptionOfProperties_from_(v60, v61, (uint64_t)v53, (uint64_t)v82);
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v63 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
    {
      v64 = v63;
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18A6C2BC8((uint64_t *)a6, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v88 = v66;
      v89 = 2048;
      v90 = self;
      v91 = 2114;
      v92 = v81;
      v93 = 2114;
      v94 = v59;
      v95 = 2114;
      v96 = v68;
      v97 = 2114;
      v98 = v62;
      _os_log_impl(&dword_18A5C5000, v64, OS_LOG_TYPE_INFO, "%{public}@(%p): FETCH (%{public}@) WHERE %{public}@, label: %{public}@ fetched: %{public}@", buf, 0x3Eu);

    }
    a2 = v79;
  }
  objc_msgSend_resetAndClearBindings(v10, v50, v51, v52);
  v69 = v18 ^ 1;
  if (!v30)
    v69 = 1;
  if ((v69 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v70 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v72 = v70;
      objc_msgSend_logicalTableName(self, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v77 = (CKSQLiteTable *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v76;
      v89 = 2114;
      v90 = v77;
      v91 = 2114;
      v92 = v30;
      _os_log_error_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }

  return v30;
}

- (id)fetchProperties:(id)a3 inObject:(id)a4 matchingDBProperties:(id)a5 label:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18A6C9288;
  v20[3] = &unk_1E1F60128;
  v20[4] = self;
  v21 = v11;
  v23 = v12;
  v24 = a6;
  v22 = v10;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  objc_msgSend_performInTransaction_(self, v16, (uint64_t)v20, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fetchAllProperties:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6C94AC;
  v10[3] = &unk_1E1F605B0;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend_performInTransaction_(self, v6, (uint64_t)v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updateProperties:(id)a3 usingObject:(id)a4 label:(id *)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  CKSQLiteTable *v18;
  CKSQLiteTable *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  _QWORD v26[4];
  CKSQLiteTable *v27;
  id v28;
  id v29;
  id v30;

  v9 = a3;
  v10 = a4;
  objc_msgSend_primaryKeyProperties(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v15, (uint64_t)v14, (uint64_t)v10, &v30, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  if (!v17)
  {
    v18 = self;
    v29 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18A6C977C;
    v26[3] = &unk_1E1F60190;
    v19 = v18;
    v27 = v19;
    v28 = v14;
    v21 = objc_msgSend_setProperties_valuesToStore_inEntriesMatching_label_error_predicate_(v19, v20, (uint64_t)v9, (uint64_t)v10, v16, a5, &v29, v26);
    v17 = v29;
    if (!v17 && !v21)
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v23, (uint64_t)CFSTR("CKInternalErrorDomain"), 1050, CFSTR("No matching database row in %@"), v22);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v24 = v17;

  return v24;
}

- (id)updateUsingObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_nonKeyProperties(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateProperties_usingObject_label_(self, v10, (uint64_t)v9, (uint64_t)v4, off_1E1F601B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_performInsertOrUpdateStatement:(id)a3 usingObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t InsertRowID;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id obj;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v6 = a3;
  v7 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_18A6C4188;
  v47 = sub_18A6C4198;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v8 = (void *)objc_opt_class();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_18A6C99F8;
  v34[3] = &unk_1E1F601D0;
  v37 = &v43;
  v34[4] = self;
  v9 = v7;
  v35 = v9;
  v10 = v6;
  v36 = v10;
  v38 = &v39;
  objc_msgSend_enumeratePropertyDataWithBlock_(v8, v11, (uint64_t)v34, v12);
  v15 = (id *)(v44 + 5);
  if (!v44[5])
  {
    obj = 0;
    objc_msgSend_step_(v10, v13, (uint64_t)&obj, v14);
    objc_storeStrong(v15, obj);
    if (!v44[5] && *((_BYTE *)v40 + 24) && objc_msgSend_isIntegerPrimaryKeyTable(self, v16, v17, v18))
    {
      objc_msgSend_db(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      InsertRowID = objc_msgSend_lastInsertRowID(v24, v25, v26, v27);

      objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v29, InsertRowID, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forProperty_propertyInfo_inObject_(self, v32, (uint64_t)v31, (uint64_t)self->_primaryKeyProperty, self->_primaryKeyPropertyInfo, v9);

    }
  }
  v19 = (id)v44[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v19;
}

- (id)insertObject:(id)a3
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6C9B74;
  v11[3] = &unk_1E1F60238;
  v11[4] = self;
  v12 = v5;
  v13 = a2;
  v6 = v5;
  objc_msgSend_performInTransaction_(self, v7, (uint64_t)v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)insertObject:(id)a3 orUpdateProperties:(id)a4 label:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A6C9FC4;
  v17[3] = &unk_1E1F60288;
  v17[4] = self;
  v18 = v10;
  v19 = v9;
  v20 = a5;
  v21 = a2;
  v11 = v9;
  v12 = v10;
  objc_msgSend_performInTransaction_(self, v13, (uint64_t)v17, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)deleteObject:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v5 = a3;
  objc_msgSend_primaryKeyProperties(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v10, (uint64_t)v9, (uint64_t)v5, &v23, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v23;
  if (!v12)
  {
    v22 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_18A6CA500;
    v20[3] = &unk_1E1F60190;
    v20[4] = self;
    v21 = v9;
    v14 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v13, (uint64_t)v11, (uint64_t)off_1E1F602A8, &v22, v20);
    v12 = v22;
    if (!v14)
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, (uint64_t)CFSTR("CKInternalErrorDomain"), 1050, CFSTR("No matching database row in %@"), v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v17;
    }

  }
  v18 = v12;

  return v18;
}

- (id)deletePrimaryKeyValue:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSString *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend_count(self->_primaryKeyProperties, v6, v7, v8) != 1)
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logicalTableName(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v24, (uint64_t)CFSTR("CKInternalErrorDomain"), 1, CFSTR("%@ cannot be used with a compound primary key (table %@)"), v19, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_12;
    goto LABEL_8;
  }
  v42 = CFSTR("VALUE");
  v43[0] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v43, (uint64_t)&v42, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_primaryKeyProperty;
  v35 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_18A6CA7D0;
  v33[3] = &unk_1E1F602E0;
  v12 = v11;
  v34 = v12;
  v14 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v13, (uint64_t)v10, (uint64_t)off_1E1F602C0, &v35, v33);
  v15 = v35;
  v16 = v15;
  if (!v14 && !v15)
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, (uint64_t)CFSTR("CKInternalErrorDomain"), 1050, CFSTR("No matching database row in %@"), v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v16)
  {
LABEL_8:
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v27 = v25;
      objc_msgSend_logicalTableName(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v31;
      v38 = 2114;
      v39 = v32;
      v40 = 2114;
      v41 = v16;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
LABEL_12:

  return v16;
}

- (id)newEntryObject
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;
  const char *v20;
  _QWORD v21[5];
  id v22;

  v4 = (void *)objc_opt_class();
  v11 = objc_alloc_init((Class)objc_msgSend_entryClass(v4, v5, v6, v7));
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteTable.m"), 1676, CFSTR("allocation failure"));

  }
  v12 = (void *)objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_18A6CA8F4;
  v21[3] = &unk_1E1F60308;
  v21[4] = self;
  v13 = v11;
  v22 = v13;
  objc_msgSend_enumeratePropertyDataWithBlock_(v12, v14, (uint64_t)v21, v15);
  v16 = v22;
  v17 = v13;

  return v17;
}

- (int64_t)sizeOfProperty:(id)a3 inEntry:(id)a4 label:(id *)a5 error:(id *)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  id v20;
  int64_t v21;
  const char *v22;
  void *v23;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_primaryKeyProperties(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v17, (uint64_t)v16, (uint64_t)v12, &v34, a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v34;
  if (v19)
  {
    v20 = v19;
    v21 = 0;
  }
  else
  {
    v33 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_18A6CAB90;
    v31[3] = &unk_1E1F60190;
    v31[4] = self;
    v32 = v16;
    v21 = objc_msgSend_sizeOfProperty_inEntriesMatching_label_error_predicate_(self, v22, (uint64_t)v11, (uint64_t)v18, a5, &v33, v31);
    v20 = v33;

    if (!v20)
      goto LABEL_10;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v20);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v23 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
  {
    v25 = v23;
    objc_msgSend_logicalTableName(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    v39 = 2114;
    v40 = v20;
    _os_log_error_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

  }
LABEL_10:

  return v21;
}

- (id)minimumValueOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  CKSQLiteTable *v28;
  id v29;
  uint64_t *v30;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_18A6C4188;
  v36 = sub_18A6C4198;
  v37 = 0;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = sub_18A6CADDC;
  v27 = &unk_1E1F60358;
  v28 = self;
  v31 = a4;
  v10 = v9;
  v29 = v10;
  v30 = &v32;
  objc_msgSend_performInTransaction_(self, v11, (uint64_t)&v24, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v15 = (void *)v33[5];
    v33[5] = 0;

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v16 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v17, v18, v19, v24, v25, v26, v27, v28);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v22;
      v40 = 2114;
      v41 = v23;
      v42 = 2114;
      v43 = v14;
      _os_log_error_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v20 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (id)maximumValueOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  CKSQLiteTable *v28;
  id v29;
  uint64_t *v30;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_18A6C4188;
  v36 = sub_18A6C4198;
  v37 = 0;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = sub_18A6CB268;
  v27 = &unk_1E1F60358;
  v28 = self;
  v31 = a4;
  v10 = v9;
  v29 = v10;
  v30 = &v32;
  objc_msgSend_performInTransaction_(self, v11, (uint64_t)&v24, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v15 = (void *)v33[5];
    v33[5] = 0;

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v16 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v17, v18, v19, v24, v25, v26, v27, v28);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v22;
      v40 = 2114;
      v41 = v23;
      v42 = 2114;
      v43 = v14;
      _os_log_error_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v20 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (id)_statementForFetchingEntriesMatchingObject:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_18A6C4188;
  v43 = sub_18A6C4198;
  v44 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_18A6CB764;
  v36[3] = &unk_1E1F60560;
  v36[4] = self;
  v13 = v12;
  v37 = v13;
  v38 = &v39;
  objc_msgSend_compiledStatementWithLabel_creationBlock_(self, v14, (uint64_t)a4, (uint64_t)v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v40[5];
  if (v19)
    goto LABEL_5;
  objc_msgSend_searchProperties(v18, v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v20, v21, v22, v23))
  {
    objc_msgSend__valueDictionaryForProperties_inObject_nilPropertyError_selForNilPropertyError_(self, v24, (uint64_t)v20, (uint64_t)v11, 0, a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSearchValues_(v18, v26, (uint64_t)v25, v27);

  }
  v19 = (void *)v40[5];
  if (v19)
  {
LABEL_5:
    if (a5)
      *a5 = objc_retainAutorelease(v19);
    objc_msgSend_resetAndClearBindings(v18, v15, v16, v17);

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v29, v30, v31);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v40[5];
      *(_DWORD *)buf = 138543874;
      v46 = v33;
      v47 = 2114;
      v48 = v34;
      v49 = 2114;
      v50 = v35;
      _os_log_error_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
    v18 = 0;
  }

  _Block_object_dispose(&v39, 8);
  return v18;
}

- (id)entriesMatchingObject:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CKSQLiteTableSearchResultEnumerator *v14;
  const char *v15;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  objc_msgSend__statementForFetchingEntriesMatchingObject_label_error_setupBlock_(self, a2, (uint64_t)a3, (uint64_t)a4, &v23, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  v11 = v10;
  if (v10)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v12 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v17 = v12;
      objc_msgSend_logicalTableName(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v21;
      v26 = 2114;
      v27 = v22;
      v28 = 2114;
      v29 = v11;
      _os_log_error_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }
  else
  {
    v14 = [CKSQLiteTableSearchResultEnumerator alloc];
    v13 = (void *)objc_msgSend_initWithTable_statement_(v14, v15, (uint64_t)self, (uint64_t)v9);
  }

  return v13;
}

- (id)_performEnumerationWithBlock:(id)a3 usingEnumerator:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A6CBABC;
  v14[3] = &unk_1E1F60380;
  v15 = v7;
  v16 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend_performInTransaction_(self, v10, (uint64_t)v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)entryEnumerator:(id *)a3
{
  return (id)objc_msgSend_entriesWithValues_label_error_setupBlock_(self, a2, 0, (uint64_t)off_1E1F603A0, a3, 0);
}

- (id)enumerateEntriesWithBlock:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18A6CBC7C;
  v4[3] = &unk_1E1F603C0;
  v4[4] = self;
  objc_msgSend__performEnumerationWithBlock_usingEnumerator_(self, a2, (uint64_t)a3, (uint64_t)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newEntryObjectFromStatement:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  _QWORD v26[5];
  id v27;
  id v28;

  v6 = a3;
  v10 = v6;
  if ((self->_flags & 8) != 0)
  {
    v28 = 0;
    objc_msgSend_propertyDecoder_(v6, v7, (uint64_t)&v28, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;
    if (v16)
    {
      v17 = v16;

      if (a4)
        *a4 = objc_retainAutorelease(v17);

      v12 = 0;
    }
    else
    {
      v18 = (void *)objc_opt_class();
      v22 = objc_alloc((Class)objc_msgSend_entryClass(v18, v19, v20, v21));
      v12 = (id)objc_msgSend_initWithCoder_(v22, v23, (uint64_t)v15, v24);

    }
  }
  else
  {
    v11 = (void *)objc_msgSend_newEntryObject(self, v7, v8, v9);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18A6CBD9C;
    v26[3] = &unk_1E1F603E8;
    v26[4] = self;
    v12 = v11;
    v27 = v12;
    objc_msgSend_enumerateResultColumnsWithBlock_(v10, v13, (uint64_t)v26, v14);

  }
  return v12;
}

- (id)fetchProperties:(id)a3 label:(id *)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  CKSQLiteTable *v30;
  id v31;
  id v32;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = sub_18A6CBFAC;
  v29 = &unk_1E1F60438;
  v30 = self;
  v33 = a4;
  v11 = v9;
  v31 = v11;
  v12 = v10;
  v32 = v12;
  objc_msgSend_performInTransaction_(self, v13, (uint64_t)&v26, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v20 = v17;
      objc_msgSend_logicalTableName(self, v21, v22, v23, v26, v27, v28, v29, v30, v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      v36 = 2114;
      v37 = v25;
      v38 = 2114;
      v39 = v16;
      _os_log_error_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
    v12 = 0;
  }
  v18 = v12;

  return v18;
}

- (id)fetchAllEntries:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_fetchProperties_label_error_, 0, off_1E1F60458);
}

- (BOOL)hasEntries:(id *)a3
{
  uint64_t v3;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  id v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A6CC710;
  v17[3] = &unk_1E1F60490;
  v17[4] = self;
  v17[5] = &v18;
  objc_msgSend_performInTransaction_(self, a2, (uint64_t)v17, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    *((_BYTE *)v19 + 24) = 0;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v10, v11, v12);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v13 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (unint64_t)count:(id *)a3
{
  uint64_t v3;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A6CC9E4;
  v17[3] = &unk_1E1F60490;
  v17[4] = self;
  v17[5] = &v18;
  objc_msgSend_performInTransaction_(self, a2, (uint64_t)v17, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v10, v11, v12);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v13 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)addPredicateToStatement:(id)a3 predicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend_setSearchPredicate_forProperties_(v5, v8, (uint64_t)v9, 0);
    else
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v8, (uint64_t)CFSTR("CKInternalErrorDomain"), 1, CFSTR("predicate block returned nil predicate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)setProperties:(id)a3 valuesToStore:(id)a4 inEntriesMatching:(id)a5 label:(id *)a6 error:(id *)a7 predicate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_18A6CCFCC;
  v35[3] = &unk_1E1F604F8;
  v35[4] = self;
  v41 = a6;
  v19 = v15;
  v36 = v19;
  v20 = v18;
  v39 = v20;
  v21 = v17;
  v37 = v21;
  v22 = v16;
  v38 = v22;
  v40 = &v42;
  objc_msgSend_performInTransaction_(self, v23, (uint64_t)v35, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v25);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v28, v29, v30);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v33;
      v48 = 2114;
      v49 = v34;
      v50 = 2114;
      v51 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v31 = v43[3];

  _Block_object_dispose(&v42, 8);
  return v31;
}

- (unint64_t)deleteEntriesMatching:(id)a3 label:(id *)a4 error:(id *)a5 predicate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t *v30;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_18A6CD5E0;
  v27[3] = &unk_1E1F60520;
  v27[4] = self;
  v31 = a4;
  v13 = v12;
  v29 = v13;
  v14 = v11;
  v28 = v14;
  v30 = &v32;
  objc_msgSend_performInTransaction_(self, v15, (uint64_t)v27, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v20, v21, v22);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v25;
      v38 = 2114;
      v39 = v26;
      v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v23 = v33[3];

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (unint64_t)deleteAllEntries:(id *)a3
{
  return objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, a2, 0, (uint64_t)off_1E1F60540, a3, 0);
}

- (id)entriesWithValues:(id)a3 label:(id *)a4 error:(id *)a5 setupBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CKSQLiteTableSearchResultEnumerator *v24;
  const char *v25;
  id v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_18A6C4188;
  v37 = sub_18A6C4198;
  v38 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_18A6CDBBC;
  v30[3] = &unk_1E1F60560;
  v13 = v12;
  v30[4] = self;
  v31 = v13;
  v32 = &v33;
  objc_msgSend_compiledStatementWithLabel_creationBlock_(self, v14, (uint64_t)a4, (uint64_t)v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v34[5];
  if (v18)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v18);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v20, v21, v22);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v34[5];
      *(_DWORD *)buf = 138543874;
      v40 = v27;
      v41 = 2114;
      v42 = v28;
      v43 = 2114;
      v44 = v29;
      _os_log_error_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
    v23 = 0;
  }
  else
  {
    objc_msgSend_setSearchValues_(v17, v15, (uint64_t)v11, v16);
    v24 = [CKSQLiteTableSearchResultEnumerator alloc];
    v23 = (void *)objc_msgSend_initWithTable_statement_(v24, v25, (uint64_t)self, (uint64_t)v17);
  }

  _Block_object_dispose(&v33, 8);
  return v23;
}

- (unint64_t)countOfEntriesMatching:(id)a3 label:(id *)a4 error:(id *)a5 predicate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t *v30;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_18A6CDF70;
  v27[3] = &unk_1E1F60520;
  v27[4] = self;
  v31 = a4;
  v13 = v12;
  v29 = v13;
  v14 = v11;
  v28 = v14;
  v30 = &v32;
  objc_msgSend_performInTransaction_(self, v15, (uint64_t)v27, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v20, v21, v22);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v25;
      v38 = 2114;
      v39 = v26;
      v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v23 = v33[3];

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (int64_t)sumOfProperty:(id)a3 inEntriesMatching:(id)a4 label:(id *)a5 error:(id *)a6 predicate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  CKSQLiteTable *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = sub_18A6CE414;
  v34 = &unk_1E1F60588;
  v35 = self;
  v40 = a5;
  v16 = v13;
  v36 = v16;
  v17 = v15;
  v38 = v17;
  v18 = v14;
  v37 = v18;
  v39 = &v41;
  objc_msgSend_performInTransaction_(self, v19, (uint64_t)&v31, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v21);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v23 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_logicalTableName(self, v24, v25, v26, v31, v32, v33, v34, v35, v36);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v29;
      v47 = 2114;
      v48 = v30;
      v49 = 2114;
      v50 = v22;
      _os_log_error_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

    }
  }
  v27 = v42[3];

  _Block_object_dispose(&v41, 8);
  return v27;
}

- (int64_t)sumOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_sumOfProperty_inEntriesMatching_label_error_predicate_, a3, 0);
}

- (int64_t)sizeOfProperty:(id)a3 inEntriesMatching:(id)a4 label:(id *)a5 error:(id *)a6 predicate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id (*v46)(uint64_t);
  void *v47;
  CKSQLiteTable *v48;
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v44 = MEMORY[0x1E0C809B0];
  v45 = 3221225472;
  v46 = sub_18A6CEA20;
  v47 = &unk_1E1F60588;
  v48 = self;
  v53 = a5;
  v16 = v13;
  v49 = v16;
  v17 = v15;
  v51 = v17;
  v18 = v14;
  v50 = v18;
  v52 = &v54;
  objc_msgSend_performInTransaction_(self, v19, (uint64_t)&v44, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v21);
    v55[3] = 0;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v23 = (id)ck_log_facility_sql;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    goto LABEL_17;
  }
  v27 = v55[3];
  if (v27)
    goto LABEL_9;
  v29 = (void *)objc_opt_class();
  objc_msgSend_propertyInfo_(v29, v30, (uint64_t)v16, v31);
  v23 = objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_unsignedIntValue(v23, v32, v33, v34);
  if (v35 != 3 && (v35 & 0x80) == 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v36 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = v17;
      v60 = 2112;
      v61 = v16;
      _os_log_error_impl(&dword_18A5C5000, v36, OS_LOG_TYPE_ERROR, "%@ called with %@ which is not a valid type to be sized.", buf, 0x16u);

    }
    v18 = (id)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v37, (uint64_t)CFSTR("%@ called with %@ which is not a valid type to be sized."), v38, a2, v16, v44, v45, v46, v47, v48, v49);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_UTF8String(v16, v39, v40, v41);
    _os_crash();
    __break(1u);
LABEL_17:
    objc_msgSend_logicalTableName(self, v24, v25, v26);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v42;
    v60 = 2114;
    v61 = v43;
    v62 = 2114;
    v63 = v22;
    _os_log_error_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_ERROR, "Table %{public}@ failed in %{public}@ - error: %{public}@", buf, 0x20u);

  }
LABEL_7:

  v27 = v55[3];
LABEL_9:

  _Block_object_dispose(&v54, 8);
  return v27;
}

- (int64_t)sizeOfProperty:(id)a3 label:(id *)a4 error:(id *)a5
{
  return objc_msgSend_sizeOfProperty_inEntriesMatching_label_error_predicate_(self, a2, (uint64_t)a3, 0, a4, a5, 0);
}

- (NSString)logicalTableName
{
  return self->_logicalTableName;
}

- (NSString)dbTableName
{
  return self->_dbTableName;
}

- (NSArray)primaryKeyProperties
{
  return self->_primaryKeyProperties;
}

- (NSString)primaryKeyProperty
{
  return self->_primaryKeyProperty;
}

- (NSNumber)primaryKeyPropertyInfo
{
  return self->_primaryKeyPropertyInfo;
}

- (CKSQLiteTableGroup)tableGroup
{
  return (CKSQLiteTableGroup *)objc_loadWeakRetained((id *)&self->_tableGroup);
}

- (NSObject)databaseManagerData
{
  return self->_databaseManagerData;
}

- (void)setDatabaseManagerData:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManagerData, a3);
}

- (id)tocTableEntry
{
  return self->_tocTableEntry;
}

- (void)setTocTableEntry:(id)a3
{
  objc_storeStrong(&self->_tocTableEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tocTableEntry, 0);
  objc_storeStrong((id *)&self->_databaseManagerData, 0);
  objc_destroyWeak((id *)&self->_tableGroup);
  objc_storeStrong((id *)&self->_primaryKeyPropertyInfo, 0);
  objc_storeStrong((id *)&self->_primaryKeyProperty, 0);
  objc_storeStrong((id *)&self->_logicalTableName, 0);
  objc_storeStrong((id *)&self->_referencedTablesByProperty, 0);
  objc_storeStrong((id *)&self->_referencedGroups, 0);
  objc_storeStrong((id *)&self->_primaryKeyProperties, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_dbTableName, 0);
}

- (id)numberValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)stringValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setStringValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStringValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)dataValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setDataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)dateValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setDateValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDateValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)UUIDValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUUIDValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)objectValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 2, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setObjectValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjectValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 2, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_setupActivityEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;

  v4 = a3;
  objc_msgSend_tableGroup(self, v5, v6, v7);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupID(v26, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(v4, v12, (uint64_t)v11, v13);

  objc_msgSend_name(v26, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupName_(v4, v18, (uint64_t)v17, v19);

  objc_msgSend_logicalTableName(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTableName_(v4, v24, (uint64_t)v23, v25);

}

@end
