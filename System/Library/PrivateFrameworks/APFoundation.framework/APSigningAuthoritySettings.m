@implementation APSigningAuthoritySettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  APSettingsStorageUserDefaults *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = [APSettingsStorageUserDefaults alloc];
  v7 = (void *)objc_msgSend_initWithDefaultValues_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

@end
