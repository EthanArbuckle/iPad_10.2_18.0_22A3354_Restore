@implementation STKDeviceInfo

+ (BOOL)hasANE
{
  if (qword_10009D8B0[0] != -1)
    dispatch_once(qword_10009D8B0, &stru_10008A068);
  return byte_10009D8A8;
}

@end
