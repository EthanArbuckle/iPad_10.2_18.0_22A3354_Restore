@implementation CLSProfile

- (CLSProfile)init
{
  CLSProfile *v2;
  uint64_t v3;
  NSString *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSProfile;
  v2 = -[CLSProfile init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "cls_generateUUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;

  }
  return v2;
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<Profile> [%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".%@"), self->_uuid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)classIdentifier
{
  void *v3;
  NSObject *v4;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1CAB79000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);

  }
  return CFSTR("unknown");
}

+ (id)identifier
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "classIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.mediaminingkit.profile"), "stringByAppendingFormat:", CFSTR(".%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)informantDependenciesIdentifiers
{
  void *v3;
  NSObject *v4;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1CAB79000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);

  }
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)profileDependenciesIdentifiers
{
  void *v3;
  NSObject *v4;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1CAB79000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);

  }
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)supportedMeaningClueKeys
{
  void *v3;
  NSObject *v4;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1CAB79000, v4, OS_LOG_TYPE_ERROR, "%@ %@ MUST be subclassed", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

@end
