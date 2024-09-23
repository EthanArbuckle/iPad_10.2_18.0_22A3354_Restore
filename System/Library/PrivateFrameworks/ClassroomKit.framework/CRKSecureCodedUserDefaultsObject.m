@implementation CRKSecureCodedUserDefaultsObject

- (CRKSecureCodedUserDefaultsObject)initWithKey:(id)a3 classes:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CRKSecureCodedUserDefaultsObject *v10;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKSecureCodedUserDefaultsObject initWithStore:key:classes:](self, "initWithStore:key:classes:", v9, v8, v7);

  return v10;
}

- (CRKSecureCodedUserDefaultsObject)initWithStore:(id)a3 key:(id)a4 classes:(id)a5
{
  id v8;
  CRKSecureCodedUserDefaultsObject *v9;
  uint64_t v10;
  NSSet *classes;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRKSecureCodedUserDefaultsObject;
  v9 = -[CRKUserDefaultsObject initWithStore:key:](&v13, sel_initWithStore_key_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    classes = v9->_classes;
    v9->_classes = (NSSet *)v10;

  }
  return v9;
}

- (id)valueWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRKSecureCodedUserDefaultsObject;
  -[CRKUserDefaultsObject value](&v10, sel_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    -[CRKSecureCodedUserDefaultsObject classes](self, "classes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cat_unarchiveObjectOfClasses:withData:error:", v7, v5, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setValue:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  objc_super v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "cat_archivedDataWithRootObject:error:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = (void *)v7;
    v12.receiver = self;
    v12.super_class = (Class)CRKSecureCodedUserDefaultsObject;
    -[CRKUserDefaultsObject setValue:](&v12, sel_setValue_, v7);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRKSecureCodedUserDefaultsObject;
    -[CRKUserDefaultsObject setValue:](&v11, sel_setValue_, 0);
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (id)value
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  -[CRKSecureCodedUserDefaultsObject valueWithError:](self, "valueWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v4;
  if (!v3 && v4)
  {
    _CRKLogGeneral_19();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKSecureCodedUserDefaultsObject value].cold.1(self, v5);

  }
  return v3;
}

- (void)setValue:(id)a3
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  v4 = -[CRKSecureCodedUserDefaultsObject setValue:error:](self, "setValue:error:", a3, &v7);
  v5 = v7;
  if (!v4)
  {
    _CRKLogGeneral_19();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKSecureCodedUserDefaultsObject setValue:].cold.1(self, v5);

  }
}

- (void)registerDefaultValue:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "cat_archivedDataWithRootObject:error:", a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRKSecureCodedUserDefaultsObject;
    -[CRKUserDefaultsObject registerDefaultValue:](&v7, sel_registerDefaultValue_, v4);
  }
  else
  {
    _CRKLogGeneral_19();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKSecureCodedUserDefaultsObject setValue:].cold.1(self, v5);

  }
}

- (NSSet)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);
}

- (void)value
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_218C99000, v5, v6, "Failed to deserialize value for key %{public}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

- (void)setValue:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_218C99000, v5, v6, "Failed to serialize value for key %{public}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

@end
