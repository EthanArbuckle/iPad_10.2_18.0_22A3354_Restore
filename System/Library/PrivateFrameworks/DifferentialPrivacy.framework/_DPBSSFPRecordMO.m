@implementation _DPBSSFPRecordMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("BSSFPRecord"));
}

@end
