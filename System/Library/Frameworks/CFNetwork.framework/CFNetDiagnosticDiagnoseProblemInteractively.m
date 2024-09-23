@implementation CFNetDiagnosticDiagnoseProblemInteractively

void __CFNetDiagnosticDiagnoseProblemInteractively_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v0 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_183ECA000, v0, OS_LOG_TYPE_ERROR, "CFNetDiagnosticDiagnoseProblemInteractively is no longer supported. Please stop using it.", v1, 2u);
  }
}

@end
