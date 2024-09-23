@implementation KmlVersionOverride

+ (id)sharedVersionsOverrides
{
  if (sharedVersionsOverrides_onceToken != -1)
    dispatch_once(&sharedVersionsOverrides_onceToken, &__block_literal_global_0);
  return (id)sharedVersionsOverrides__versionOverride;
}

void __45__KmlVersionOverride_sharedVersionsOverrides__block_invoke()
{
  KmlVersionOverride *v0;
  void *v1;

  v0 = objc_alloc_init(KmlVersionOverride);
  v1 = (void *)sharedVersionsOverrides__versionOverride;
  sharedVersionsOverrides__versionOverride = (uint64_t)v0;

}

- (KmlVersionOverride)init
{
  KmlVersionOverride *v2;
  KmlVersionOverride *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)KmlVersionOverride;
  v2 = -[KmlVersionOverride init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_kmlOverrideVersion = 768;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
    objc_msgSend(v4, "stringForKey:", CFSTR("KmlVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SharingInChainTest"));
    if (v6)
      v3->_kmlOverrideVersion = 256;
    v3->_keyRoleToShare = -1;
    objc_msgSend(v4, "objectForKey:", CFSTR("KeyRole"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v3->_keyRoleToShare = objc_msgSend(v4, "integerForKey:", CFSTR("KeyRole"));
    }
    else if (!v6)
    {
LABEL_8:

      return v3;
    }
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlVersionOverride init]", 63, CFSTR("UserDefault: %@"), v7, v8, v9, v10, (uint64_t)v4);
    goto LABEL_8;
  }
  return v3;
}

- (unsigned)kmlOverrideVersion
{
  return self->_kmlOverrideVersion;
}

- (void)setKmlOverrideVersion:(unsigned __int16)a3
{
  self->_kmlOverrideVersion = a3;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void)setKeyRoleToShare:(unsigned __int16)a3
{
  self->_keyRoleToShare = a3;
}

@end
