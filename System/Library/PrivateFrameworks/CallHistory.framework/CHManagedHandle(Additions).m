@implementation CHManagedHandle(Additions)

- (void)copyWithContext:()Additions .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = CFSTR("Handle");
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1B3FA4000, a2, OS_LOG_TYPE_ERROR, "Could not find CHManagedHandle entity with name %{public}@ in context %{public}@. Falling back to convenience initializer.", (uint8_t *)&v2, 0x16u);
}

@end
