@implementation GEOMultiTileKeyEnumerator

uint64_t __67___GEOMultiTileKeyEnumerator_continueEnumeratingTileKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

@end
