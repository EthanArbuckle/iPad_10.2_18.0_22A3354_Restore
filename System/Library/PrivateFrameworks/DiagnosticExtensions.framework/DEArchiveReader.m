@implementation DEArchiveReader

- (DEArchiveReader)initWithURL:(id)a3
{
  id v4;
  DEArchiveReader *v5;
  id v6;
  int open_filename;
  NSObject *v8;
  DEArchiveReader *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEArchiveReader;
  v5 = -[DEArchiveReader init](&v11, sel_init);
  if (!v5)
    goto LABEL_6;
  v5->_archive = (archive *)archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  objc_msgSend(v4, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  open_filename = archive_read_open_filename();

  if (open_filename)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEArchiveReader initWithURL:].cold.1((uint64_t)v4, open_filename, v8);

    v9 = 0;
  }
  else
  {
LABEL_6:
    v9 = v5;
  }

  return v9;
}

- (id)listContainedPaths
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (!archive_read_next_header())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", archive_entry_pathname(), 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v2, "addObject:", v3);

  }
  v4 = (void *)objc_msgSend(v2, "copy");

  return v4;
}

- (void)closeArchive
{
  if (self->_archive)
  {
    archive_read_close();
    archive_read_free();
  }
}

- (void)initWithURL:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_ERROR, "Error opening archive at path %@ %d", (uint8_t *)&v3, 0x12u);
}

@end
