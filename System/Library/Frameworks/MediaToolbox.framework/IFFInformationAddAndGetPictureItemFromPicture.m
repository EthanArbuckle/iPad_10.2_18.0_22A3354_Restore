@implementation IFFInformationAddAndGetPictureItemFromPicture

BOOL __IFFInformationAddAndGetPictureItemFromPicture_block_invoke(uint64_t a1, uint64_t a2)
{
  size_t v2;

  if (*(_DWORD *)(a2 + 40) == *(_DWORD *)(a1 + 48) && (v2 = *(_QWORD *)(a2 + 56), v2 == *(_QWORD *)(a1 + 32)))
    return memcmp(*(const void **)(a2 + 48), *(const void **)(a1 + 40), v2) == 0;
  else
    return 0;
}

@end
