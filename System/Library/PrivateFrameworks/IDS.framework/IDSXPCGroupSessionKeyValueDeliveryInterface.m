@implementation IDSXPCGroupSessionKeyValueDeliveryInterface

+ (id)interface
{
  if (qword_1ECDD64C0 != -1)
    dispatch_once(&qword_1ECDD64C0, &unk_1E2C5FEB0);
  return (id)qword_1ECDD6550;
}

@end
