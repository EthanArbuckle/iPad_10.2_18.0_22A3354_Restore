@implementation DEDActivity

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_2);
  return (id)sharedInstance_shared;
}

void __29__DEDActivity_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = v0;

}

- (id)newCleanupActivity
{
  os_activity_t v3;

  v3 = _os_activity_create(&dword_21469E000, "Old Sessions Cleanup", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  -[DEDActivity setCleanup:](self, "setCleanup:", v3);

  -[DEDActivity cleanup](self, "cleanup");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)currentCleanupActivity
{
  void *v3;
  id v4;
  void *v5;

  -[DEDActivity cleanup](self, "cleanup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DEDActivity cleanup](self, "cleanup");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[DEDActivity newCleanupActivity](self, "newCleanupActivity");
  }
  v5 = v4;

  return v5;
}

- (OS_os_activity)cleanup
{
  return (OS_os_activity *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCleanup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanup, 0);
}

@end
