@implementation ZN25HALS

_BYTE *___ZN25HALS_MetaDevice_HostedDSP15SetPropertyDataEjRK26AudioObjectPropertyAddressjPKvjS4_P11HALS_Client_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  _BYTE *result;
  uint64_t *v8;
  uint64_t *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int i;
  uint64_t SubDeviceByIndex;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  _BYTE v20[24];
  _BYTE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(uint64_t **)(a1 + 48);
  v16 = *v2;
  v17 = *((_DWORD *)v2 + 2);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_DWORD *)(a1 + 80);
  v6 = *(_DWORD *)(a1 + 84);
  result = operator new(0x40uLL);
  *(_QWORD *)result = &off_1E696B510;
  *((_QWORD *)result + 1) = &v18;
  *((_QWORD *)result + 2) = v16;
  *((_DWORD *)result + 6) = v17;
  *((_DWORD *)result + 7) = v5;
  *((_QWORD *)result + 4) = v4;
  *((_DWORD *)result + 10) = v6;
  *((_OWORD *)result + 3) = *(_OWORD *)(a1 + 64);
  v21 = result;
  v8 = *(uint64_t **)(*(_QWORD *)v3 + 1344);
  v9 = *(uint64_t **)(*(_QWORD *)v3 + 1352);
  if (v8 == v9)
    goto LABEL_12;
  v10 = 0;
  do
  {
    v12 = *v8;
    v11 = v8[1];
    v8 += 3;
    v10 += (unint64_t)(v11 - v12) >> 3;
  }
  while (v8 != v9);
  if (!v10)
    goto LABEL_12;
  for (i = 0; i != v10; ++i)
  {
    SubDeviceByIndex = HALS_MetaDeviceDescription::GetSubDeviceByIndex(*(uint64_t ***)(*(_QWORD *)v3 + 1344), *(HALS_MetaDeviceDescription **)(*(_QWORD *)v3 + 1352), i);
    if (SubDeviceByIndex)
    {
      v19 = SubDeviceByIndex;
      if (!v21)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(_BYTE *, uint64_t *))(*(_QWORD *)v21 + 48))(v21, &v19);
    }
  }
  result = v21;
  if (v21 == v20)
  {
    v15 = 4;
    result = v20;
    goto LABEL_13;
  }
  if (v21)
  {
LABEL_12:
    v15 = 5;
LABEL_13:
    result = (_BYTE *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v15))();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v18;
  return result;
}

@end
