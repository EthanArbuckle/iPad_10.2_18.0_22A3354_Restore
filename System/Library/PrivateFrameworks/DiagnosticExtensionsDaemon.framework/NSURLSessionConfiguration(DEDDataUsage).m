@implementation NSURLSessionConfiguration(DEDDataUsage)

- (void)setUpDataUsageWithConfiguration:()DEDDataUsage
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "finishingMove");
  if (v7 == 1)
  {
    v8 = CFSTR("com.apple.appleseed.FeedbackAssistant");
    goto LABEL_6;
  }
  if (v7 != 2)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSURLSessionConfiguration(DEDDataUsage) setUpDataUsageWithConfiguration:].cold.1(v4, v9);

LABEL_10:
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!+[DEDUtils isInternalInstall](DEDUtils, "isInternalInstall"))
    goto LABEL_10;
  v8 = CFSTR("com.apple.TapToRadar");
LABEL_6:

  v6 = (void *)v8;
LABEL_11:
  objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v6);
LABEL_12:
  +[DEDUtils sharedLog](DEDUtils, "sharedLog");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_INFO, "Bundle identifier responsible data usage: [%@]", (uint8_t *)&v11, 0xCu);
  }

}

- (void)setUpDataUsageWithConfiguration:()DEDDataUsage .cold.1(void *a1, NSObject *a2)
{
  unint64_t v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a1, "finishingMove");
  if (v3 > 4)
    v4 = "Unknown";
  else
    v4 = off_24D1E4FB8[v3];
  v5 = 136446210;
  v6 = v4;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "Cannot configure data attribution for [%{public}s]", (uint8_t *)&v5, 0xCu);
}

@end
