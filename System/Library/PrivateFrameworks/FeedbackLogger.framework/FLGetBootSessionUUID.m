@implementation FLGetBootSessionUUID

void __FLGetBootSessionUUID_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  size_t v4;
  _BYTE v5[37];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  v4 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "UUIDString");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)FLGetBootSessionUUID_bootSessionUUID;
    FLGetBootSessionUUID_bootSessionUUID = v1;

  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
    v0 = (void *)FLGetBootSessionUUID_bootSessionUUID;
    FLGetBootSessionUUID_bootSessionUUID = v3;
  }

}

@end
