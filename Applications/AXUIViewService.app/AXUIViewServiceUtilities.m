@implementation AXUIViewServiceUtilities

+ (BOOL)axTCCAllowsPhotoLibraryAccess
{
  if (qword_10002E778 != -1)
    dispatch_once(&qword_10002E778, &stru_100024BC8);
  return byte_10002E770;
}

@end
