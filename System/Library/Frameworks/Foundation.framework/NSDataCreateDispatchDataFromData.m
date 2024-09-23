@implementation NSDataCreateDispatchDataFromData

void ___NSDataCreateDispatchDataFromData_block_invoke(uint64_t a1, void *buffer, int a3, size_t size)
{
  id v7;
  _QWORD *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48) || (v7 = *(id *)(a1 + 32), *(_BYTE *)(a1 + 48)))
  {
    v8 = 0;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___NSDataCreateDispatchDataFromData_block_invoke_2;
    v13[3] = &unk_1E0F4D2D8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v8 = v13;
  }
  v9 = dispatch_data_create(buffer, size, 0, v8);
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(NSObject **)(v11 + 40);
  if (v12)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = dispatch_data_create_concat(*(dispatch_data_t *)(v11 + 40), v9);
    dispatch_release(v12);
    dispatch_release(v10);
  }
  else
  {
    *(_QWORD *)(v11 + 40) = v9;
  }
}

void ___NSDataCreateDispatchDataFromData_block_invoke_2(uint64_t a1)
{

}

@end
