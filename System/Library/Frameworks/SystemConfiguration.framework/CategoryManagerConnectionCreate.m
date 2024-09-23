@implementation CategoryManagerConnectionCreate

uint64_t __CategoryManagerConnectionCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  CategoryManagerHandleResponse(a2, 1, (int *)&v4);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), v4);
  return result;
}

@end
