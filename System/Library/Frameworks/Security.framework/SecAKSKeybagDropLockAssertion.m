@implementation SecAKSKeybagDropLockAssertion

uint64_t __SecAKSKeybagDropLockAssertion_block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = count;
  if (count)
  {
    --count;
    if (v1 == 1)
    {
      v2 = result;
      v3 = secLogObjForScope("lockassertions");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "Dropping lock assertion", v4, 2u);
      }
      result = aks_assert_drop(*(_DWORD *)(v2 + 40), 0);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

@end
