@implementation CalWellKnownPaths

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "resetPaths");
}

+ (void)resetPaths
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[CalDefaults thisProcess](CalDefaults, "thisProcess");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[CalWellKnownPaths realHomeDirectoryPath](CalWellKnownPaths, "realHomeDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)LibraryDirectory;
  LibraryDirectory = v3;

  objc_msgSend(v10, "stringForKey:", CFSTR("CalendarsDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "stringForKey:", CFSTR("CalendarsDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByExpandingTildeToNonSandboxHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/Calendars"), LibraryDirectory);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "stringByResolvingSymlinksInPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)CalendarsDirectory;
  CalendarsDirectory = v8;

}

+ (id)realHomeDirectoryPath
{
  uid_t v2;
  passwd *v3;
  __CFString *v4;

  v2 = getuid();
  v3 = getpwuid(v2);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3->pw_dir);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("~/");
  }
  return v4;
}

+ (BOOL)checkOrCreatePath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v13;
  char v14;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByExpandingTildeToNonSandboxHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v14))
    v7 = v14 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v13 = 0;
    v11 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v13);
    v8 = v13;
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unable to create directory: %@ (%@)"), v6, v10);

    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)eventsPendingChangesPath
{
  return (id)objc_msgSend((id)CalendarsDirectory, "stringByAppendingPathComponent:", CFSTR("Pending Events"));
}

+ (id)calendarFileHandlerPath
{
  return CFSTR("/System/Library/CoreServices/CalendarFileHandler.app");
}

@end
