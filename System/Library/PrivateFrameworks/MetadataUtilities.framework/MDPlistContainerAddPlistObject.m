@implementation MDPlistContainerAddPlistObject

uint64_t ___MDPlistContainerAddPlistObject_block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  return _MDPlistContainerAddPlistObject(v2, &v4);
}

uint64_t ___MDPlistContainerAddPlistObject_block_invoke_2(uint64_t a1, char *a2, uint64_t a3, __int128 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _MDPlistContainerAddCString(*(_QWORD *)(a1 + 32), a2, a3, 0, a5, a6, a7, a8);
  v10 = *(_QWORD *)(a1 + 32);
  v12 = *a4;
  v13 = *((_QWORD *)a4 + 2);
  return _MDPlistContainerAddPlistObject(v10, &v12);
}

@end
