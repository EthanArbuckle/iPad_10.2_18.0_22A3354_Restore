@implementation _NSFileWatcherDirectoryFileHandleInfo

- (unint64_t)hash
{
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class();
  return v5 == objc_opt_class()
      && *(_DWORD *)(&self->super.closed + 1) == *(_DWORD *)((char *)a3 + 13)
      && *(_QWORD *)((char *)&self->inodeDevPair.dev + 1) == *(_QWORD *)((char *)a3 + 17);
}

- (BOOL)isDirectory
{
  return 1;
}

- (void)close
{
  _NSFileWatcherDirectoryFileHandleInfo *v3;
  _NSFileWatcherDirectoryFileHandleInfo *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_msgSend((id)qword_1ECD0A850, "removeObject:", self);
  if (!objc_msgSend((id)qword_1ECD0A850, "countForObject:", self))
  {
    v5.receiver = self;
    v5.super_class = (Class)_NSFileWatcherDirectoryFileHandleInfo;
    -[_NSFileWatcherFileHandleInfo close](&v5, sel_close);
  }
  v4 = self;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> Directory: %d - inode: %llu dev: %d"), objc_opt_class(), self, self->super.fileHandle, *(_QWORD *)((char *)&self->inodeDevPair.dev + 1), *(unsigned int *)(&self->super.closed + 1));
}

@end
