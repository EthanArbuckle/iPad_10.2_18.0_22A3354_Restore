@implementation CNUICoreContactEdit

- (CNUICoreContactEdit)initWithContact:(id)a3
{
  return -[CNUICoreContactEdit initWithOriginalContact:modifiedContact:](self, "initWithOriginalContact:modifiedContact:", a3, a3);
}

- (CNUICoreContactEdit)initWithOriginalContact:(id)a3 modifiedContact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CNUICoreContactEdit *v24;
  uint64_t v25;
  CNContact *original;
  uint64_t v27;
  CNContact *modified;
  CNUICoreContactEdit *v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  if (v6)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_2 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_12);
  v8 = CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactEdit initWithOriginalContact:modifiedContact:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v7)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v7)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_12);
  v16 = CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
    -[CNUICoreContactEdit initWithOriginalContact:modifiedContact:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:
  v31.receiver = self;
  v31.super_class = (Class)CNUICoreContactEdit;
  v24 = -[CNUICoreContactEdit init](&v31, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v6, "copy");
    original = v24->_original;
    v24->_original = (CNContact *)v25;

    v27 = objc_msgSend(v7, "copy");
    modified = v24->_modified;
    v24->_modified = (CNContact *)v27;

    v29 = v24;
  }

  return v24;
}

- (id)editBySettingModifiedContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[CNUICoreContactEdit original](self, "original");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithOriginalContact:modifiedContact:", v6, v4);

  return v7;
}

- (BOOL)originalAndModifiedDiffer
{
  void *v3;
  void *v4;
  char v5;

  -[CNUICoreContactEdit original](self, "original");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactEdit modified](self, "modified");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  return v5;
}

- (BOOL)modifiesContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNUICoreContactEdit original](self, "original");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  CNUICoreContactEdit *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = (CNUICoreContactEdit *)a3;
  v9 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v5 = (unint64_t)-[CNUICoreContactEdit original](self, "original"),
          v6 = (unint64_t)-[CNUICoreContactEdit original](v4, "original"),
          v5 | v6)
      && !objc_msgSend((id)v5, "isEqual:", v6)
      || (v7 = (unint64_t)-[CNUICoreContactEdit modified](self, "modified"),
          v8 = (unint64_t)-[CNUICoreContactEdit modified](v4, "modified"),
          v7 | v8)
      && !objc_msgSend((id)v7, "isEqual:", v8))
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreContactEdit original](self, "original");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreContactEdit modified](self, "modified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5 + 16337;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactEdit original](self, "original");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("original"));

  -[CNUICoreContactEdit modified](self, "modified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("modified"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNContact)original
{
  return self->_original;
}

- (CNContact)modified
{
  return self->_modified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_original, 0);
}

- (void)initWithOriginalContact:(uint64_t)a3 modifiedContact:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘modifiedContact’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithOriginalContact:(uint64_t)a3 modifiedContact:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘originalContact’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
