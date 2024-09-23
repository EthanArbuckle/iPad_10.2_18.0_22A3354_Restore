@implementation FSItem

+ (id)FileHandleForFileID:(unint64_t)a3
{
  unint64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FSItem)init
{
  FSItem *v2;
  uint64_t v3;
  NSData *fileHandle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FSItem;
  v2 = -[FSItem init](&v6, sel_init);
  if (v2)
  {
    ++fileHandleCounter;
    +[FSItem FileHandleForFileID:](FSItem, "FileHandleForFileID:");
    v3 = objc_claimAutoreleasedReturnValue();
    fileHandle = v2->_fileHandle;
    v2->_fileHandle = (NSData *)v3;

  }
  return v2;
}

- (NSData)fileHandle
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
