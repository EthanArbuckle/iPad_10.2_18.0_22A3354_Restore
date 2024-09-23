@implementation APSystemInternal

+ (BOOL)isAppleInternalInstall
{
  if (qword_1ED2BCB70 != -1)
    dispatch_once(&qword_1ED2BCB70, &unk_1E8C480F0);
  return byte_1ED2BCB80;
}

@end
