@implementation PLImageManagerRecordEnabled

void __PLImageManagerRecordEnabled_block_invoke()
{
  NSObject *v0;

  PLImageManagerGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  PLImageManagerRecordEnabled_s_enabled = os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);

}

@end
