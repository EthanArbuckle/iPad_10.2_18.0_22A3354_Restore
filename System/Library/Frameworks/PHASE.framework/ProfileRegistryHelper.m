@implementation ProfileRegistryHelper

+ (id)getDirectoryName
{
  return CFSTR("Profiles");
}

+ (id)getFileNames
{
  return (id)objc_msgSend(a1, "getFileNames:", 1);
}

+ (id)getFileNames:(int64_t)a3
{
  unsigned __int16 IsInternalBuild;
  void *v5;
  void *v6;
  BOOL v7;

  IsInternalBuild = Phase::Controller::DeviceInfo::IsInternalBuild((Phase::Controller::DeviceInfo *)a1);
  v5 = &unk_24D595290;
  if (a3 == 1)
    v5 = &unk_24D595278;
  v6 = &unk_24D5952C0;
  if (a3 == 1)
    v6 = &unk_24D5952A8;
  if ((_BYTE)IsInternalBuild)
    v7 = IsInternalBuild >= 0x100u;
  else
    v7 = 0;
  if (v7)
    return v5;
  else
    return v6;
}

+ (id)getFileExtension
{
  return CFSTR("json");
}

@end
