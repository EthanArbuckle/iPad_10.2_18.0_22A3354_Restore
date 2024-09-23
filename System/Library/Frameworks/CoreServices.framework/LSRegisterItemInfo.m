@implementation LSRegisterItemInfo

uint64_t ___LSRegisterItemInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = _LSGetOSStatusFromNSError(a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void ___LSRegisterItemInfo_block_invoke_2(_QWORD *a1, char a2, int a3, void *a4, char a5, void *a6)
{
  id v11;
  void *v12;
  _DWORD *v13;
  _QWORD *v14;
  _BYTE *v15;
  const __CFArray *theArray;

  theArray = a4;
  v11 = a6;
  v12 = v11;
  if ((a2 & 1) != 0)
  {
    v13 = (_DWORD *)a1[5];
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    if (v13)
      *v13 = a3;
    v14 = (_QWORD *)a1[6];
    if (v14)
    {
      if (theArray)
        *(_QWORD *)a1[6] = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theArray);
      else
        *v14 = 0;
    }
    v15 = (_BYTE *)a1[7];
    if (v15)
      *v15 = a5;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = _LSGetOSStatusFromNSError(v11);
  }

}

@end
