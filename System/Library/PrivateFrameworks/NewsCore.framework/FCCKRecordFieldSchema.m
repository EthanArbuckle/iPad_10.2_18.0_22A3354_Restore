@implementation FCCKRecordFieldSchema

+ (FCCKRecordFieldSchema)fieldWithName:(BOOL)a3 isEncrypted:
{
  id v5;
  FCCKRecordFieldSchema *v6;
  id v7;
  FCCKRecordFieldSchema *v8;
  objc_super v10;

  v5 = a2;
  objc_opt_self();
  v6 = [FCCKRecordFieldSchema alloc];
  v7 = v5;
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)FCCKRecordFieldSchema;
    v8 = (FCCKRecordFieldSchema *)objc_msgSendSuper2(&v10, sel_init);
    v6 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_name, a2);
      v6->_isEncrypted = a3;
    }
  }

  return v6;
}

- (FCCKRecordFieldSchema)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKRecordFieldSchema init]";
    v9 = 2080;
    v10 = "FCCKRecordSchema.m";
    v11 = 1024;
    v12 = 21;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKRecordFieldSchema init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BYTE *v7;
  _BYTE *v8;
  NSString *name;
  uint64_t v10;
  NSString *v11;
  BOOL isEncrypted;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = v6;
    v8 = v7;
    if (self)
      name = self->_name;
    else
      name = 0;
    v10 = *((_QWORD *)v7 + 2);
    v11 = name;
    if (-[NSString isEqualToString:](v11, "isEqualToString:", v10))
    {
      if (self)
        isEncrypted = self->_isEncrypted;
      else
        isEncrypted = 0;
      v13 = isEncrypted ^ (v8[8] == 0);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  FCCKRecordFieldSchema *v2;
  unint64_t v3;
  _BOOL8 isEncrypted;
  void *v5;
  unint64_t v6;

  v2 = self;
  if (self)
    self = (FCCKRecordFieldSchema *)self->_name;
  v3 = -[FCCKRecordFieldSchema hash](self, "hash");
  if (v2)
    isEncrypted = v2->_isEncrypted;
  else
    isEncrypted = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isEncrypted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
