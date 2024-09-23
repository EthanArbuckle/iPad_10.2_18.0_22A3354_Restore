@implementation NSURL(SYTemporaryFileAPI)

+ (id)_SYTemporaryFileURL:()SYTemporaryFileAPI
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  char *v13;
  int v14;
  uint64_t v15;
  id v16;
  id v17;

  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("CompanionSync"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, a3);

    v11 = 0;
    if (!v10)
      goto LABEL_10;
  }
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("XXXXXXXX"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = strdup((const char *)objc_msgSend(v12, "UTF8String"));
  v14 = mkstemp(v13);
  if (v14 == -1)
  {
    if (a3)
    {
      v15 = *__error();
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v17 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v15, 0);
      v11 = 0;
      *a3 = v17;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    close(v14);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v13, 0, 0);
  }
  free(v13);

LABEL_10:
  return v11;
}

@end
