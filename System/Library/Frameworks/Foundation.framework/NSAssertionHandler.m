@implementation NSAssertionHandler

+ (NSAssertionHandler)currentHandler
{
  NSMutableDictionary *v2;
  uint64_t v3;
  NSAssertionHandler *v4;
  BOOL v5;

  v2 = -[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary");
  v3 = -[NSMutableDictionary objectForKey:](v2, "objectForKey:", CFSTR("NSAssertionHandler"));
  v4 = (NSAssertionHandler *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v4 = (NSAssertionHandler *)objc_msgSend(objc_allocWithZone((Class)NSAssertionHandler), "init");
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v4, CFSTR("NSAssertionHandler"));

  }
  return v4;
}

- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format
{
  NSObject *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  NSInteger v22;
  uint64_t v23;
  va_list va;

  va_start(va, format);
  v23 = *MEMORY[0x1E0C80C00];
  v12 = _NSOSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v18 = _NSFullMethodName((objc_class *)object, selector);
    v19 = 2112;
    v20 = fileName;
    v21 = 2048;
    v22 = line;
    _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %@, %@:%ld", buf, 0x20u);
  }
  v13 = [NSString alloc];
  if (format)
    v14 = format;
  else
    v14 = (NSString *)CFSTR(" ");
  v15 = -[NSString initWithFormat:locale:arguments:](v13, "initWithFormat:locale:arguments:", v14, 0, va);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v15, _userInfoForFileAndLine((uint64_t)fileName, line));
  objc_exception_throw(v16);
}

- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format
{
  NSObject *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  NSInteger v20;
  uint64_t v21;
  va_list va;

  va_start(va, format);
  v21 = *MEMORY[0x1E0C80C00];
  v10 = _NSOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v16 = functionName;
    v17 = 2112;
    v18 = fileName;
    v19 = 2048;
    v20 = line;
    _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %@(), %@:%ld", buf, 0x20u);
  }
  v11 = [NSString alloc];
  if (format)
    v12 = format;
  else
    v12 = (NSString *)CFSTR(" ");
  v13 = -[NSString initWithFormat:locale:arguments:](v11, "initWithFormat:locale:arguments:", v12, 0, va);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v13, _userInfoForFileAndLine((uint64_t)fileName, line));
  objc_exception_throw(v14);
}

@end
