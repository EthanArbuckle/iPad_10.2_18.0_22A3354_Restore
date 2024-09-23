@implementation HDAttachmentFileHandleReader

- (id)initAdoptingFileHandle:(id)a3
{
  id v5;
  HDAttachmentFileHandleReader *v6;
  HDAttachmentFileHandleReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDAttachmentFileHandleReader;
  v6 = -[HDAttachmentFileHandleReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileHandle, a3);

  return v7;
}

- (id)readDataUpToLength:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5
{
  NSFileHandle *fileHandle;
  void *v9;

  fileHandle = self->_fileHandle;
  if (!fileHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 126, CFSTR("File handle has already been closed."));
    goto LABEL_5;
  }
  if (!-[NSFileHandle seekToOffset:error:](fileHandle, "seekToOffset:error:", a4, a5))
  {
LABEL_5:
    v9 = 0;
    return v9;
  }
  -[NSFileHandle readDataUpToLength:error:](self->_fileHandle, "readDataUpToLength:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (void)close
{
  NSFileHandle *fileHandle;
  NSFileHandle *v4;

  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    -[NSFileHandle closeFile](fileHandle, "closeFile");
    v4 = self->_fileHandle;
    self->_fileHandle = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
