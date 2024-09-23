@implementation CKUserDefaults

+ (void)performAtomicDefaultsOperation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96A30);
  objc_msgSend_CKUserDefaults(a1, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96A30);
}

+ (id)CKUserDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A5F32C4;
  block[3] = &unk_1E1F5F680;
  block[4] = a1;
  if (qword_1ECD970E0 != -1)
    dispatch_once(&qword_1ECD970E0, block);
  return (id)qword_1ECD970D8;
}

+ (id)suiteName
{
  return CFSTR("com.apple.CloudKit");
}

@end
