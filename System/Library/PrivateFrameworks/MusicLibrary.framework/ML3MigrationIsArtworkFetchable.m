@implementation ML3MigrationIsArtworkFetchable

uint64_t ___ML3MigrationIsArtworkFetchable_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = 1;
  return result;
}

uint64_t ___ML3MigrationIsArtworkFetchable_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = 1;
  return result;
}

@end
