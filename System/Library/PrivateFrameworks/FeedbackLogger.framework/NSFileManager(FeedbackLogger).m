@implementation NSFileManager(FeedbackLogger)

- (id)feedbackLoggerDirectoryURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.feedbacklogger"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)urlForStoreWithId:()FeedbackLogger
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "feedbackLoggerDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = *MEMORY[0x1E0CB2AA8];
    v11[0] = &unk_1E68A6240;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, v7, 0);

  }
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("data.sqlite"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
