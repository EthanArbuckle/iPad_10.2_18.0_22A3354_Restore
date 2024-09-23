@implementation _FBDarkBootHelper

- (BOOL)isBootingDark
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  size_t v17;
  int v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v17 = 4;
  v2 = sysctlbyname("kern.darkboot", &v18, &v17, 0, 0);
  if ((_DWORD)v2)
  {
    v3 = v2;
    FBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_FBDarkBootHelper isBootingDark].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
LABEL_4:
    v11 = 0;
    goto LABEL_5;
  }
  v13 = v18;
  FBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 1024;
      v22 = v18;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_INFO, "read darkboot flag = %{public}@ (%i)", buf, 0x12u);

    }
    goto LABEL_4;
  }
  v11 = 1;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v15;
    v21 = 1024;
    v22 = v18;
    _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "read darkboot flag = %{public}@ (%i)", buf, 0x12u);

  }
LABEL_5:

  return v11;
}

- (void)setNextBootDark
{
  -[_FBDarkBootHelper _setDarkBootEnabled:](self, "_setDarkBootEnabled:", 1);
}

- (void)clearBootedDark
{
  -[_FBDarkBootHelper _setDarkBootEnabled:](self, "_setDarkBootEnabled:", 0);
}

- (void)_setDarkBootEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = 2;
  else
    v4 = 0;
  v15 = v4;
  v5 = sysctlbyname("kern.darkboot", 0, 0, &v15, 4uLL);
  FBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_FBDarkBootHelper _setDarkBootEnabled:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "NO";
    if (v3)
      v14 = "YES";
    *(_DWORD *)buf = 136446210;
    v17 = v14;
    _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, "Set darkBoot = %{public}s", buf, 0xCu);
  }

}

- (void)isBootingDark
{
  OUTLINED_FUNCTION_0_0(&dword_1A359A000, a2, a3, "failed to read darkboot state ->  %{darwin.errno}i", a5, a6, a7, a8, 0);
}

- (void)_setDarkBootEnabled:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A359A000, a2, a3, "Failed to set darkboot state ->  %{darwin.errno}i : do you have the entitlement (com.apple.private.kernel.darkboot)?", a5, a6, a7, a8, 0);
}

@end
