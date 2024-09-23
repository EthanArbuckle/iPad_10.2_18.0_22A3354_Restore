@implementation CurrentBootSessionUUID

void ___CurrentBootSessionUUID_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  size_t v4;
  _BYTE v5[37];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  v4 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0))
  {
    v0 = (void *)_CurrentBootSessionUUID_bootSessionUUID;
    _CurrentBootSessionUUID_bootSessionUUID = 0;
  }
  else
  {
    v1 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
    v2 = objc_msgSend(v1, "initWithUUIDString:", v0);
    v3 = (void *)_CurrentBootSessionUUID_bootSessionUUID;
    _CurrentBootSessionUUID_bootSessionUUID = v2;

  }
}

@end
