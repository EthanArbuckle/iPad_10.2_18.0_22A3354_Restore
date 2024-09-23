@implementation JPFileStream

- (JPFileStream)initWithPath:(id)a3
{
  _QWORD *FileStream;
  JPFileStream *v5;
  objc_super v7;

  FileStream = JetPackCreateFileStream((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"));
  if (FileStream)
  {
    v7.receiver = self;
    v7.super_class = (Class)JPFileStream;
    self = -[JPStream initWithBacking:releaseOnDealloc:](&v7, sel_initWithBacking_releaseOnDealloc_, FileStream, 1);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
