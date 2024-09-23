@implementation CKEnumerateRangeWithIncrement

uint64_t __CKEnumerateRangeWithIncrement_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;

  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
  {
    v12 = a3 + a2;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v14 = v12 - v8 - v13 < *(_QWORD *)(a1 + 64) && v12 - v8 >= v13;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14)
      v11 = v12 - v8;
  }
  else
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = v8 + a2 - v9 < *(_QWORD *)(a1 + 64) && v8 + a2 >= v9;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10)
      v11 = a2;
  }
  *a4 = v11;
  a4[1] = v8;
  return result;
}

@end
