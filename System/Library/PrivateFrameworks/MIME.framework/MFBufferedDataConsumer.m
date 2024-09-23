@implementation MFBufferedDataConsumer

- (MFBufferedDataConsumer)init
{
  MFBufferedDataConsumer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFBufferedDataConsumer;
  v2 = -[MFBufferedDataConsumer init](&v4, sel_init);
  if (v2)
  {
    v2->_unwritten = (NSMutableData *)objc_alloc_init(MFMutableData);
    v2->_fd = -1;
  }
  return v2;
}

- (void)dealloc
{
  int fd;
  NSString *path;
  objc_super v5;

  fd = self->_fd;
  if (fd != -1)
    close(fd);
  path = self->_path;
  if (path)
  {
    MFRemoveItemAtPath(path);

  }
  v5.receiver = self;
  v5.super_class = (Class)MFBufferedDataConsumer;
  -[MFBufferedDataConsumer dealloc](&v5, sel_dealloc);
}

- (id)data
{
  NSData *complete;
  NSData *v3;
  id result;
  int fd;
  NSMutableData *unwritten;
  size_t v8;

  complete = self->_complete;
  if (complete)
  {
    v3 = complete;
    return v3;
  }
  fd = self->_fd;
  unwritten = self->_unwritten;
  if (fd == -1)
  {
    v3 = (NSData *)-[NSMutableData copy](unwritten, "copy");
    return v3;
  }
  v8 = -[NSMutableData length](unwritten, "length");
  if (v8)
  {
    if (write(self->_fd, (const void *)-[NSMutableData bytes](self->_unwritten, "bytes"), v8) == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in write while returning data: (%d)"), *__error());
    -[NSMutableData setLength:](self->_unwritten, "setLength:", 0);
  }
  result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", self->_path, 8, 0);
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to read incomplete data from disk."));
    return 0;
  }
  return result;
}

- (int64_t)appendData:(id)a3
{
  unint64_t v3;
  NSUInteger v6;
  size_t v7;
  void *v8;
  NSString *v9;
  int fd;

  if (self->_complete)
    return -1;
  v3 = objc_msgSend(a3, "length");
  v6 = -[NSMutableData length](self->_unwritten, "length");
  if (v6 + v3 < sDefaultThreshold)
    goto LABEL_13;
  v7 = v6;
  if (!self->_path)
  {
    pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (NSString *)(id)objc_msgSend(v8, "mf_makeUniqueFileInDirectory:", sMFDataPath);
    self->_path = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to create temporary cache file path for append."));
      if (v7)
        goto LABEL_10;
      goto LABEL_13;
    }
    fd = open(-[NSString fileSystemRepresentation](v9, "fileSystemRepresentation"), 1538, 438);
    self->_fd = fd;
    if (fd == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Could not create cache file for append at %@ (%d)."), sMFDataPath, *__error());
      fd = self->_fd;
    }
    MFProtectFileDescriptor(fd, 3);
  }
  if (v7)
  {
LABEL_10:
    if (write(self->_fd, (const void *)-[NSMutableData bytes](self->_unwritten, "bytes"), v7) == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in write while appending data: (%d)"), *__error());
    -[NSMutableData setLength:](self->_unwritten, "setLength:", 0);
  }
LABEL_13:
  if (v3 < sDefaultThreshold)
  {
    -[NSMutableData appendData:](self->_unwritten, "appendData:", a3);
    return v3;
  }
  v3 = write(self->_fd, (const void *)objc_msgSend(a3, "bytes"), v3);
  if (v3 != -1)
    return v3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in write while appending data: (%d)"), *__error());
  return -1;
}

- (void)done
{
  int fd;
  NSMutableData *unwritten;
  size_t v5;
  NSData *v6;
  id v7;

  if (!self->_complete)
  {
    fd = self->_fd;
    unwritten = self->_unwritten;
    if (fd == -1)
    {
      self->_complete = (NSData *)-[NSMutableData copy](unwritten, "copy");

      self->_unwritten = 0;
    }
    else
    {
      v5 = -[NSMutableData length](unwritten, "length");
      if (v5 && write(self->_fd, (const void *)-[NSMutableData bytes](self->_unwritten, "bytes"), v5) == -1)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in write while completing: (%d)"), *__error());

      self->_unwritten = 0;
      v7 = 0;
      v6 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", self->_path, 8, &v7);
      self->_complete = v6;
      if (!v6)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to read complete data from disk: %@"), objc_msgSend(v7, "ef_publicDescription"));
      close(self->_fd);
      self->_fd = -1;

      self->_path = 0;
    }
  }
}

@end
