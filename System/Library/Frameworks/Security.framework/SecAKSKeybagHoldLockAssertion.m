@implementation SecAKSKeybagHoldLockAssertion

uint64_t __SecAKSKeybagHoldLockAssertion_block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result;
  v6 = *MEMORY[0x1E0C80C00];
  if (!count)
  {
    v2 = secLogObjForScope("lockassertions");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 40);
      v4 = 134217984;
      v5 = v3;
      _os_log_impl(&dword_18A900000, v2, OS_LOG_TYPE_DEFAULT, "Requesting lock assertion for %lld seconds", (uint8_t *)&v4, 0xCu);
    }
    result = aks_assert_hold(*(_DWORD *)(v1 + 48), 0, *(_QWORD *)(v1 + 40));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24))
    ++count;
  return result;
}

@end
