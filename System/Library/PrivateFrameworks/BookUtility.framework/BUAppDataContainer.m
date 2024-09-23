@implementation BUAppDataContainer

- (BUAppDataContainer)initWithBundleID:(id)a3
{
  id v4;
  BUAppDataContainer *v5;
  const char *v6;
  BUAppDataContainer *v7;
  BUAppDataContainer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BUAppDataContainer;
  v5 = -[BUAppDataContainer init](&v10, sel_init);
  v7 = v5;
  if (v5 && !objc_msgSend__setupWithBundleID_(v5, v6, (uint64_t)v4))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (BOOL)_setupWithBundleID:(id)a3
{
  id v4;
  container_query_s *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  xpc_object_t v10;
  container_object_s *single_result;
  void *v12;
  NSObject *v13;

  v4 = a3;
  getuid();
  v5 = (container_query_s *)container_query_create();
  if (v5)
  {
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    container_query_set_uid();
    v6 = objc_retainAutorelease(v4);
    v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
    v10 = xpc_string_create(v9);
    container_query_set_identifiers();

    single_result = (container_object_s *)container_query_get_single_result();
    if (single_result)
    {
      self->_container = single_result;
      self->_containerQuery = v5;
      LOBYTE(v5) = 1;
    }
    else
    {
      container_query_get_last_error();
      v12 = (void *)container_error_copy_unlocalized_description();
      BookUtilityLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_212E6C4D8((uint64_t)v12, v13);

      free(v12);
      container_query_free();
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (NSURL)url
{
  uint64_t path;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;

  path = container_get_path();
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v3, path, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v5, (uint64_t)v4, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (id)consumeSandboxToken
{
  uint64_t v2;
  void *v3;
  BUSandboxExtension *v4;
  const char *v5;
  void *v6;
  NSObject *v7;

  v2 = container_copy_sandbox_token();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = [BUSandboxExtension alloc];
    v6 = (void *)objc_msgSend_initWithExtensionToken_(v4, v5, (uint64_t)v3);
    free(v3);
  }
  else
  {
    BookUtilityLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_212E6C54C(v7);

    v6 = 0;
  }
  return v6;
}

- (void)close
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_containerQuery)
  {
    BookUtilityLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_212E45000, v3, OS_LOG_TYPE_DEFAULT, "BUAppDataContainer: About to free containerQuery", v4, 2u);
    }

    container_query_free();
    self->_container = 0;
    self->_containerQuery = 0;
  }
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUAppDataContainer;
  -[BUAppDataContainer dealloc](&v4, sel_dealloc);
}

@end
