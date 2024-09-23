@implementation PFZipCentralDirectoryFileHeader

- (PFZipCentralDirectoryFileHeader)init
{
  PFZipCentralDirectoryFileHeader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFZipCentralDirectoryFileHeader;
  result = -[PFZipCentralDirectoryFileHeader init](&v3, sel_init);
  if (result)
  {
    result->_externalFileAttrs = 0;
    result->_localFileHeaderRelativeOffset = 0;
    *(_OWORD *)&result->_versionMadeBy = 0u;
    *(_OWORD *)&result->_compressedSize = 0u;
    result->_internalFileAttrs = 0;
    result->_extraFieldData = 0;
    result->_fileComment = 0;
    result->_filename = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_filename = 0;
  self->_extraFieldData = 0;

  self->_fileComment = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFZipCentralDirectoryFileHeader;
  -[PFZipCentralDirectoryFileHeader dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFZipCentralDirectoryFileHeader;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), -[PFZipCentralDirectoryFileHeader description](&v3, sel_description), self->_filename);
}

@end
