@implementation FPXPCSanitizer

+ (id)permittedErrorDomains
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB28A8];
  v3[1] = CFSTR("NSFileProviderErrorDomain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FPXPCSanitizer)initWithProviderDomainIdentifier:(id)a3
{
  id v5;
  FPXPCSanitizer *v6;
  FPXPCSanitizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPXPCSanitizer;
  v6 = -[FPXPCSanitizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_providerIdentifier, a3);

  return v7;
}

- (FPXPCSanitizer)init
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not call this"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPXPCSanitizer init]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPXPCSanitizer.m", 81, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
}

@end
