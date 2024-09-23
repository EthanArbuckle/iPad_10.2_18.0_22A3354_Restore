@implementation MCCheckSystemGroupContainerFileReadability

uint64_t __MCCheckSystemGroupContainerFileReadability_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Directory enumerator error for %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

@end
