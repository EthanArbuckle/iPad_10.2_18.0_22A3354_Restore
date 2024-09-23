@implementation PFZipLocalFileHeader

- (PFZipLocalFileHeader)init
{
  PFZipLocalFileHeader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFZipLocalFileHeader;
  result = -[PFZipLocalFileHeader init](&v3, sel_init);
  if (result)
  {
    result->_lastModDate = 0;
    *(_QWORD *)&result->_versionNeededToExtract = 0;
    *(_QWORD *)&result->_uncompressedSize = 0;
    *(_QWORD *)&result->_crc32 = 0;
    result->_filename = 0;
    result->_extraFieldData = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_filename = 0;
  self->_extraFieldData = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFZipLocalFileHeader;
  -[PFZipLocalFileHeader dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFZipLocalFileHeader;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), -[PFZipLocalFileHeader description](&v3, sel_description), self->_filename);
}

@end
