@implementation CAPackage(ControlCenterUIKit)

+ (id)ccuiPackageFromDescription:()ControlCenterUIKit
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CD27F8];
  objc_msgSend(v3, "packageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD3078];
  v11 = 0;
  objc_msgSend(v4, "packageWithContentsOfURL:type:options:error:", v5, v6, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v8)
  {
    v9 = (void *)CCUILogUserInterface;
    if (os_log_type_enabled((os_log_t)CCUILogUserInterface, OS_LOG_TYPE_ERROR))
      +[CAPackage(ControlCenterUIKit) ccuiPackageFromDescription:].cold.1(v9, v3, (uint64_t)v8);
  }

  return v7;
}

+ (void)ccuiPackageFromDescription:()ControlCenterUIKit .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "packageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl(&dword_1D02ED000, v5, OS_LOG_TYPE_ERROR, "Cannot load CAPackage from %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
