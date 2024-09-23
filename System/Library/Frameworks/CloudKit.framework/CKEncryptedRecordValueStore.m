@implementation CKEncryptedRecordValueStore

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a4)
    objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)isEncrypted
{
  return 1;
}

- (id)objectForKeyedSubscript:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKEncryptedRecordValueStore;
  -[CKRecordValueStore objectForKeyedSubscript:](&v12, sel_objectForKeyedSubscript_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_valueForKeyPath_(v3, v4, (uint64_t)CFSTR("value"), v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend_value(v3, v7, v8, v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = v6;

  return v10;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  CKException *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [CKException alloc];
    v10 = *MEMORY[0x1E0C99778];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend_initWithName_format_(v9, v13, v10, (uint64_t)CFSTR("Illegal value of type %@ for the encrypted store"), v12);

    objc_exception_throw(v14);
  }
  if (v6)
  {
    objc_msgSend_setCompatibilityModeObjectNoValidate_forKey_(self, v8, (uint64_t)v6, (uint64_t)v7);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CKEncryptedRecordValueStore;
    -[CKRecordValueStore setObjectNoValidate:forKey:](&v15, sel_setObjectNoValidate_forKey_, 0, v7);
  }

}

- (void)setCompatibilityModeObjectNoValidate:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  CKEncryptedData *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  objc_super v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_firstObject(v6, v8, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v11,
        (isKindOfClass & 1) != 0))
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_18A73BBD0;
    v24[3] = &unk_1E1F637A0;
    v24[4] = self;
    v13 = v7;
    v25 = v13;
    objc_msgSend_CKMap_(v6, v14, (uint64_t)v24, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjectNoValidate_forKey_(self, v17, (uint64_t)v16, (uint64_t)v13);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23.receiver = self;
      v23.super_class = (Class)CKEncryptedRecordValueStore;
      -[CKRecordValueStore setObjectNoValidate:forKey:](&v23, sel_setObjectNoValidate_forKey_, v6, v7);
    }
    else
    {
      v18 = [CKEncryptedData alloc];
      v21 = (void *)objc_msgSend_initWithValue_(v18, v19, (uint64_t)v6, v20);
      sub_18A5EF6C0((uint64_t)self, v21, v7);
      objc_msgSend_setObjectNoValidate_forKey_(self, v22, (uint64_t)v21, (uint64_t)v7);

    }
  }

}

@end
