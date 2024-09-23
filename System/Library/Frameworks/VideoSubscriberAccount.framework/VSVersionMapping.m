@implementation VSVersionMapping

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__VSVersionMapping_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___vs_lazy_init_predicate_0 != -1)
    dispatch_once(&sharedInstance___vs_lazy_init_predicate_0, block);
  return (id)sharedInstance___vs_lazy_init_variable_0;
}

void __34__VSVersionMapping_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___vs_lazy_init_variable_0;
  sharedInstance___vs_lazy_init_variable_0 = (uint64_t)v1;

}

+ (id)systemVersion
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[VSVersionMapping systemVersion].cold.1(v5);

    v4 = 0;
  }

  return v4;
}

- (VSVersionMapping)init
{
  VSVersionMapping *v2;
  void *v3;
  uint64_t v4;
  NSString *iOSSupportVersion;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSVersionMapping;
  v2 = -[VSVersionMapping init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "systemVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iOSSupportVersion"));
    v4 = objc_claimAutoreleasedReturnValue();
    iOSSupportVersion = v2->_iOSSupportVersion;
    v2->_iOSSupportVersion = (NSString *)v4;

  }
  return v2;
}

- (NSString)iOSSupportVersion
{
  return self->_iOSSupportVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iOSSupportVersion, 0);
}

+ (void)systemVersion
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Couldn't read SystemVersion.plist", v1, 2u);
}

@end
