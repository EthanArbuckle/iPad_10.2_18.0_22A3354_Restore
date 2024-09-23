@implementation ZN8GPUTools2GL30EnumerateProgramActiveUniformsERKNS0

_QWORD *___ZN8GPUTools2GL30EnumerateProgramActiveUniformsERKNS0_10DispatcherE11DYOpenGLAPIjbU13block_pointerFvRKNS0_14ProgramUniformERbE_block_invoke(_QWORD *result, uint64_t a2, int a3, _BYTE *a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t v19[2];
  _BYTE v20[42];
  int v21;

  if ((_DWORD)a2)
  {
    v6 = result;
    v7 = 0;
    v8 = a2;
    v9 = result[5];
    do
    {
      *(_DWORD *)(v9 + 4 * v7) = a3 + v7;
      ++v7;
    }
    while (a2 != v7);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(result[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)result[6] + 16), *((unsigned int *)result + 34), a2);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35387, v6[8]);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35388, v6[9]);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35389, v6[10]);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35390, v6[11]);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35424, v6[12]);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6[6] + 8) + 3536))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35428, v6[13]);
    v10 = 0;
    memset(v20, 0, sizeof(v20));
    v21 = 0;
    v11 = v6[14];
    v19[0] = v6[15];
    v19[1] = v11;
    v12 = 4 * v8 - 4;
    do
    {
      v13 = v6[5];
      v14 = (_QWORD *)v6[6];
      *(_DWORD *)&v20[16] = *(_DWORD *)(v13 + v10);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _BYTE *, _BYTE *, _BYTE *, uint64_t))(v14[1] + 5008))(*(_QWORD *)(*v14 + 16), v6[16], *(unsigned int *)(v13 + v10), *((unsigned int *)v6 + 35), v20, &v20[4], &v20[8], v19[0]);
      v15 = v6[8];
      *(_DWORD *)&v20[20] = *(_DWORD *)(v6[7] + v10);
      *(_DWORD *)&v20[24] = *(_DWORD *)(v15 + v10);
      v16 = v6[10];
      *(_DWORD *)&v20[32] = *(_DWORD *)(v6[9] + v10);
      *(_DWORD *)&v20[36] = *(_DWORD *)(v16 + v10);
      v20[40] = *(_DWORD *)(v6[11] + v10);
      v17 = *(_BYTE *)v19[0] == 103 && *(_BYTE *)(v19[0] + 1) == 108 && *(unsigned __int8 *)(v19[0] + 2) == 95;
      v20[41] = v17;
      v21 = (*(_DWORD *)(v6[12] + v10) != 0) | (2 * (*(_DWORD *)(v6[13] + v10) != 0));
      if (v17)
      {
        *(_DWORD *)&v20[12] = -1;
      }
      else
      {
        *(_DWORD *)&v20[12] = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v6[6] + 8) + 5000))(*(_QWORD *)(*(_QWORD *)v6[6] + 16), v6[16]);
        result = GPUTools::GL::SetUniformArrayLocationStride((_QWORD *)v6[6], v6[16], v19);
      }
      if (!*((_BYTE *)v6 + 144) || !v20[41])
        result = (_QWORD *)(*(uint64_t (**)(void))(v6[4] + 16))();
      if (*a4)
        break;
      v18 = v12 == v10;
      v10 += 4;
    }
    while (!v18);
  }
  return result;
}

@end
