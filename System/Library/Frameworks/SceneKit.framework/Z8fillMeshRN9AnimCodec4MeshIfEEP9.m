@implementation Z8fillMeshRN9AnimCodec4MeshIfEEP9

_QWORD *___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2(_QWORD *result, uint64_t a2, int *a3, unsigned int a4)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  if (a4 >= 2)
  {
    v4 = (_QWORD *)result[6];
    v5 = *(_QWORD *)(result[4] + 8);
    v6 = *(_QWORD *)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6 + 1;
    v7 = v4[3];
    if (v6 >= (v4[4] - v7) >> 2)
      ___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2_cold_2();
    *(_DWORD *)(v7 + 4 * v6) = a4;
    v9 = v4 + 6;
    v8 = v4[6];
    v10 = (v9[1] - v8) >> 2;
    v11 = a4;
    do
    {
      v12 = *(_QWORD *)(result[5] + 8);
      v13 = *(_QWORD *)(v12 + 24);
      *(_QWORD *)(v12 + 24) = v13 + 1;
      if (v10 <= v13)
        ___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2_cold_1();
      v14 = *a3++;
      *(_DWORD *)(v8 + 4 * v13) = v14;
      --v11;
    }
    while (v11);
  }
  return result;
}

@end
