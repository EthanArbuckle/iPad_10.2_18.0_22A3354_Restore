@implementation BKOSLogTranscriptTarget

- (BKOSLogTranscriptTarget)initWithOSLog:(id)a3
{
  id v5;
  BKOSLogTranscriptTarget *v6;
  BKOSLogTranscriptTarget *v7;

  v5 = a3;
  v6 = -[BKOSLogTranscriptTarget init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_log, a3);

  return v7;
}

- (void)writeString:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1C8914000, log, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)writePrefix:(id)a3 label:(id)a4 args:(char *)a5
{
  id v8;
  CFStringRef v9;
  NSObject *log;
  int v11;
  id v12;
  __int16 v13;
  CFStringRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = CFStringCreateWithFormatAndArguments(0, 0, (CFStringRef)a4, a5);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_1C8914000, log, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v11, 0x16u);
  }
  CFRelease(v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
