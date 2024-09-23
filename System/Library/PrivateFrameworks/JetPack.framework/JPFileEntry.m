@implementation JPFileEntry

- (BOOL)writeStream:(id)a3 toDirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  JetPack::ArchiveStream **v11;
  id v12;
  char *v13;
  char v14;
  BOOL v15;

  v8 = a4;
  v9 = a3;
  v10 = -[JPFileEntry backing](self, "backing");
  v11 = (JetPack::ArchiveStream **)objc_msgSend(v9, "backing");

  v12 = objc_retainAutorelease(v8);
  v13 = (char *)objc_msgSend(v12, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));

  v14 = JetPackFileEntryWriteToDirectory((uint64_t)v10, v11, v13);
  v15 = v14;
  if (a5 && (v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("JPErrorDomain"), 0, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (NSString)pathname
{
  JetPack::DiagnosticContext *v2;
  uint64_t v3;
  void *v4;
  void *Pathname;

  v2 = -[JPFileEntry backing](self, "backing");
  Pathname = (void *)JetPackFileEntryGetPathname(v2, v3, v4);
  if (Pathname)
    Pathname = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", Pathname);
  return (NSString *)Pathname;
}

- (void)backing
{
  return self->_backing;
}

- (JPFileEntry)initWithBacking:(void *)a3 releaseOnDealloc:(BOOL)a4
{
  JPFileEntry *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JPFileEntry;
  result = -[JPFileEntry init](&v7, sel_init);
  if (result)
  {
    result->_backing = a3;
    result->_releaseBackingOnDealloc = a4;
  }
  return result;
}

- (void)setBacking:(void *)a3
{
  self->_backing = a3;
}

- (BOOL)releaseBackingOnDealloc
{
  return self->_releaseBackingOnDealloc;
}

@end
