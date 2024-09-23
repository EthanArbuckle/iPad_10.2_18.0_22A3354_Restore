@implementation ML3LogSQLiteProfilingMessage

void __ML3LogSQLiteProfilingMessage_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!__MLProfileLogFileHandle)
  {
    +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", 24);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("medialibrary_sqlite.log"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0) & 1) == 0)
    {
      objc_msgSend(v3, "stringByDeletingLastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, 0) & 1) == 0)
        objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);
      objc_msgSend(v4, "createFileAtPath:contents:attributes:", v3, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)__MLProfileLogFileHandle;
    __MLProfileLogFileHandle = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), *(_QWORD *)(a1 + 32));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__MLProfileLogFileHandle, "ml_lock");
  objc_msgSend((id)__MLProfileLogFileHandle, "seekToEndOfFile");
  v8 = (void *)__MLProfileLogFileHandle;
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeData:", v9);

  objc_msgSend((id)__MLProfileLogFileHandle, "ml_unlock");
}

@end
