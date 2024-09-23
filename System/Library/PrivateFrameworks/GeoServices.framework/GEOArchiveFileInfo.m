@implementation GEOArchiveFileInfo

- (GEOArchiveFileInfo)initWithFilePath:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  id v8;
  GEOArchiveFileInfo *v9;
  uint64_t v10;
  NSString *filePath;
  GEOArchiveFileInfo *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOArchiveFileInfo;
  v9 = -[GEOArchiveFileInfo init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    filePath = v9->_filePath;
    v9->_filePath = (NSString *)v10;

    v9->_offset = a4;
    v9->_length = a5;
    v12 = v9;
  }

  return v9;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
