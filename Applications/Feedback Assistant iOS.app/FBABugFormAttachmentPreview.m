@implementation FBABugFormAttachmentPreview

+ (id)textFileForString:(id)a3 withFileName:(id)a4
{
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "stringByAppendingPathExtension:", CFSTR("txt")));
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
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
  NSString *v9;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLByRemovingInvalidExtensions:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingPathExtension"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("txt")));
  v9 = NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v13, "removeItemAtURL:error:", v12, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = 0;
  objc_msgSend(v14, "copyItemAtURL:toURL:error:", v4, v12, &v20);
  v15 = v20;

  v16 = v12;
  if (v15)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10009B06C((uint64_t)v15, v17);

    v16 = v4;
  }
  v18 = v16;

  return v18;
}

+ (id)previewTypeURL:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("synced"));

  v6 = v3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByDeletingPathExtension"));

  }
  return v6;
}

+ (BOOL)canPreviewItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "previewTypeURL:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
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
    v8 = +[QLPreviewController canPreviewItem:](QLPreviewController, "canPreviewItem:", v4);
  }

  return v8;
}

+ (BOOL)urlPointsToTextFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLByRemovingInvalidExtensions:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  LOBYTE(v3) = objc_msgSend(v3, "extensionIsTextFile:", v5);

  return (char)v3;
}

+ (BOOL)extensionIsTextFile:(id)a3
{
  return objc_msgSend(&off_1000EEAD8, "containsObject:", a3);
}

+ (id)URLByRemovingInvalidExtensions:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasLog_dot_number:", v4) & 1) != 0
    || objc_msgSend(a1, "hasIps_dot_synced:", v4))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
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
  unsigned __int8 v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("ips")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\.log\\.[0-9]+"), 0, &v10));
  v6 = v10;
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10009B0E0((uint64_t)v3, (uint64_t)v6, v7);

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0;
  }

  return v8;
}

@end
