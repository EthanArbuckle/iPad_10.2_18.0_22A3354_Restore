@implementation PASSqliteDatabase

uint64_t __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a1 + 40);
  return *MEMORY[0x1E0D81788];
}

@end
