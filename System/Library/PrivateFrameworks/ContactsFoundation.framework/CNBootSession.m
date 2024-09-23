@implementation CNBootSession

+ (NSString)currentBootSessionUUID
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CNBootSession_currentBootSessionUUID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentBootSessionUUID_cn_once_token_0 != -1)
    dispatch_once(&currentBootSessionUUID_cn_once_token_0, block);
  return (NSString *)(id)currentBootSessionUUID_cn_once_object_0;
}

void __39__CNBootSession_currentBootSessionUUID__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "readCurrentBootSessionUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)currentBootSessionUUID_cn_once_object_0;
  currentBootSessionUUID_cn_once_object_0 = v1;

}

+ (id)readCurrentBootSessionUUID
{
  size_t v3;
  _BYTE v4[37];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v3 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v4, &v3, 0, 0))
    return &stru_1E29BCC70;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
}

@end
