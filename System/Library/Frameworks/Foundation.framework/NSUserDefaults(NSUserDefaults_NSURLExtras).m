@implementation NSUserDefaults(NSUserDefaults_NSURLExtras)

+ (__CFString)_web_preferredLanguageCode
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;

  v2 = (void *)objc_msgSend(a1, "standardUserDefaults");
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_127);
  v3 = qword_1ECD0A260;
  v4 = (__CFString *)qword_1ECD0A260;
  if (!qword_1ECD0A260)
  {
    v5 = (void *)objc_msgSend(v2, "stringArrayForKey:", CFSTR("AppleLanguages"));
    if (objc_msgSend(v5, "count"))
      v4 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", 0), "_web_HTTPStyleLanguageCode"), "copy");
    else
      v4 = CFSTR("en");
    qword_1ECD0A260 = (uint64_t)v4;
  }
  v6 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_127);
  if (!v3)
    objc_msgSend(a1, "_web_addDefaultsChangeObserver");
  return v6;
}

+ (void)_web_addDefaultsChangeObserver
{
  if (_web_addDefaultsChangeObserver_addDefaultsChangeObserverOnce != -1)
    dispatch_once(&_web_addDefaultsChangeObserver_addDefaultsChangeObserverOnce, &__block_literal_global_54);
}

+ (void)_web_defaultsDidChange
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_127);

  qword_1ECD0A260 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_127);
}

@end
