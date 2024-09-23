@implementation MFFileArchiveEntry

+ (id)archiveEntry
{
  return objc_alloc_init(MFFileArchiveEntry);
}

- (MFFileArchiveEntry)initWithContents:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  MFFileArchiveEntry *v9;
  uint64_t v10;
  NSString *path;

  v7 = a3;
  v8 = a4;
  v9 = -[MFFileArchiveEntry init](self, "init");
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    path = v9->_path;
    v9->_path = (NSString *)v10;

    objc_storeStrong((id *)&v9->_contents, a3);
    v9->_uncompressedSize = objc_msgSend(v7, "length");
  }

  return v9;
}

- (MFFileArchiveEntry)initWithDirectoryPath:(id)a3
{
  id v4;
  MFFileArchiveEntry *v5;
  uint64_t v6;
  NSString *path;
  NSData *contents;

  v4 = a3;
  v5 = -[MFFileArchiveEntry init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

    contents = v5->_contents;
    v5->_contents = 0;

    v5->_uncompressedSize = 0;
    v5->_isDirectory = 1;
  }

  return v5;
}

+ (MFFileArchiveEntry)archiveEntryWithCentralHeader:(CentralHeader *)a3 archiveData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t var12;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  +[MFFileArchiveEntry archiveEntry](MFFileArchiveEntry, "archiveEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", (char *)&a3->var17 + 2, a3->var11, 4);
    objc_msgSend(v6, "setPath:", v7);

    objc_msgSend(v6, "setUncompressedSize:", a3->var10);
    if (a3->var6 == 8)
      objc_msgSend(v6, "setIsDeflated:", 1);
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    var12 = a3->var12;
    if (objc_msgSend(v6, "uncompressedSize"))
      objc_msgSend(v6, "setCompressedRange:", v9 + var12 + *(unsigned int *)((char *)&a3->var16 + 2) + 34, a3->var9);
    v11 = objc_msgSend(v6, "compressedRange");
    objc_msgSend(v5, "subdataWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContents:", v13);

  }
  return (MFFileArchiveEntry *)v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Path:%@ Data:%lu Uncompressed:%lu Range:[%lu:%lu]"), objc_opt_class(), self->_path, -[NSData length](self->_contents, "length"), self->_uncompressedSize, self->_compressedRange.location, self->_compressedRange.length);
}

- (id)fileName
{
  return -[NSString lastPathComponent](self->_path, "lastPathComponent");
}

- (int64_t)compressedSize
{
  return self->_compressedRange.length;
}

- (void)merge:(id)a3
{
  id v4;
  NSString *path;
  void *v6;
  int64_t uncompressedSize;
  NSUInteger v8;
  char isDeflated;
  void *v10;
  void *contents;
  id v12;

  v4 = a3;
  path = self->_path;
  v12 = v4;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(path) = -[NSString isEqualToString:](path, "isEqualToString:", v6);

  if ((_DWORD)path)
  {
    if (objc_msgSend(v12, "uncompressedSize"))
      uncompressedSize = objc_msgSend(v12, "uncompressedSize");
    else
      uncompressedSize = self->_uncompressedSize;
    -[MFFileArchiveEntry setUncompressedSize:](self, "setUncompressedSize:", uncompressedSize);
    if (objc_msgSend(v12, "compressedRange"))
    {
      self->_compressedRange.location = objc_msgSend(v12, "compressedRange");
      self->_compressedRange.length = v8;
    }
    if (objc_msgSend(v12, "isDeflated"))
      isDeflated = objc_msgSend(v12, "isDeflated");
    else
      isDeflated = self->_isDeflated;
    self->_isDeflated = isDeflated;
    objc_msgSend(v12, "contents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v12, "contents");
      contents = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      contents = self->_contents;
    }
    -[MFFileArchiveEntry setContents:](self, "setContents:", contents);
    if (v10)

  }
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)uncompressedSize
{
  return self->_uncompressedSize;
}

- (void)setUncompressedSize:(int64_t)a3
{
  self->_uncompressedSize = a3;
}

- (_NSRange)compressedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_compressedRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setCompressedRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_compressedRange, &v3, 16, 1, 0);
}

- (BOOL)isDeflated
{
  return self->_isDeflated;
}

- (void)setIsDeflated:(BOOL)a3
{
  self->_isDeflated = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (NSData)contents
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
