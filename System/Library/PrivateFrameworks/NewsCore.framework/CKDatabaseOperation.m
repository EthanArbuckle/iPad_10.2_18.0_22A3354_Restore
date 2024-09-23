@implementation CKDatabaseOperation

- (void)fc_canBypassEncryptionRequirement
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_getAssociatedObject(result, (const void *)FCShouldBypassEncryptionKey);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLValue");

    return (void *)v2;
  }
  return result;
}

- (void)setFc_canBypassEncryptionRequirement:(void *)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, (const void *)FCShouldBypassEncryptionKey, v3, (void *)0x301);

  }
}

@end
