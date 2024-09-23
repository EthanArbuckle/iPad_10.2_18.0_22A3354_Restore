@implementation ZNK2CI20SerialObjectPtrArray5printEP7

int *___ZNK2CI20SerialObjectPtrArray5printEP7__sFILE_block_invoke(uint64_t a1, uint64_t a2)
{
  int *v2;
  _QWORD v4[5];

  v2 = *(int **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK2CI20SerialObjectPtrArray5printEP7__sFILE_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_213;
  v4[4] = a2;
  return CI::SerialObjectPtrArray::for_each(v2, (uint64_t)v4);
}

@end
