@implementation CPBitmapCreateImagesFromData

_QWORD *__CPBitmapCreateImagesFromData_block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) = a4;
  return result;
}

@end
