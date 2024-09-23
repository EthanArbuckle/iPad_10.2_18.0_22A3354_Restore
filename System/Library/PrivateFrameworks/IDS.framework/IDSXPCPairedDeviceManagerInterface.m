@implementation IDSXPCPairedDeviceManagerInterface

+ (id)interface
{
  if (qword_1ECDD6488 != -1)
    dispatch_once(&qword_1ECDD6488, &unk_1E2C5FC10);
  return (id)qword_1ECDD6518;
}

@end
