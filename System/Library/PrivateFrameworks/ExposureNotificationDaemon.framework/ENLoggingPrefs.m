@implementation ENLoggingPrefs

- (BOOL)isSensitiveLoggingAllowed
{
  return self->_sensitiveLoggingEnabled;
}

+ (id)sharedENLoggingPrefs
{
  if (sharedENLoggingPrefs_sOnce != -1)
    dispatch_once(&sharedENLoggingPrefs_sOnce, &__block_literal_global);
  return (id)sharedENLoggingPrefs_sSelf;
}

void __38__ENLoggingPrefs_sharedENLoggingPrefs__block_invoke()
{
  ENLoggingPrefs *v0;
  void *v1;

  v0 = objc_alloc_init(ENLoggingPrefs);
  v1 = (void *)sharedENLoggingPrefs_sSelf;
  sharedENLoggingPrefs_sSelf = (uint64_t)v0;

}

- (ENLoggingPrefs)init
{
  ENLoggingPrefs *v2;
  ENLoggingPrefs *v3;
  ENLoggingPrefs *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENLoggingPrefs;
  v2 = -[ENLoggingPrefs init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ENLoggingPrefs loadLoggingPrefs](v2, "loadLoggingPrefs");
    v4 = v3;
  }

  return v3;
}

- (void)setLoggingEntitledApp:(BOOL)a3
{
  CFPrefs_SetValue();
  -[ENLoggingPrefs loadLoggingPrefs](self, "loadLoggingPrefs");
}

- (void)loadLoggingPrefs
{
  uint64_t Int64;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v9;

  Int64 = CFPrefs_GetInt64();
  v4 = CFPrefs_GetInt64();
  v5 = CFPrefs_GetInt64();
  v6 = CFPrefs_GetInt64();
  self->_sensitiveLoggingEnabled = Int64 != 0;
  if (IsAppleInternalBuild())
    v7 = v5 == 0;
  else
    v7 = 0;
  v9 = v7 || v6 != 0;
  if (!Int64)
    v9 = 0;
  if (!v4)
    v9 = 0;
  self->_rpiLoggingEnabled = v9;
  if (gLogCategory__ENLoggingPrefs <= 50
    && (gLogCategory__ENLoggingPrefs != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (BOOL)isRPILoggingAllowed
{
  return self->_rpiLoggingEnabled;
}

@end
