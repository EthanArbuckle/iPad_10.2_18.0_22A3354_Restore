@implementation CKUnavailabilityIndicatorChatItem(Layout)

- (void)layoutItemSpacingWithEnvironment:()Layout datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "CKUnavailabilityIndicatorChatItem should not follow %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)layoutItemSpacingWithEnvironment:()Layout datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Unavailability indicator should not follow another unavailability indicator", a5, a6, a7, a8, 0);
}

- (void)layoutItemSpacingWithEnvironment:()Layout datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Unavailability indicator should not follow notify anyway", a5, a6, a7, a8, 0);
}

@end
