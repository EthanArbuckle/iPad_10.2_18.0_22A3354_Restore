@implementation FPIsCloudDocsWithFPFSEnabled

void __FPIsCloudDocsWithFPFSEnabled_block_invoke()
{
  FPUserDefaultsWithRootUserWorkaround *v0;
  NSObject *v1;

  if (!os_variant_has_internal_content())
    goto LABEL_7;
  v0 = -[FPUserDefaultsWithRootUserWorkaround initWithSuiteName:]([FPUserDefaultsWithRootUserWorkaround alloc], "initWithSuiteName:", CFSTR("com.apple.iclouddrive.features"));
  if (!-[FPUserDefaultsWithRootUserWorkaround BOOLForKey:](v0, "BOOLForKey:", CFSTR("do-not-migrate-to-FPFS")))
  {

LABEL_7:
    FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled = 1;
    return;
  }
  fp_current_or_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __FPIsCloudDocsWithFPFSEnabled_block_invoke_cold_1(v1);

  FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled = 0;
}

void __FPIsCloudDocsWithFPFSEnabled_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Do not migrate to FPFS user default is configured.", v1, 2u);
}

@end
