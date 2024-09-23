@implementation ZNK25HALS

_QWORD *___ZNK25HALS_MetaDevice_HostedDSP11HasPropertyEjRK26AudioObjectPropertyAddressP11HALS_Client_block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v3 = a1[5];
  v2 = (uint64_t *)a1[6];
  v8 = *v2;
  v9 = *((_DWORD *)v2 + 2);
  v4 = a1[7];
  v5 = operator new(0x28uLL);
  *v5 = &off_1E696B300;
  v5[1] = &v10;
  v5[2] = v8;
  *((_DWORD *)v5 + 6) = v9;
  v5[4] = v4;
  v12 = v5;
  HALS_MetaDevice_HostedDSP::VisitSubdevices(v3, (uint64_t)v11);
  result = v12;
  if (v12 == v11)
  {
    v7 = 4;
    result = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v7 = 5;
LABEL_5:
    result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v10;
  return result;
}

_QWORD *___ZNK25HALS_MetaDevice_HostedDSP18IsPropertySettableEjRK26AudioObjectPropertyAddressP11HALS_Client_block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v3 = a1[5];
  v2 = (uint64_t *)a1[6];
  v8 = *v2;
  v9 = *((_DWORD *)v2 + 2);
  v4 = a1[7];
  v5 = operator new(0x28uLL);
  *v5 = &off_1E696B390;
  v5[1] = &v10;
  v5[2] = v8;
  *((_DWORD *)v5 + 6) = v9;
  v5[4] = v4;
  v12 = v5;
  HALS_MetaDevice_HostedDSP::VisitSubdevices(v3, (uint64_t)v11);
  result = v12;
  if (v12 == v11)
  {
    v7 = 4;
    result = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v7 = 5;
LABEL_5:
    result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v10;
  return result;
}

_QWORD *___ZNK25HALS_MetaDevice_HostedDSP19GetPropertyDataSizeEjRK26AudioObjectPropertyAddressjPKvP11HALS_Client_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(uint64_t **)(a1 + 48);
  v8 = *v2;
  v9 = *((_DWORD *)v2 + 2);
  v10 = 0;
  v4 = *(_DWORD *)(a1 + 72);
  v5 = operator new(0x30uLL);
  *v5 = &off_1E696B410;
  v5[1] = &v10;
  v5[2] = v8;
  *((_DWORD *)v5 + 6) = v9;
  *((_DWORD *)v5 + 7) = v4;
  *((_OWORD *)v5 + 2) = *(_OWORD *)(a1 + 56);
  v12 = v5;
  HALS_MetaDevice_HostedDSP::VisitSubdevices(v3, (uint64_t)v11);
  result = v12;
  if (v12 == v11)
  {
    v7 = 4;
    result = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v7 = 5;
LABEL_5:
    result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
  return result;
}

_QWORD *___ZNK25HALS_MetaDevice_HostedDSP15GetPropertyDataEjRK26AudioObjectPropertyAddressjRjPvjPKvP11HALS_Client_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  char *v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  _BYTE v14[24];
  _BYTE *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t **)(a1 + 40);
  v11 = *v2;
  v12 = *((_DWORD *)v2 + 2);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a1 + 56;
  v6 = *(_DWORD *)(a1 + 80);
  v7 = *(_DWORD *)(a1 + 84);
  v8 = (char *)operator new(0x48uLL);
  *(_QWORD *)v8 = &off_1E696B490;
  *((_QWORD *)v8 + 1) = &v13;
  *((_QWORD *)v8 + 2) = v11;
  *((_DWORD *)v8 + 6) = v12;
  *((_DWORD *)v8 + 7) = v6;
  *((_QWORD *)v8 + 4) = v4;
  *((_QWORD *)v8 + 5) = v5;
  *((_DWORD *)v8 + 12) = v7;
  *(_OWORD *)(v8 + 56) = *(_OWORD *)(a1 + 64);
  v15 = v8;
  HALS_MetaDevice_HostedDSP::VisitSubdevices(v3, (uint64_t)v14);
  result = v15;
  if (v15 == v14)
  {
    v10 = 4;
    result = v14;
  }
  else
  {
    if (!v15)
      return result;
    v10 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v10))();
}

@end
