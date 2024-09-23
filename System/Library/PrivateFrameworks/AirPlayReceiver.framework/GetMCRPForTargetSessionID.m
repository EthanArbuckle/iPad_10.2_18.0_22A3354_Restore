@implementation GetMCRPForTargetSessionID

uint64_t __airplayReqProcessor_GetMCRPForTargetSessionID_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *CString;
  uint64_t result;
  uint64_t v7;
  int v8;

  CString = (const char *)CFObjectGetCString();
  result = CFObjectGetInt64();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_QWORD *)(v7 + 24))
    {
      result = strcmp(CString, "control");
      if (!(_DWORD)result)
      {
        v8 = *(_DWORD *)(a1 + 48);
        if (!v8 || v8 == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(v7 + 24) = a3;
      }
    }
  }
  return result;
}

@end
