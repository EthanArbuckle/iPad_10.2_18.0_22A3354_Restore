@implementation FBKBugFormAttachmentPreview

+ (id)textFileForString:(id)a3 withFileName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a4, "stringByAppendingPathExtension:", CFSTR("txt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeToFile:atomically:encoding:error:", v11, 1, 4, 0);

  return v10;
}

+ (id)textFileForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v20;

  v4 = a3;
  objc_msgSend(a1, "URLByRemovingInvalidExtensions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("txt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeItemAtURL:error:", v12, 0);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v14, "copyItemAtURL:toURL:error:", v4, v12, &v20);
  v15 = v20;

  v16 = v12;
  if (v15)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[FBKBugFormAttachmentPreview textFileForURL:].cold.1((uint64_t)v15, v17);

    v16 = v4;
  }
  v18 = v16;

  return v18;
}

+ (id)previewTypeURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("synced"));

  v6 = v3;
  if (v5)
  {
    objc_msgSend(v3, "URLByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (BOOL)canPreviewItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  v4 = a3;
  objc_msgSend(a1, "previewTypeURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("zip"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend(a1, "urlPointsToTextFile:", v5) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x24BDE5EC0], "canPreviewItem:", v4);
  }

  return v8;
}

+ (BOOL)urlPointsToTextFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  objc_msgSend(a1, "URLByRemovingInvalidExtensions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "extensionIsTextFile:", v5);

  return (char)v3;
}

+ (BOOL)extensionIsTextFile:(id)a3
{
  return objc_msgSend(&unk_24E18D688, "containsObject:", a3);
}

+ (id)URLByRemovingInvalidExtensions:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasLog_dot_number:", v4) & 1) != 0 || objc_msgSend(a1, "hasIps_dot_synced:", v4))
  {
    objc_msgSend(v4, "URLByDeletingPathExtension");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)hasIps_dot_synced:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("ips")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("synced"));

  }
  return v5;
}

+ (BOOL)hasLog_dot_number:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\.log\\.[0-9]+"), 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[FBKBugFormAttachmentPreview hasLog_dot_number:].cold.1((uint64_t)v3, (uint64_t)v6, v7);

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0;
  }

  return v8;
}

+ (void)textFileForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Error copying file: [%{public}@] ", (uint8_t *)&v2, 0xCu);
}

+ (void)hasLog_dot_number:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "error parsing url [%{public}@] with error [%{public}@]", (uint8_t *)&v3, 0x16u);
}

@end
