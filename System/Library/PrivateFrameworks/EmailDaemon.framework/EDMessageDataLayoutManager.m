@implementation EDMessageDataLayoutManager

+ (id)messageDataDirectoryURLForGlobalMessageID:(int64_t)a3 basePath:(id)a4 purgeable:(BOOL)a5
{
  void *v7;
  void *v8;

  objc_msgSend(a1, "rootMessageDataDirectoryForBasePath:purgeable:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messageDataDirectoryURLForGlobalMessageID:rootMessageDataDirectory:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)messageDataDirectoryURLForGlobalMessageID:(int64_t)a3 rootMessageDataDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:relativeToURL:", v8, 1, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)rootMessageDataDirectoryForBasePath:(id)a3 purgeable:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("MessageData");
  else
    v7 = CFSTR("NonpurgeableMessageData");
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
