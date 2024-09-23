@implementation LSExtensionPoint

- (NSDictionary)sdkEntry
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[LSExtensionPointRecord SDKDictionary](self->_record, "SDKDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_expensiveDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  id v6;
  id v7;
  LSExtensionPointRecord *v8;
  uint64_t v9;
  LSExtensionPointRecord *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = [LSExtensionPointRecord alloc];
  if (v7)
    v9 = objc_msgSend(v7, "unsignedLongLongValue");
  else
    v9 = 0;
  v16 = 0;
  v10 = -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:](v8, "initWithIdentifier:platform:parentAppRecord:error:", v6, v9, 0, &v16);
  v11 = v16;
  if (v10)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRecord:resolveAndDetach:", v10, 1);
    _LSDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[LSExtensionPoint extensionPointForIdentifier:platform:].cold.2((uint64_t)v12, (uint64_t)v6, v13);
  }
  else
  {
    _LSDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[LSExtensionPoint extensionPointForIdentifier:platform:].cold.1((uint64_t)v6, (uint64_t)v11, v13);
    v12 = 0;
  }

  v14 = v12;
  return v14;
}

- (id)_initWithRecord:(id)a3 resolveAndDetach:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSExtensionPoint;
  v8 = -[_LSQueryResult _init](&v11, sel__init);
  v9 = v8;
  if (v8)
  {
    if (v4 && _LSDatabaseContextGetDetachProxyObjects((LaunchServices::DatabaseContext *)v8))
    {
      objc_msgSend(v7, "_resolveAllProperties");
      objc_msgSend(v7, "detach");
    }
    objc_storeStrong(v9 + 1, a3);
  }

  return v9;
}

+ (id)extensionPointForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", dyld_get_active_platform());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LSExtensionPoint extensionPointForIdentifier:platform:](LSExtensionPoint, "extensionPointForIdentifier:platform:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_synthesizedExtensionPointWithIdentifier:(id)a3
{
  return 0;
}

+ (NSString)identifierForCurrentProcess
{
  return +[LSExtensionPointRecord identifierForCurrentProcess](LSExtensionPointRecord, "identifierForCurrentProcess");
}

- (NSNumber)platform
{
  uint64_t v2;
  void *v3;

  v2 = -[LSExtensionPointRecord platform](self->_record, "platform");
  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_record;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LSExtensionPoint;
  if (-[LSExtensionPoint respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return +[LSExtensionPointRecord instancesRespondToSelector:](LSExtensionPointRecord, "instancesRespondToSelector:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSExtensionPoint)initWithCoder:(id)a3
{
  id v4;
  LSExtensionPoint *v5;
  uint64_t v6;
  LSExtensionPointRecord *record;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSExtensionPoint;
  v5 = -[_LSQueryResult initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
    v6 = objc_claimAutoreleasedReturnValue();
    record = v5->_record;
    v5->_record = (LSExtensionPointRecord *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_record, CFSTR("record"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)LSExtensionPoint;
  -[LSExtensionPoint description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSExtensionPoint identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSExtensionPoint platform](self, "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSExtensionPoint sdkEntry](self, "sdkEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ <%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)extensionPointForIdentifier:(os_log_t)log platform:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Failed to find extension point for identifier %{public}@: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)extensionPointForIdentifier:(os_log_t)log platform:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Found LSExtensionPoint %@ for identifier %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
