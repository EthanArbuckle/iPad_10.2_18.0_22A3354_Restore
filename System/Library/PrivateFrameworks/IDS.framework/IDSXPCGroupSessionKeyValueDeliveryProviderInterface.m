@implementation IDSXPCGroupSessionKeyValueDeliveryProviderInterface

+ (id)interface
{
  if (qword_1ECDD6480 != -1)
    dispatch_once(&qword_1ECDD6480, &unk_1E2C5FB50);
  return (id)qword_1ECDD6510;
}

@end
