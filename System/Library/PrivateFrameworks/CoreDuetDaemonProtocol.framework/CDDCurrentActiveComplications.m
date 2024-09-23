@implementation CDDCurrentActiveComplications

void ___CDDCurrentActiveComplications_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      ___CDDCurrentActiveComplications_block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ___CDDCurrentActiveComplications_block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1D4D20000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to fetch list of installed applications on gizmo: %@\n", (uint8_t *)&v2, 0xCu);

}

@end
