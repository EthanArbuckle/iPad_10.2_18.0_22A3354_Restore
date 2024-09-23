@implementation CKSQLiteTableEntry

+ (BOOL)_cksql_isTableEntry
{
  return 1;
}

+ (Class)tableClass
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  objc_class *v7;
  void *v8;
  const char *v9;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v9, (uint64_t)a2, (uint64_t)a1, CFSTR("CKSQLiteTable.m"), 419, CFSTR("table class not set for %@"), v8);

  return 0;
}

- (CKSQLiteTableEntry)initWithCoder:(id)a3
{
  id v4;
  CKSQLiteTableEntry *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKSQLiteTableEntry;
  v5 = -[CKSQLiteTableEntry init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    v10 = (void *)objc_msgSend_tableClass(v6, v7, v8, v9);
    objc_msgSend_decodeEntry_withCoder_(v10, v11, (uint64_t)v5, (uint64_t)v4);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_tableClass(v4, v5, v6, v7);
  objc_msgSend_encodeEntry_withCoder_(v8, v9, (uint64_t)self, (uint64_t)v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (void *)objc_opt_class();
  v8 = objc_msgSend_tableClass(v4, v5, v6, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_copyOfEntry_, self, v9);
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  v3 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_tableClass(v3, v4, v5, v6);
  return (id)objc_msgSend_descriptionOfEntry_(v7, v8, (uint64_t)self, v9);
}

- (unint64_t)hash
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_opt_class();
  v7 = objc_msgSend_tableClass(v3, v4, v5, v6);
  return MEMORY[0x1E0DE7D20](v7, sel_hashForEntry_, self, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_tableClass(v5, v6, v7, v8);
  LOBYTE(self) = objc_msgSend_entriesHaveEqualProperties_other_includePrimaryKeys_(v9, v10, (uint64_t)self, (uint64_t)v4, 0);

  return (char)self;
}

@end
