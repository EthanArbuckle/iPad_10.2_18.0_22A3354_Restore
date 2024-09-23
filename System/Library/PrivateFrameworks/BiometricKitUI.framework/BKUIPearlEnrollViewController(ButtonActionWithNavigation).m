@implementation BKUIPearlEnrollViewController(ButtonActionWithNavigation)

- (void)updatePeriocularEnrollmentSettings:()ButtonActionWithNavigation .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1DB281000, a3, OS_LOG_TYPE_ERROR, "Update Periocular Enrollment Settings Error:%@ Context:%@", (uint8_t *)&v6, 0x16u);

}

@end
