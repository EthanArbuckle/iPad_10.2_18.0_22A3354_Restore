@implementation PFBatchFaultingArray

uint64_t __68___PFBatchFaultingArray_indexOfObjectAtIndexes_options_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t __71___PFBatchFaultingArray_indexesOfObjectsAtIndexes_options_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  void *v6;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    return objc_msgSend(v6, "addIndex:", a3);
  }
  return result;
}

@end
