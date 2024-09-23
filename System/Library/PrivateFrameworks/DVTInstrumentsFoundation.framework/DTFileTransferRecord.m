@implementation DTFileTransferRecord

- (BOOL)isTransferOpen
{
  return self->_writeHandle != 0;
}

- (void)closeFileTransfer
{
  NSFileHandle *writeHandle;
  NSFileHandle *v4;

  writeHandle = self->_writeHandle;
  if (writeHandle)
  {
    -[NSFileHandle closeFile](writeHandle, "closeFile");
    v4 = self->_writeHandle;
    self->_writeHandle = 0;

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[DTFileTransferRecord closeFileTransfer](self, "closeFileTransfer");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", self->_destinationDirectoryURLToRemoveOnDealloc, 0);

  v4.receiver = self;
  v4.super_class = (Class)DTFileTransferRecord;
  -[DTFileTransferRecord dealloc](&v4, sel_dealloc);
}

- (NSURL)destinationDirectoryURLToRemoveOnDealloc
{
  return self->_destinationDirectoryURLToRemoveOnDealloc;
}

- (void)setDestinationDirectoryURLToRemoveOnDealloc:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDirectoryURLToRemoveOnDealloc, a3);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_storeStrong((id *)&self->_destinationURL, a3);
}

- (NSFileHandle)writeHandle
{
  return self->_writeHandle;
}

- (void)setWriteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_writeHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeHandle, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_destinationDirectoryURLToRemoveOnDealloc, 0);
}

@end
