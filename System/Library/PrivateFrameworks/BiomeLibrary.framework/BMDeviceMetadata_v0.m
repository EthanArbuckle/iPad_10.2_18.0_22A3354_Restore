@implementation BMDeviceMetadata_v0

- (int)platform
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMDeviceMetadata_v0;
  v2 = -[BMDeviceMetadata platform](&v4, sel_platform);
  if (v2 > 8)
    return 0;
  else
    return dword_1AEFE37D8[v2];
}

@end
