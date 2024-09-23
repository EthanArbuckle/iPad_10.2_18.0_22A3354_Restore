@implementation VSSharedSAMLParserController

void __VSSharedSAMLParserController_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSSharedSAMLParserController_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSSharedSAMLParserController___vs_lazy_init_variable;
  VSSharedSAMLParserController___vs_lazy_init_variable = v0;

}

id __VSSharedSAMLParserController_block_invoke_2()
{
  void *v0;
  char v1;
  id v2;
  NSObject *v3;
  void *v4;
  id v6;

  VSLoadBundleAtPath(CFSTR("System/Library/PrivateFrameworks/SAML.framework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v1 = objc_msgSend(v0, "loadAndReturnError:", &v6);
  v2 = v6;
  if ((v1 & 1) == 0)
  {
    VSErrorLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __VSSharedSAMLParserController_block_invoke_2_cold_1((uint64_t)v2, v3);

  }
  -[objc_class sharedInstance](NSClassFromString((NSString *)CFSTR("SAMLParserController")), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __VSSharedSAMLParserController_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error loading SAML framework: %@", (uint8_t *)&v2, 0xCu);
}

@end
