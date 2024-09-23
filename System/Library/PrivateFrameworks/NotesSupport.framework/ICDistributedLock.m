@implementation ICDistributedLock

- (ICDistributedLock)init
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s should not be used."), "-[ICDistributedLock init]");

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v3, 0));
}

+ (id)lockWithPath:(id)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithPath:", a3);
}

- (ICDistributedLock)initWithPath:(id)a3
{
  ICDistributedLock *v5;
  objc_super v7;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "directoryCanBeCreatedAtPath:", a3) & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICDistributedLock;
    v5 = -[ICDistributedLock init](&v7, sel_init);
    v5->threadLock = (NSLock *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), "init");
    v5->lockName = (NSString *)objc_msgSend(a3, "copyWithZone:", 0);
    v5->hasLock = 0;
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)invalidate
{
  -[NSLock lock](self->threadLock, "lock");
  if (self->hasLock && self->lockName)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", self->lockName, 0);

  self->lockName = 0;
  self->hasLock = 0;
  -[NSLock unlock](self->threadLock, "unlock");

  self->threadLock = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[ICDistributedLock invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICDistributedLock;
  -[ICDistributedLock dealloc](&v3, sel_dealloc);
}

- (BOOL)tryLock
{
  BOOL v3;
  char v5[1026];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->threadLock, "lock");
  if (self->hasLock
    || !-[NSString getFileSystemRepresentation:maxLength:](self->lockName, "getFileSystemRepresentation:maxLength:", v5, 1024)|| mkdir(v5, 0x1FFu))
  {
    -[NSLock unlock](self->threadLock, "unlock");
    return 0;
  }
  else
  {
    v3 = 1;
    self->hasLock = 1;
    -[NSLock unlock](self->threadLock, "unlock");
  }
  return v3;
}

- (void)breakLock
{
  -[NSLock lock](self->threadLock, "lock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", self->lockName, 0);
  self->hasLock = 0;
  -[NSLock unlock](self->threadLock, "unlock");
}

- (NSDate)lockDate
{
  double v2;
  stat v4;
  char v5[1026];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&v4.st_mtimespec, 0, 96);
  if (!-[NSString getFileSystemRepresentation:maxLength:](self->lockName, "getFileSystemRepresentation:maxLength:", v5, 1024, 0, 0, 0, 0, 0, 0))return 0;
  if (stat(v5, &v4) < 0)
    v2 = 0.0;
  else
    v2 = (double)v4.st_mtimespec.tv_sec - *MEMORY[0x1E0C9ADF8] + (double)v4.st_mtimespec.tv_nsec * 0.000000001;
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v2);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  v6 = "YES";
  if (!self->hasLock)
    v6 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%s(%p) locked: %s  path: '%@'"), Name, self, v6, self->lockName);
}

@end
