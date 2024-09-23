@implementation EXExtensionRequest(NSExtensionActiveWebPageAlternative)

- (void)applyActiveWebPageAlternativeIfNeededForExtension:()NSExtensionActiveWebPageAlternative .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "inputItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_190C25000, a3, OS_LOG_TYPE_DEBUG, "Applying active web page alternative to items: %@ matching rule %@", (uint8_t *)&v6, 0x16u);

}

- (void)applyActiveWebPageAlternativeIfNeededForExtension:()NSExtensionActiveWebPageAlternative .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_190C25000, log, OS_LOG_TYPE_DEBUG, "Input items match active web page alternative.", v1, 2u);
}

@end
