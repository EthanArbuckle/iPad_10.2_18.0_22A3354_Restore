@implementation CLSSocialService

+ (id)defaultFileName
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.plist"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidateMemoryCaches
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CLSSocialService invalidateMemoryCaches]";
    _os_log_error_impl(&dword_1CAB79000, v3, OS_LOG_TYPE_ERROR, "%s need to be implemented", (uint8_t *)&v4, 0xCu);
  }

}

@end
