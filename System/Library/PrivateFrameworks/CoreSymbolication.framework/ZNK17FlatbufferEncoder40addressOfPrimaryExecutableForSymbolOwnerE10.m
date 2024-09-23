@implementation ZNK17FlatbufferEncoder40addressOfPrimaryExecutableForSymbolOwnerE10

const char *___ZNK17FlatbufferEncoder40addressOfPrimaryExecutableForSymbolOwnerE10_CSTypeRef_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *result;
  unint64_t Range;
  const char *Name;
  _BOOL4 v9;
  const char *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  uint64_t v13;

  result = CSRegionGetName(a2, a3);
  if (result)
  {
    Range = CSRegionGetRange(a2, a3);
    Name = CSRegionGetName(a2, a3);
    v9 = Name && strncmp(Name, "__TEXT_EXEC", 0xBuLL) == 0;
    v10 = CSRegionGetName(a2, a3);
    v11 = v10 && strncmp(v10, "__PPLTEXT", 9uLL) == 0;
    result = CSRegionGetName(a2, a3);
    if (result)
    {
      result = (const char *)strncmp(result, "__PPLTRAMP", 0xAuLL);
      v12 = (_DWORD)result == 0;
    }
    else
    {
      v12 = 0;
    }
    if (v9 || v11 || v12)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (*(_BYTE *)(v13 + 48))
      {
        if (Range >= *(_QWORD *)(v13 + 40))
          Range = *(_QWORD *)(v13 + 40);
      }
      *(_QWORD *)(v13 + 40) = Range;
      *(_BYTE *)(v13 + 48) = 1;
    }
  }
  return result;
}

@end
