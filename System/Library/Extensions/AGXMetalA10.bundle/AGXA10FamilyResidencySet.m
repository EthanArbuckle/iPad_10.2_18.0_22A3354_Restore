@implementation AGXA10FamilyResidencySet

- (BOOL)_commitAddedAllocations:(const void *)a3 count:(unint64_t)a4 removedAllocations:(const void *)a5 count:(unint64_t)a6
{
  uint64_t v8;
  __int128 v9;
  int *v10;
  int *v11;
  int *v12;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  int v19;
  _BYTE *v20;
  unint64_t v21;
  _OWORD *v22;
  __int128 *v23;
  unint64_t v24;
  __int128 v25;
  unint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  int *v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  _OWORD *v39;
  __int128 *v40;
  unint64_t v41;
  __int128 v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  int updated;
  uint64_t v51;
  __int128 v52;
  _BYTE v53[2048];
  _BYTE *v54;
  __int128 v55;
  _BYTE v56[1024];
  _BYTE *v57;
  __int128 v58;

  v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE51640]);
  v57 = v56;
  v9 = xmmword_232D73D70;
  v58 = xmmword_232D73D70;
  v10 = (int *)MEMORY[0x24BDDD800];
  v11 = (int *)MEMORY[0x24BE51650];
  v12 = (int *)MEMORY[0x24BE51638];
  if (a4)
  {
    v15 = 0;
    v16 = 0;
    v17 = v56;
    do
    {
      v18 = (char *)a3[v16];
      if (*(_QWORD *)&v18[*v10] != 1)
        v18 = *(char **)&v18[*v12];
      v19 = *(_DWORD *)&v18[*v11 + 48];
      if (v15 >= *((_QWORD *)&v58 + 1))
      {
        v52 = v9;
        v51 = v8;
        *((_QWORD *)&v58 + 1) *= 2;
        v17 = (_BYTE *)operator new[]();
        v15 = v58;
        v20 = v57;
        v9 = v52;
        if ((_QWORD)v58)
        {
          v21 = 0;
          if ((unint64_t)v58 < 8)
            goto LABEL_14;
          if ((unint64_t)(v17 - v57) <= 0x1F)
            goto LABEL_14;
          v21 = v58 & 0xFFFFFFFFFFFFFFF8;
          v22 = v17 + 16;
          v23 = (__int128 *)(v57 + 16);
          v24 = v58 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v25 = *v23;
            *(v22 - 1) = *(v23 - 1);
            *v22 = v25;
            v22 += 2;
            v23 += 2;
            v24 -= 8;
          }
          while (v24);
          if (v15 != v21)
          {
LABEL_14:
            v26 = v15 - v21;
            v27 = 4 * v21;
            v28 = &v17[4 * v21];
            v29 = (int *)&v20[v27];
            do
            {
              v30 = *v29++;
              *v28++ = v30;
              --v26;
            }
            while (v26);
          }
        }
        if (v20 != v56 && v20)
        {
          MEMORY[0x234927EB4](v20, 0x1000C8052888210);
          v9 = v52;
          v15 = v58;
        }
        v57 = v17;
        v8 = v51;
      }
      *(_QWORD *)&v58 = v15 + 1;
      *(_DWORD *)&v17[4 * v15] = v19;
      ++v16;
      ++v15;
    }
    while (v16 != a4);
  }
  v54 = v53;
  v55 = v9;
  v31 = 0;
  if (a6)
  {
    v32 = 0;
    v33 = v53;
    do
    {
      v34 = (char *)a5[v32];
      if (*(_QWORD *)&v34[*v10] != 1)
        v34 = *(char **)&v34[*v12];
      v35 = *(_QWORD *)&v34[*v11 + 96];
      if (v31 >= *((_QWORD *)&v55 + 1))
      {
        v36 = v8;
        *((_QWORD *)&v55 + 1) *= 2;
        v33 = (_BYTE *)operator new[]();
        v31 = v55;
        v37 = v54;
        if ((_QWORD)v55)
        {
          v38 = 0;
          if ((unint64_t)v55 < 4)
            goto LABEL_33;
          if ((unint64_t)(v33 - v54) <= 0x1F)
            goto LABEL_33;
          v38 = v55 & 0xFFFFFFFFFFFFFFFCLL;
          v39 = v33 + 16;
          v40 = (__int128 *)(v54 + 16);
          v41 = v55 & 0xFFFFFFFFFFFFFFFCLL;
          do
          {
            v42 = *v40;
            *(v39 - 1) = *(v40 - 1);
            *v39 = v42;
            v39 += 2;
            v40 += 2;
            v41 -= 4;
          }
          while (v41);
          if (v31 != v38)
          {
LABEL_33:
            v43 = v31 - v38;
            v44 = 8 * v38;
            v45 = &v33[8 * v38];
            v46 = (uint64_t *)&v37[v44];
            do
            {
              v47 = *v46++;
              *v45++ = v47;
              --v43;
            }
            while (v43);
          }
        }
        if (v37 != v53 && v37)
        {
          MEMORY[0x234927EB4](v37, 0x1000C8000313F17);
          v31 = v55;
        }
        v54 = v33;
        v8 = v36;
      }
      *(_QWORD *)&v33[8 * v31++] = v35;
      *(_QWORD *)&v55 = v31;
      ++v32;
    }
    while (v32 != a6);
  }
  updated = IOGPUResourceGroupUpdateResources();
  if (v54 != v53 && v54 != 0)
    MEMORY[0x234927EB4]();
  if (v57 != v56 && v57)
    MEMORY[0x234927EB4]();
  return updated == 0;
}

- (void).cxx_destruct
{
  unordered_map<const IOGPUMetalResource *, unsigned int, std::hash<const IOGPUMetalResource *>, std::equal_to<const IOGPUMetalResource *>, std::allocator<std::pair<const IOGPUMetalResource *const, unsigned int>>> *p_subResourceRefCounts;
  _QWORD *next;
  _QWORD *v4;
  void **value;

  p_subResourceRefCounts = &self->_subResourceRefCounts;
  next = self->_subResourceRefCounts.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_;
  p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  return self;
}

@end
