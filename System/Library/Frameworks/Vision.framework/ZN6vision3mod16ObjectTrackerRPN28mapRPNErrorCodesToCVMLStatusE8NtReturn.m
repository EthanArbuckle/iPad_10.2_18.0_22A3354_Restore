@implementation ZN6vision3mod16ObjectTrackerRPN28mapRPNErrorCodesToCVMLStatusE8NtReturn

_QWORD *___ZN6vision3mod16ObjectTrackerRPN28mapRPNErrorCodesToCVMLStatusE8NtReturn_block_invoke()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  int *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  int v11;
  uint64_t *v12;
  uint64_t *v13;
  _OWORD *v14;
  uint64_t v15;
  int v16;
  _DWORD v17[2];
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  result = (_QWORD *)operator new();
  v1 = (uint64_t)result;
  v2 = 0;
  v3 = 0;
  v17[0] = 0;
  v18 = 6784;
  v19 = -1;
  v20 = 6746;
  v21 = -2;
  v22 = 6745;
  v23 = -3;
  v24 = 6783;
  v25 = -4;
  v26 = 6780;
  v27 = -5;
  v28 = 6779;
  v29 = -6;
  v30 = 6764;
  v31 = -7;
  v32 = 6760;
  v33 = -8;
  v34 = 6782;
  result[1] = 0;
  v4 = result + 1;
  result[2] = 0;
  v5 = result + 1;
  *result = result + 1;
  while (1)
  {
    v6 = &v17[4 * v3];
    v7 = v4;
    if (v5 == v4)
      goto LABEL_8;
    v8 = v2;
    v9 = v4;
    if (v2)
    {
      do
      {
        v7 = v8;
        v8 = (uint64_t *)v8[1];
      }
      while (v8);
    }
    else
    {
      do
      {
        v7 = (uint64_t *)v9[2];
        v10 = *v7 == (_QWORD)v9;
        v9 = v7;
      }
      while (v10);
    }
    v11 = *v6;
    if (*((_DWORD *)v7 + 8) < *v6)
    {
LABEL_8:
      v12 = v2 ? v7 : v4;
      v13 = v2 ? v7 + 1 : v4;
    }
    else
    {
      v12 = v4;
      v13 = v4;
      if (v2)
      {
        v13 = v4;
        while (1)
        {
          while (1)
          {
            v12 = v2;
            v16 = *((_DWORD *)v2 + 8);
            if (v11 >= v16)
              break;
            v2 = (uint64_t *)*v12;
            v13 = v12;
            if (!*v12)
              goto LABEL_15;
          }
          if (v16 >= v11)
            break;
          v13 = v12 + 1;
          v2 = (uint64_t *)v12[1];
          if (!v2)
            goto LABEL_15;
        }
      }
    }
    if (!*v13)
    {
LABEL_15:
      v14 = operator new(0x30uLL);
      v14[2] = *(_OWORD *)v6;
      *(_QWORD *)v14 = 0;
      *((_QWORD *)v14 + 1) = 0;
      *((_QWORD *)v14 + 2) = v12;
      *v13 = (uint64_t)v14;
      v15 = **(_QWORD **)v1;
      if (v15)
      {
        *(_QWORD *)v1 = v15;
        v14 = (_OWORD *)*v13;
      }
      result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v1 + 8), (uint64_t *)v14);
      ++*(_QWORD *)(v1 + 16);
    }
    if (++v3 == 9)
      break;
    v5 = *(uint64_t **)v1;
    v2 = *(uint64_t **)(v1 + 8);
  }
  vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(NtReturn)::mapRPNErrorCodesToCVMLStatus = v1;
  return result;
}

@end
