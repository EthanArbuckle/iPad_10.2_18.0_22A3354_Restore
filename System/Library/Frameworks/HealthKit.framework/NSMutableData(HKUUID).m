@implementation NSMutableData(HKUUID)

- (uint64_t)hk_appendBytesWithUUID:()HKUUID
{
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)result;
    v4[0] = 0;
    v4[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v4);
    return objc_msgSend(v3, "appendBytes:length:", v4, 16);
  }
  return result;
}

- (uint64_t)hk_appendUUIDBytes:()HKUUID
{
  return objc_msgSend(a1, "appendBytes:length:", a3, 16);
}

@end
