@implementation CFPrefsMessageSenderIsSandboxed

uint64_t ___CFPrefsMessageSenderIsSandboxed_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  BOOL v5;

  v2 = result;
  v3 = *(unsigned __int8 *)(a2 + 52);
  if (v3 == 255)
  {
    result = _CFPrefsSandboxCheckForMessage(*(void **)(result + 32));
    v5 = (_DWORD)result != 0;
    *(_BYTE *)(a2 + 52) = (_DWORD)result != 0;
  }
  else
  {
    v5 = v3 == 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = v5;
  return result;
}

uint64_t ___CFPrefsMessageSenderIsSandboxed_block_invoke_0(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  BOOL v5;

  v2 = result;
  v3 = *(unsigned __int8 *)(a2 + 52);
  if (v3 == 255)
  {
    result = _CFPrefsSandboxCheckForMessage_0(*(void **)(result + 32));
    v5 = (_DWORD)result != 0;
    *(_BYTE *)(a2 + 52) = (_DWORD)result != 0;
  }
  else
  {
    v5 = v3 == 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = v5;
  return result;
}

@end
