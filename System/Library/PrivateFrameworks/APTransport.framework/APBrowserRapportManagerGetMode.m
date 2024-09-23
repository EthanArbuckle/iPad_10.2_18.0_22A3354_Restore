@implementation APBrowserRapportManagerGetMode

uint64_t __APBrowserRapportManagerGetMode_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 40);
  v2 = *(unsigned __int8 *)(v1 + 51);
  if (*(_BYTE *)(v1 + 51))
    v2 = -72284;
  else
    **(_WORD **)(result + 48) = *(_WORD *)(v1 + 48);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

@end
