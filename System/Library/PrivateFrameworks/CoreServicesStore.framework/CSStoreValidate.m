@implementation CSStoreValidate

void ___CSStoreValidate_block_invoke_3(uint64_t a1, CSStore2::Table *this)
{
  uint64_t v4;
  __CFString *v5;

  if (*((_DWORD *)this + 18) == 0x3FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_retainAutorelease((id)CSStore2::Table::copyCFName(this));
    (*(void (**)(uint64_t, const char *, ...))(v4 + 16))(v4, "Table %s (%llx) has no remaining unit identifiers.", (const char *)-[__CFString UTF8String](v5, "UTF8String"), (4 * *(_DWORD *)this));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void ___CSStoreValidate_block_invoke_4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int *v9;
  void (**v10)(_QWORD, const char *, ...);
  void (**v11)(_QWORD, const char *, ...);
  unsigned int v12;
  unsigned int *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  _DWORD *v53;
  unsigned int v54;
  BOOL v55;
  unsigned int v56;
  unsigned int v57;
  unint64_t v58;
  unint64_t v59;
  char v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char v67;
  unint64_t v68;
  _BOOL4 v69;
  uint64_t v70;
  unint64_t v71;
  const char *p_p;
  unint64_t v74;
  unint64_t v75;
  char v76;
  unint64_t v77;
  _BOOL4 v78;
  uint64_t v79;
  void *__p;
  char v81;
  _QWORD v82[11];
  char v83;
  uint64_t v84;

  v2 = a2[19];
  if ((_DWORD)v2 == -1)
    return;
  v5 = *(uint64_t **)(a1 + 48);
  v6 = *(_QWORD *)(*v5 + 8);
  v7 = *(_DWORD *)(v6 + 12);
  v8 = (unsigned int *)(v6 + v2);
  if (v7 <= v2)
    v9 = 0;
  else
    v9 = v8;
  v10 = (void (**)(_QWORD, const char *, ...))*(id *)(a1 + 32);
  v11 = v10;
  v12 = *v9;
  if (*v9 - 16 > 0x1FF0)
  {
    v10[2](v10, "Nonsensical bucket count %llu", *v9);
    goto LABEL_140;
  }
  v13 = v9 + 1;
  v14 = *v5;
  if (*v5)
    v15 = *(_QWORD *)(v14 + 8);
  else
    v15 = 0;
  v16 = (unint64_t)v13 - v15;
  if ((unint64_t)v13 < v15 || HIDWORD(v16))
  {
    v17 = *(_QWORD *)(v14 + 8);
    v18 = *(_DWORD *)(v17 + 12);
    LODWORD(v16) = -1;
  }
  else
  {
    v17 = *(_QWORD *)(v14 + 8);
    v18 = *(_DWORD *)(v17 + 12);
    if ((int)v16 + 1 > v18 || v16 == -1)
      LODWORD(v16) = -1;
  }
  if (__CFADD__((_DWORD)v16, 8 * v12) || v16 + 8 * v12 > v18)
  {
    if (v14)
      v58 = v17;
    else
      v58 = 0;
    v55 = (unint64_t)v9 >= v58;
    v59 = (unint64_t)v9 - v58;
    v60 = !v55;
    v61 = (int)v59 + 1 > v18 || v59 == -1;
    v32 = !v61;
    v62 = 0xFFFFFFFFLL;
    if (v32)
      v62 = v59;
    if (HIDWORD(v59))
      v62 = 0xFFFFFFFFLL;
    if ((v60 & 1) != 0)
      v62 = 0xFFFFFFFFLL;
    v10[2](v10, "Hash map at %llu has invalid buckets range %llu-(%llu*%zu)", v62, v16, *v9, 8uLL);
    goto LABEL_140;
  }
  v20 = 0;
  v21 = *MEMORY[0x1E0DE4F60];
  v79 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  if (v12 <= 1)
    v22 = 1;
  else
    v22 = v12;
  do
  {
    v23 = &v9[2 * v20];
    v24 = v23[2];
    if ((_DWORD)v24 != -1)
    {
      v25 = v23[1];
      if (v25 >> 29
        || __CFADD__((_DWORD)v24, 8 * v25)
        || (v26 = *(_QWORD *)(v14 + 8), v27 = *(_DWORD *)(v26 + 12), (int)v24 + 8 * (int)v25 > v27))
      {
        if (v14)
          v74 = v17;
        else
          v74 = 0;
        v55 = (unint64_t)v9 >= v74;
        v75 = (unint64_t)v9 - v74;
        v76 = !v55;
        v77 = HIDWORD(v75);
        v78 = (int)v75 + 1 > v18 || v75 == -1;
        v75 = v75;
        if (v78)
          v75 = 0xFFFFFFFFLL;
        if (v77)
          v75 = 0xFFFFFFFFLL;
        if ((v76 & 1) != 0)
          v75 = 0xFFFFFFFFLL;
        v10[2](v10, "Bucket [%llu,%llu] has invalid key-value pairs offset range %llu-(%llu*%zu)", v75, v20, v24, v25, 8uLL);
        goto LABEL_140;
      }
      v28 = v26 + v24;
      v29 = v27 <= v24 ? 0 : v28;
      if ((_DWORD)v25)
      {
        v30 = 0;
        v31 = (unsigned int *)(v29 + 4);
        while (1)
        {
          if (*v31 != -1)
          {
            v32 = v18 <= *v31 || v17 == 0;
            if (v32)
            {
              std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v82);
              std::ostream::operator<<();
              v63 = *v5;
              if (*v5)
                v64 = *(_QWORD *)(v63 + 8);
              else
                v64 = 0;
              v70 = 0xFFFFFFFFLL;
              v55 = (unint64_t)v9 >= v64;
              v71 = (unint64_t)v9 - v64;
              if (v55 && !HIDWORD(v71))
              {
                if ((v71 + 1) > *(_DWORD *)(*(_QWORD *)(v63 + 8) + 12) || v71 == -1)
                  v70 = 0xFFFFFFFFLL;
                else
                  v70 = v71;
              }
              std::stringbuf::str();
              if (v81 >= 0)
                p_p = (const char *)&__p;
              else
                p_p = (const char *)__p;
              v11[2](v11, "Key-value pair [%llu,%llu,%llu] has invalid value (interpreted as Offset) %s", v70, v20, v30, p_p);
              if (v81 < 0)
                operator delete(__p);
              v82[0] = v21;
              *(_QWORD *)((char *)v82 + *(_QWORD *)(v21 - 24)) = v79;
              v82[1] = MEMORY[0x1E0DE4FB8] + 16;
              if (v83 < 0)
                operator delete((void *)v82[9]);
              std::streambuf::~streambuf();
              std::ostream::~ostream();
              MEMORY[0x1A85AA10C](&v84);
              goto LABEL_140;
            }
            v33 = (unsigned __int16)(*(v31 - 1) >> 2) % v12;
            if (v20 != v33)
              break;
          }
          ++v30;
          v31 += 2;
          if (v25 == v30)
            goto LABEL_39;
        }
        if (v14)
          v65 = v17;
        else
          v65 = 0;
        v55 = (unint64_t)v9 >= v65;
        v66 = (unint64_t)v9 - v65;
        v67 = !v55;
        v68 = HIDWORD(v66);
        v69 = (int)v66 + 1 > v18 || v66 == -1;
        v66 = v66;
        if (v69)
          v66 = 0xFFFFFFFFLL;
        if (v68)
          v66 = 0xFFFFFFFFLL;
        if ((v67 & 1) != 0)
          v66 = 0xFFFFFFFFLL;
        v10[2](v10, "Key-value pair [%llu,%llu,%llu] is in the wrong bucket (should be %llu)", v66, v20, v30, v33);
LABEL_140:

        return;
      }
    }
LABEL_39:
    ++v20;
  }
  while (v20 != v22);

  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v35 = *(_BYTE *)(v34 + 24);
  v36 = *v9;
  if (!(_DWORD)v36)
    goto LABEL_70;
  v37 = 0;
  v38 = *(_QWORD *)(a1 + 48);
  while (2)
  {
    v39 = &v9[2 * v37];
    v42 = v39[1];
    v41 = v39 + 1;
    v40 = v42;
    if (v42 - 0x20000000 >= 0xE0000001)
    {
      v43 = v9[2 * v37 + 2];
      v44 = v43 + 8 * v40;
      if (!__CFADD__((_DWORD)v43, 8 * v40))
      {
        v45 = *(_QWORD *)(*(_QWORD *)v38 + 8);
        v46 = *(_DWORD *)(v45 + 12);
        if (v44 <= v46 && v46 > v43)
        {
          v48 = 0;
          v49 = v45 + v43;
          while (1)
          {
            v50 = *(unsigned int *)(v49 + 4);
            if ((_DWORD)v50 != -1)
            {
              v51 = *(_QWORD *)(*(_QWORD *)v38 + 8);
              v52 = *(_DWORD *)(v51 + 12);
              if (v52 <= v50)
              {
                (*(void (**)(_QWORD, const char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), "Unit %llx in table %llx has an invalid address.");
                goto LABEL_63;
              }
              v53 = (_DWORD *)(v51 + v50);
              v54 = *(_DWORD *)(v51 + v50 + 4);
              if (v54 >> 25)
              {
                (*(void (**)(_QWORD, const char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), "Unit %llx is insanely long (payload %llu bytes long.)");
                goto LABEL_63;
              }
              if (v50 >= 0xFFFFFFF8
                || (int)v50 + 8 > v52
                || (v55 = __CFADD__((_DWORD)v50, v54 + 8), v56 = v50 + v54 + 8, v55)
                || v56 > v52)
              {
                (*(void (**)(_QWORD, const char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), "Unit %llx is out of range (total %llu bytes long.)");
                goto LABEL_63;
              }
              v57 = *v53 & 0xC0000000;
              if ((*a2 & 0x3FFFFFFF) != 0x3FFFDB5D)
              {
                if (v57 != 0x40000000)
                  goto LABEL_64;
LABEL_67:
                (*(void (**)(_QWORD, const char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), "Unit %llx/%llx is garbage");
LABEL_63:
                v35 = 0;
                goto LABEL_64;
              }
              if (v57 != 0x40000000)
                goto LABEL_67;
            }
LABEL_64:
            v49 += 8;
            if (++v48 >= (unint64_t)*v41)
            {
              v36 = *v9;
              break;
            }
          }
        }
      }
    }
    if (++v37 < v36)
      continue;
    break;
  }
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_70:
  *(_BYTE *)(v34 + 24) = v35;
}

void ___CSStoreValidate_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  FILE *v14;
  id v15;

  v10 = (void *)MEMORY[0x1A85AA4B4]();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:arguments:", v12, &a9);

  v14 = (FILE *)*MEMORY[0x1E0C80C10];
  v15 = objc_retainAutorelease(v13);
  fprintf(v14, "*** %s ***\n", (const char *)objc_msgSend(v15, "UTF8String"));

  objc_autoreleasePoolPop(v10);
}

@end
