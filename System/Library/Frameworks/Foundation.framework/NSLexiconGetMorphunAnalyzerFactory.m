@implementation NSLexiconGetMorphunAnalyzerFactory

void ___NSLexiconGetMorphunAnalyzerFactory_block_invoke()
{
  BOOL v0;
  NSObject *v1;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  cf = 0;
  qword_1ECD09F38 = off_1ECD09F00(33, &cf);
  if (qword_1ECD09F38)
    v0 = 1;
  else
    v0 = cf == 0;
  if (!v0)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v1 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v4 = cf;
      _os_log_error_impl(&dword_1817D9000, v1, OS_LOG_TYPE_ERROR, "Cannot initialize analyzer factory: %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
}

@end
