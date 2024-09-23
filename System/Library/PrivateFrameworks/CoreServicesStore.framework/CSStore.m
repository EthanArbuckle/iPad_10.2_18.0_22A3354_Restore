@implementation CSStore

void __29___CSStore_setAccessContext___block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  char v2;
  char v3;
  void *v4;
  void *v5;

  v0 = CFPreferencesCopyValue(CFSTR("CSStoreAssertOnIncorrectQueue"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v1 = (void *)v0;
  if (v0)
  {
    v4 = (void *)v0;
    v2 = objc_opt_respondsToSelector();
    v1 = v4;
    if ((v2 & 1) != 0)
    {
      v3 = objc_msgSend(v4, "BOOLValue");
      v1 = v4;
LABEL_7:
      performConstantAssertions = v3;
      goto LABEL_8;
    }
  }
  if (CSStore2::IsAppleInternal(void)::once != -1)
  {
    v5 = v1;
    dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_99);
    v1 = v5;
  }
  v3 = 1;
  if (CSStore2::IsAppleInternal(void)::result)
    goto LABEL_7;
LABEL_8:
  performMutatingAssertions = v3;

}

@end
