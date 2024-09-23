@implementation GKSupportLogRoot

void __GKSupportLogRoot_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    objc_msgSend(v0, "objectAtIndex:", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Logs"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("GameKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObjects:", v5, CFSTR("Library"), CFSTR("Logs"), CFSTR("GameKit"), 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v11);
  v8 = v11;

  if ((v7 & 1) == 0)
    NSLog(CFSTR("%@"), v8);
  v9 = (void *)GKSupportLogRoot_sLogRootPath;
  GKSupportLogRoot_sLogRootPath = (uint64_t)v3;
  v10 = v3;

}

@end
