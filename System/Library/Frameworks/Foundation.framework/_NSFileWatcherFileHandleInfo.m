@implementation _NSFileWatcherFileHandleInfo

+ (id)openFileWithPath:(id)a3
{
  int v3;
  _NSFileWatcherDirectoryFileHandleInfo *v4;
  _NSFileWatcherDirectoryFileHandleInfo *v5;
  uint64_t v6;
  void *v7;
  _NSFileWatcherFileHandleInfo *v8;
  _NSFileWatcherFileHandleInfo *v9;
  stat v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 2129920);
  if (_MergedGlobals_152 != -1)
    dispatch_once(&_MergedGlobals_152, &__block_literal_global_83);
  if (v3 == -1)
    return 0;
  memset(&v11, 0, sizeof(v11));
  if (!fstat(v3, &v11) && (v11.st_mode & 0xF000) == 0x4000)
  {
    v4 = objc_alloc_init(_NSFileWatcherDirectoryFileHandleInfo);
    if (v4)
    {
      v5 = v4;
      *(_DWORD *)(&v4->super.closed + 1) = v11.st_dev;
      *(_QWORD *)((char *)&v4->inodeDevPair.dev + 1) = v11.st_ino;
      v6 = objc_msgSend((id)qword_1ECD0A850, "member:", v4);
      if (v6)
      {
        v7 = (void *)v6;
        close(v3);
        v8 = v7;

      }
      else
      {
        v5->super.fileHandle = v3;
        v8 = v5;
      }
      objc_msgSend((id)qword_1ECD0A850, "addObject:", v8);
      return v8;
    }
    return 0;
  }
  v9 = objc_alloc_init(_NSFileWatcherFileHandleInfo);
  v8 = v9;
  if (v9)
    v9->fileHandle = v3;
  return v8;
}

- (BOOL)verifyAccessByAuditToken:(id *)a3
{
  _BYTE v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  return fcntl(self->fileHandle, 50, v4) != -1 && sandbox_check_by_audit_token() == 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (void)close
{
  NSString *v3;

  if (self->closed)
  {
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to close a file descriptor that was already closed: %@"), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v3, 0));
  }
  close(self->fileHandle);
  self->closed = 1;
}

- (void)dealloc
{
  NSString *v2;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->fileHandle && !self->closed)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ was deallocated without being closed"), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v2, 0));
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSFileWatcherFileHandleInfo;
  -[_NSFileWatcherFileHandleInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> File: %d"), objc_opt_class(), self, self->fileHandle);
}

@end
