@implementation PFZipEndOfCentralDirectoryRecord

- (PFZipEndOfCentralDirectoryRecord)init
{
  PFZipEndOfCentralDirectoryRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFZipEndOfCentralDirectoryRecord;
  result = -[PFZipEndOfCentralDirectoryRecord init](&v3, sel_init);
  if (result)
  {
    result->_comment = 0;
    *(_QWORD *)&result->_numberOfDisk = 0;
    *(_QWORD *)&result->_byteSizeOfCentralDirectory = 0;
    result->_commentLength = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_comment = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFZipEndOfCentralDirectoryRecord;
  -[PFZipEndOfCentralDirectoryRecord dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFZipEndOfCentralDirectoryRecord;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %d:%d:%d:%d:%d:%d"), -[PFZipEndOfCentralDirectoryRecord description](&v3, sel_description), self->_diskWhereCentralDirectoryStarts, self->_numberOfDisk, self->_numberOfCentralDirectoryRecordsOnThisDisk, self->_totalNumberOfCentralDirectoryRecords, self->_byteSizeOfCentralDirectory, self->_centralDirectoryOffset);
}

@end
