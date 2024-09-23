@implementation ICExclusiveLock

- (ICExclusiveLock)initWithName:(id)a3 cachePath:(id)a4
{
  id v7;
  id v8;
  ICExclusiveLock *v9;
  ICExclusiveLock *v10;
  uint64_t v11;
  NSString *fullPath;
  id v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICExclusiveLock;
  v9 = -[ICExclusiveLock init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7 || !v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must pass a name cachePath into initWithName:"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_cachePath, a4);
    -[NSString stringByAppendingPathComponent:](v10->_cachePath, "stringByAppendingPathComponent:", v10->_name);
    v11 = objc_claimAutoreleasedReturnValue();
    fullPath = v10->_fullPath;
    v10->_fullPath = (NSString *)v11;

    v10->_fd = -1;
  }

  return v10;
}

- (void)unlock
{
  int fd;

  fd = self->_fd;
  if (fd != -1)
  {
    close(fd);
    self->_fd = -1;
  }
}

- (void)lock
{
  if (self->_fd == -1)
    self->_fd = open(-[NSString fileSystemRepresentation](self->_fullPath, "fileSystemRepresentation"), 544, 448);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICExclusiveLock;
  -[ICExclusiveLock dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullPath, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (ICExclusiveLock)init
{
  return -[ICExclusiveLock initWithName:cachePath:](self, "initWithName:cachePath:", 0, 0);
}

- (BOOL)tryLock
{
  int v4;

  if (self->_fd != -1)
    return 1;
  v4 = open(-[NSString fileSystemRepresentation](self->_fullPath, "fileSystemRepresentation"), 548, 448);
  self->_fd = v4;
  return v4 != -1;
}

- (void)setName:(id)a3
{
  NSString **p_name;
  BOOL v6;
  void *v7;
  NSString *name;
  NSString **v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_name = &self->_name;
  v6 = -[NSString isEqualToString:](self->_name, "isEqualToString:", v14);
  v7 = v14;
  if (!v6)
  {
    if (self->_fd != -1)
    {
      v9 = &self->_name;
      name = self->_name;
      v10 = v9[1];
      -[NSString stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", name);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "moveItemAtPath:toPath:error:", v11, v12, 0);

    }
    objc_storeStrong((id *)p_name, a3);
    v7 = v14;
  }

}

- (id)name
{
  return self->_name;
}

@end
