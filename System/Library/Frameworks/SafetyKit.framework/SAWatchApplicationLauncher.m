@implementation SAWatchApplicationLauncher

- (SAWatchApplicationLauncher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAWatchApplicationLauncher;
  return -[SAWatchApplicationLauncher init](&v3, sel_init);
}

- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a5;
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SAWatchApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:].cold.1((uint64_t)v6, v8);

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)openApplicationInBackgroundWithBundleId:(uint64_t)a1 withReason:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SAWatchApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_23457A000, a2, OS_LOG_TYPE_ERROR, "%s - attempted to use watch launcher on non watch platform, bundleId: %@", (uint8_t *)&v2, 0x16u);
}

@end
