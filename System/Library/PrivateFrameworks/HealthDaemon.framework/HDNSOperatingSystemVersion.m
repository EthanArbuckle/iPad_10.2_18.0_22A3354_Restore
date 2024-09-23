@implementation HDNSOperatingSystemVersion

+ (HDNSOperatingSystemVersion)unknownVersion
{
  HDNSOperatingSystemVersion *v0;
  HDNSOperatingSystemVersion *v1;
  __int128 v3;
  uint64_t v4;

  objc_opt_self();
  v0 = objc_alloc_init(HDNSOperatingSystemVersion);
  v1 = v0;
  if (v0)
  {
    v3 = HDDataProvenanceOperatingSystemVersionUnknown;
    v4 = 0;
    objc_copyStruct(&v0->_versionStruct, &v3, 24, 1, 0);
  }
  return v1;
}

+ (HDNSOperatingSystemVersion)versionWithMajor:(uint64_t)a3 minor:(uint64_t)a4 patch:
{
  HDNSOperatingSystemVersion *v7;
  HDNSOperatingSystemVersion *v8;
  _QWORD src[3];

  objc_opt_self();
  v7 = objc_alloc_init(HDNSOperatingSystemVersion);
  v8 = v7;
  if (v7)
  {
    src[0] = a2;
    src[1] = a3;
    src[2] = a4;
    objc_copyStruct(&v7->_versionStruct, src, 24, 1, 0);
  }
  return v8;
}

@end
