@implementation LSLogAppRecordInitsForDataSeparation

void ___LSLogAppRecordInitsForDataSeparation_block_invoke()
{
  NSObject *v0;

  _LSDataSeparationLog();
  v0 = objc_claimAutoreleasedReturnValue();
  _LSLogAppRecordInitsForDataSeparation::result = os_log_type_enabled(v0, OS_LOG_TYPE_INFO);

}

@end
