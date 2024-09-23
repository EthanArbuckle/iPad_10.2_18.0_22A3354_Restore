@implementation _LSURLOverride(Functions)

+ (void)iTunesStoreURL:()Functions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Using Mac overrides, so skipping iTunes Store override checks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

+ (void)iCloudEmailPrefsURL:()Functions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Using iOS overrides for iCloud email prefs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

+ (void)iCloudEmailPrefsURL:()Functions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Using Mac overrides for iCloud email prefs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

+ (void)iCloudFamilyURL:()Functions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Using Mac overrides, so skipping iCloud Family override checks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

+ (void)iCloudSchoolworkURL:()Functions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a1, a3, "%{public}s: URL override candidate was not an iCloud URL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)iCloudSchoolworkURL:()Functions .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a1, a3, "%{public}s: URL override candidate did not have viable fragment", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)iCloudSchoolworkURL:()Functions .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a1, a3, "%{public}s: URL override candidate did not have 'schoolwork' as first component of fragment", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)iCloudSchoolworkURL:()Functions .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Using Mac overrides, so skipping Schoolwork override checks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

+ (void)booksStoreAuthorizationURL:()Functions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Using Mac overrides, so skipping books store authorization override checks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

@end
