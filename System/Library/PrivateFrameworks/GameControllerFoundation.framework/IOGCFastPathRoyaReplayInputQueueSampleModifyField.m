@implementation IOGCFastPathRoyaReplayInputQueueSampleModifyField

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleModifyField_block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  objc_class *v14;
  _WORD *Instance;
  uint64_t result;

  v5 = *a3;
  LODWORD(v6) = *((unsigned __int16 *)*a3 + 9);
  if (*((_WORD *)*a3 + 9))
  {
    v7 = 0;
    v8 = 4;
    do
    {
      if (v5[v8] == v5[1])
      {
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
        {
          v9 = &v5[v8];
          goto LABEL_16;
        }
        v5 = *a3;
      }
      ++v7;
      v6 = *((unsigned __int16 *)v5 + 9);
      v8 += 6;
    }
    while (v7 < v6);
    if (!*((_WORD *)v5 + 9))
      goto LABEL_11;
    v9 = v5 + 4;
    v10 = *((unsigned __int16 *)v5 + 9);
    while (*v9 == v5[1])
    {
      v9 += 6;
      if (!--v10)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v11 = 2 * v6;
    v12 = v6 + 16;
    if (v11 >= v12)
      v13 = v12;
    else
      v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    Instance = class_createInstance(v14, 48 * v13);
    Instance[9] = v13;
    Instance[8] = *((_WORD *)*a3 + 8);
    *((_QWORD *)Instance + 1) = *((_QWORD *)*a3 + 1);
    *((_QWORD *)Instance + 3) = *((_QWORD *)*a3 + 3);
    *((_DWORD *)Instance + 5) = *((_DWORD *)*a3 + 5);
    memcpy(Instance + 16, (char *)*a3 + 32, 48 * *((unsigned __int16 *)*a3 + 9));

    *a3 = Instance;
    v9 = &Instance[24 * (unsigned __int16)Instance[9] - 8];
  }
LABEL_16:
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!(_DWORD)result)
    *v9 = *((_QWORD *)*a3 + 1);
  return result;
}

@end
