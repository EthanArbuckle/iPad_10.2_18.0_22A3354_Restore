@implementation DVTFileStream

- (DVTFileStream)initWithURL:(id)a3
{
  id v4;
  DVTFileStream *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSFileHandle *fileHandle;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DVTFileStream;
  v5 = -[DVTFileStream init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1578];
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = objc_retainAutorelease(v4);
    objc_msgSend(v7, "stringWithUTF8String:", objc_msgSend(v8, "fileSystemRepresentation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileHandleForReadingAtPath:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v10;

    objc_storeStrong((id *)&v5->_fileURL, v8);
    v5->_currentRead = 0;
    -[DVTFileStream _updateFileSize](v5, "_updateFileSize");
  }

  return v5;
}

- (BOOL)supportsPeek
{
  return 0;
}

- (void)_updateFileSize
{
  off_t v3;

  v3 = lseek(-[NSFileHandle fileDescriptor](self->_fileHandle, "fileDescriptor"), 0, 1);
  self->_fileSize = lseek(-[NSFileHandle fileDescriptor](self->_fileHandle, "fileDescriptor"), 0, 2);
  if (lseek(-[NSFileHandle fileDescriptor](self->_fileHandle, "fileDescriptor"), v3, 0) != v3)
    sub_222BC5810();
}

- (BOOL)hasData
{
  return self->_currentRead < self->_fileSize;
}

- (id)peek:(unint64_t)a3 error:(id *)a4
{
  __assert_rtn("-[DVTFileStream peek:error:]", "DVTFileStream.m", 49, "false && \"We won't implement this for now.\");
}

- (id)read:(unint64_t)a3 error:(id *)a4
{
  unint64_t currentRead;
  unint64_t fileSize;
  unint64_t v7;
  NSFileHandle *fileHandle;
  size_t v9;
  size_t v10;
  void *v11;

  fileSize = self->_fileSize;
  currentRead = self->_currentRead;
  v7 = currentRead + a3;
  fileHandle = self->_fileHandle;
  v9 = fileSize - currentRead;
  if (v7 <= fileSize)
    v10 = a3;
  else
    v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:deallocator:", mmap(0, v10, 1, 2, -[NSFileHandle fileDescriptor](fileHandle, "fileDescriptor"), self->_currentRead), v10, &unk_24EB275F0);
  self->_currentRead += objc_msgSend(v11, "length");
  return v11;
}

- (id)readToEnd:(id *)a3
{
  return -[DVTFileStream read:error:](self, "read:error:", self->_fileSize - self->_currentRead, a3);
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
