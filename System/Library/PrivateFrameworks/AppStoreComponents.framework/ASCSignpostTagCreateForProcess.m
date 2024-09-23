@implementation ASCSignpostTagCreateForProcess

void __ASCSignpostTagCreateForProcess_block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    __ASCSignpostTagCreateForProcess_block_invoke_cold_1(a1);
}

void __ASCSignpostTagCreateForProcess_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = 136446466;
  v3 = "ASCSignpostTag ASCSignpostTagCreateForProcess(uint64_t, pid_t)_block_invoke";
  v4 = 2050;
  v5 = v1;
  _os_log_fault_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** %{public}s: Value %{public}llul exceeds 47 bits, break on _ASCSignpostTag_valueTooLarge to debug", (uint8_t *)&v2, 0x16u);
}

@end
