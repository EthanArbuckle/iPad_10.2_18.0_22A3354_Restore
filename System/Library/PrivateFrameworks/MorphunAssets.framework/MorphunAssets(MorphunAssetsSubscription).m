@implementation MorphunAssets(MorphunAssetsSubscription)

+ (void)initForSiriX:()MorphunAssetsSubscription .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "+[MorphunAssets(MorphunAssetsSubscription) initForSiriX:]";
  OUTLINED_FUNCTION_3_1(&dword_209C90000, a3, (uint64_t)a3, "%s A user Siri locale was nil!", a1);
}

- (void)readSubscriptionView
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[MorphunAssets(MorphunAssetsSubscription) readSubscriptionView]";
  v5 = 2112;
  v6 = CFSTR("subscriptions");
  OUTLINED_FUNCTION_0_0(&dword_209C90000, a1, a3, "%s A nil dictionary was returned from the NSUserDefaults database (key = %@).", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)downloadLocaleIfNeeded:()MorphunAssetsSubscription withCompletion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[MorphunAssets(MorphunAssetsSubscription) downloadLocaleIfNeeded:withCompletion:]";
  OUTLINED_FUNCTION_3_1(&dword_209C90000, a1, a3, "%s Could not get remote version from metadata. Defaulting to download needed.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)removeLanguageIfNeeded:()MorphunAssetsSubscription .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_209C90000, v0, v1, "%s %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)isSubscribedToLocale:()MorphunAssetsSubscription .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "subscriptionProcessKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_209C90000, v3, v5, "%s No subscription array found for process key %@.", (uint8_t *)v6);

}

@end
