@implementation NSRunLoop

uint64_t __41__NSRunLoop_NSRunLoop___portInvalidated___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 40), "addObject:");
    return objc_msgSend(*(id *)(v5 + 48), "addIndexesInRange:", a4, 2);
  }
  return result;
}

uint64_t __46__NSRunLoop_NSRunLoop___containsPort_forMode___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v6;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v6 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:");
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

uint64_t __44__NSRunLoop_NSRunLoop___removePort_forMode___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v7 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:");
    if ((_DWORD)result)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_BYTE *)(v8 + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 48) + 8) + 24) = a4;
      }
      else
      {
        *(_BYTE *)(v8 + 24) = 0;
        *a5 = 1;
      }
    }
  }
  return result;
}

@end
