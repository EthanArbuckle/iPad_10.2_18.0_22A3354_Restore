@implementation ABChangeHistoryClearChangesToSequenceNumber

void __ABChangeHistoryClearChangesToSequenceNumber_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1 + 40;
  if (!_performQueryToClearSequenceNumber(*(_QWORD *)(a1 + 32), a2, *(_DWORD *)(a1 + 40))
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __ABChangeHistoryClearChangesToSequenceNumber_block_invoke_cold_1(v3, a2, v4, v5, v6, v7, v8, v9);
  }
}

void __ABChangeHistoryClearChangesToSequenceNumber_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19BC4B000, MEMORY[0x1E0C81028], a3, "Failed to clear changes to sequence number %d with query %@", a5, a6, a7, a8, 2u);
}

@end
