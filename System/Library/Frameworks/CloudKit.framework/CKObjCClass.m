@implementation CKObjCClass

- (CKObjCClass)initWithHandle:(Class)a3
{
  void *v5;
  objc_property_t *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  unint64_t i;
  void *v12;
  const char *v13;
  uint64_t v14;
  CKObjCClass *v15;
  CKObjCClass *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *properties;
  objc_super v23;
  unsigned int outCount;

  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v6 = class_copyPropertyList(a3, &outCount);
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v10 = (void *)objc_msgSend_initWithCapacity_(v7, v8, outCount, v9);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v12 = (void *)sub_18A5DF210([CKObjCProperty alloc], a3, v6[i]);
      objc_msgSend_addObject_(v10, v13, (uint64_t)v12, v14);

    }
  }
  free(v6);
  v23.receiver = self;
  v23.super_class = (Class)CKObjCClass;
  v15 = -[CKObjCClass init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_handle, a3);
    objc_storeStrong((id *)&v16->_name, v5);
    v20 = objc_msgSend_copy(v10, v17, v18, v19);
    properties = v16->_properties;
    v16->_properties = (NSArray *)v20;

  }
  return v16;
}

+ (id)classForObject:(id)a3
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;

  v3 = objc_opt_class();
  return (id)objc_msgSend_classForHandle_(CKObjCClass, v4, v3, v5);
}

+ (id)classForHandle:(Class)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  CKObjCClass *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ECD96C70 != -1)
    dispatch_once(&qword_1ECD96C70, &unk_1E1F586F8);
  v5 = (id)qword_1ECD96C78;
  objc_sync_enter(v5);
  objc_msgSend_objectForKey_((void *)qword_1ECD96C78, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [CKObjCClass alloc];
    v8 = (void *)objc_msgSend_initWithHandle_(v9, v10, (uint64_t)a3, v11);
    objc_msgSend_setObject_forKey_((void *)qword_1ECD96C78, v12, (uint64_t)v8, (uint64_t)v4);
  }
  objc_sync_exit(v5);

  return v8;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("<%@: %p>"), v8, v6, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)propertyForName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend_properties(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A76DF60;
  v14[3] = &unk_1E1F64498;
  v15 = v4;
  v9 = v4;
  objc_msgSend_CKFirstObjectPassingTest_(v8, v10, (uint64_t)v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (Class)handle
{
  return self->_handle;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
