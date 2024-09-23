@implementation UTGetActiveTypeWithIconForNSStringIdentifier

void ___UTGetActiveTypeWithIconForNSStringIdentifier_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  __CFString *v6;

  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _UTGetActiveTypeForCFStringIdentifier(*(void **)(a1 + 32), v6, (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 28)
      || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _UTTypeSearchConformsToTypesCommon(*(_QWORD *)(a1 + 32), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 24), 32, (uint64_t)typeHasIconFile, 0, (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 24)), (v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) != 0))
    {
      if (*(_DWORD *)(v5 + 28))
        *a3 = 1;
    }
  }

}

@end
