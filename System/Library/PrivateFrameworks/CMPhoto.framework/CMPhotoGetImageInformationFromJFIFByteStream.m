@implementation CMPhotoGetImageInformationFromJFIFByteStream

uint64_t __CMPhotoGetImageInformationFromJFIFByteStream_block_invoke(_QWORD *a1, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 > 3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v10 = *(_QWORD *)(a1[8] + 8);
    *(_QWORD *)(v10 + 24) = a7;
    *(_QWORD *)(v10 + 32) = a8;
    v9 = a1[4];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
    v8 = *(_QWORD *)(a1[6] + 8);
    *(_QWORD *)(v8 + 24) = a7;
    *(_QWORD *)(v8 + 32) = a8;
    v9 = a1[7];
  }
  if (*(_BYTE *)(*(_QWORD *)(v9 + 8) + 24))
    return 4294950191;
  else
    return 0;
}

@end
