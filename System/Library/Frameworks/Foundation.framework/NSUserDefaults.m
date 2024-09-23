@implementation NSUserDefaults

uint64_t __51__NSUserDefaults_NSUserDefaults__registerDefaults___block_invoke(uint64_t a1, uint64_t a2, NSData *a3)
{
  uint64_t result;
  void *v7;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    return objc_msgSend(v7, "setObject:forKey:", encodeURLForDefaults(a3), a2);
  }
  return result;
}

uint64_t __41__NSUserDefaults_NSUserDefaults__release__block_invoke()
{
  uint64_t result;

  result = _CFAppVersionCheckLessThan();
  _MergedGlobals_126 = result;
  return result;
}

uint64_t __76__NSUserDefaults_NSUserDefaults_NSURLExtras___web_addDefaultsChangeObserver__block_invoke()
{
  NSNotificationCenter *v0;

  v0 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  return -[NSNotificationCenter addObserver:selector:name:object:](v0, "addObserver:selector:name:object:", objc_opt_self(), sel__web_defaultsDidChange, CFSTR("NSUserDefaultsDidChangeNotification"), objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"));
}

void ___NSUserDefaults_Log_Nonsensical_Suites_block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("NSGlobalDomain")))
    NSLog((NSString *)CFSTR("Using NSGlobalDomain as an NSUserDefaults suite name does not make sense and will not work. Break on _NSUserDefaults_Log_Nonsensical_Suites to find this"));
  else
    NSLog((NSString *)CFSTR("Using your own bundle identifier as an NSUserDefaults suite name does not make sense and will not work. Break on _NSUserDefaults_Log_Nonsensical_Suites to find this"));
}

@end
