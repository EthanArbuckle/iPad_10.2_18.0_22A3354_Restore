@implementation NSTask

- (void)terminationHandler
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setTerminationHandler:(void *)terminationHandler
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)terminationStatus
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTaskTerminationReason)terminationReason
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)isRunning
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)launch
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)launchAndReturnError:(NSError *)error
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setArguments:(NSArray *)arguments
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCurrentDirectoryPath:(NSString *)currentDirectoryPath
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCurrentDirectoryURL:(NSURL *)currentDirectoryURL
{
  NSString *v6;
  void *v7;

  if (currentDirectoryURL)
  {
    if (!-[NSURL isFileURL](currentDirectoryURL, "isFileURL"))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: non-file URL argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
      objc_exception_throw(v7);
    }
    v6 = (NSString *)objc_msgSend(-[NSURL standardizedURL](currentDirectoryURL, "standardizedURL"), "path");
  }
  else
  {
    v6 = -[NSFileManager currentDirectoryPath](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "currentDirectoryPath");
  }
  -[NSTask setCurrentDirectoryPath:](self, "setCurrentDirectoryPath:", v6);
}

- (NSURL)currentDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", -[NSTask currentDirectoryPath](self, "currentDirectoryPath"), 1);
}

- (void)setEnvironment:(NSDictionary *)environment
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setLaunchPath:(NSString *)launchPath
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSURL)executableURL
{
  NSURL *result;

  result = -[NSTask launchPath](self, "launchPath");
  if (result)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", result, 0);
  return result;
}

- (void)setExecutableURL:(NSURL *)executableURL
{
  NSURL *v4;
  void *v6;

  if (executableURL)
  {
    v4 = executableURL;
    if (!-[NSURL isFileURL](executableURL, "isFileURL"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: non-file URL argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
      objc_exception_throw(v6);
    }
    executableURL = (NSURL *)objc_msgSend(-[NSURL standardizedURL](v4, "standardizedURL"), "path");
  }
  -[NSTask setLaunchPath:](self, "setLaunchPath:", executableURL);
}

- (void)interrupt
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)terminate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)suspend
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)resume
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (int64_t)suspendCount
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (int)processIdentifier
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)launchPath
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)environment
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)arguments
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)currentDirectoryPath
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)launchRequirementData
{
  return 0;
}

- (void)setStandardInput:(id)standardInput
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setStandardOutput:(id)standardOutput
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setStandardError:(id)standardError
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)standardInput
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)standardOutput
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)standardError
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTask"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSQualityOfService)qualityOfService
{
  return 0;
}

- (BOOL)isSpawnedProcessDisclaimed
{
  return 0;
}

- (NSTask)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSTask;
  return -[NSTask init](&v3, sel_init);
}

+ (NSTask)allocWithZone:(_NSZone *)a3
{
  if (NSTask == a1)
    a1 = (id)objc_opt_self();
  return (NSTask *)NSAllocateObject((Class)a1, 0, a3);
}

+ (id)currentTaskDictionary
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", -[NSFileManager currentDirectoryPath](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "currentDirectoryPath"), CFSTR("_NSTaskDirectoryPath"), +[NSFileHandle fileHandleWithStandardInput](NSFileHandle, "fileHandleWithStandardInput"), CFSTR("_NSTaskInputFileHandle"), +[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"), CFSTR("_NSTaskOutputFileHandle"), +[NSFileHandle fileHandleWithStandardError](NSFileHandle, "fileHandleWithStandardError"), CFSTR("_NSTaskDiagnosticFileHandle"), 0);
}

+ (id)launchedTaskWithDictionary:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)a1), "init");
  objc_msgSend(v4, "launchWithDictionary:error:", a3, 0);
  return v4;
}

+ (NSTask)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments
{
  NSTask *v6;
  id v7;
  void *v8;

  v6 = (NSTask *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "init");
  v7 = +[NSTask currentTaskDictionary](NSTask, "currentTaskDictionary");
  if (!arguments)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("must provide array of arguments"), 0));
  v8 = v7;
  objc_msgSend(v7, "setObject:forKey:", path, CFSTR("_NSTaskExecutablePath"));
  objc_msgSend(v8, "setObject:forKey:", arguments, CFSTR("_NSTaskArgumentArray"));
  -[NSTask launchWithDictionary:error:](v6, "launchWithDictionary:error:", v8, 0);
  return v6;
}

+ (NSTask)launchedTaskWithExecutableURL:(NSURL *)url arguments:(NSArray *)arguments error:(NSError *)error terminationHandler:(void *)terminationHandler
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  NSURL *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!url)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("must provide a launch url");
    goto LABEL_16;
  }
  if (!-[NSURL isFileURL](url, "isFileURL"))
  {
    if (!error)
      return 0;
    v24 = CFSTR("NSURL");
    v25[0] = url;
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v18 = 262;
LABEL_11:
    *error = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v18, v17);
    return 0;
  }
  v11 = -[NSURL path](url, "path");
  if (!v11)
  {
    if (!error)
      return 0;
    v22 = CFSTR("NSURL");
    v23 = url;
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v18 = 260;
    goto LABEL_11;
  }
  v12 = v11;
  v13 = objc_alloc_init((Class)a1);
  if (!arguments)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("must provide array of arguments");
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0, terminationHandler));
  }
  v14 = v13;
  v15 = +[NSTask currentTaskDictionary](NSTask, "currentTaskDictionary");
  objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("_NSTaskExecutablePath"));
  objc_msgSend(v15, "setObject:forKey:", arguments, CFSTR("_NSTaskArgumentArray"));
  objc_msgSend(v15, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_NSTaskUseErrorsForRuntimeFailures"));
  objc_msgSend(v14, "setTerminationHandler:", terminationHandler);
  if ((objc_msgSend(v14, "launchWithDictionary:error:", v15, error) & 1) != 0)
    return (NSTask *)v14;

  return 0;
}

@end
