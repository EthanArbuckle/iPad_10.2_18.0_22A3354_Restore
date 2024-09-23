@implementation LSEnumerateAllClaimedTypesOrSchemesForBundleID

void ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = _LSClaimGet();
  if (v2)
  {
    v3 = v2;
    if ((*(_DWORD *)(a1 + 48) & *(unsigned __int16 *)(v2 + 14)) != 0)
    {
      if (*(_DWORD *)(v2 + 68))
      {
        v4 = MEMORY[0x1E0C809B0];
        if (!*(_BYTE *)(a1 + 52))
          goto LABEL_7;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_2;
        v10[3] = &unk_1E10423B0;
        v5 = *(_QWORD *)(a1 + 40);
        v11 = *(id *)(a1 + 32);
        v12 = v3;
        _LSEnumerateClaimedTypes(v5, v3, v10);

        if (!*(_BYTE *)(a1 + 52))
        {
LABEL_7:
          v7[0] = v4;
          v7[1] = 3221225472;
          v7[2] = ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_3;
          v7[3] = &unk_1E10423B0;
          v6 = *(_QWORD *)(a1 + 40);
          v8 = *(id *)(a1 + 32);
          v9 = v3;
          _LSEnumerateClaimedSchemes(v6, v3, v7);

        }
      }
    }
  }
}

uint64_t ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

uint64_t ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

@end
