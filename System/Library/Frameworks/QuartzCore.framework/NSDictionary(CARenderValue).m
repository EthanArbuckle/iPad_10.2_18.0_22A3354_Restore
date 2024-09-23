@implementation NSDictionary(CARenderValue)

- (_DWORD)CA_copyRenderKeyValueArray
{
  uint64_t v2;
  CA::Render::Array *v3;
  size_t v4;
  char *v5;
  uint64_t v6;
  const __CFString **v7;
  _DWORD *v8;
  CA::Render::Array *i;
  int v10;
  uint64_t v11;
  malloc_zone_t *malloc_zone;
  _DWORD *v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  _BOOL4 v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "count");
  v3 = (CA::Render::Array *)v2;
  v4 = 8 * v2;
  if ((unint64_t)(8 * v2) > 0x1000)
  {
    v5 = (char *)malloc_type_malloc(8 * v2, 0x1014220uLL);
    v7 = (const __CFString **)malloc_type_malloc(v4, 0x4717BFE4uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v2);
    v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v4);
    MEMORY[0x1E0C80A78](v6);
    v7 = (const __CFString **)v5;
    bzero(v5, v4);
  }
  v8 = 0;
  if (v5)
  {
    if (v7)
    {
      v8 = CA::Render::Array::new_array(v3, 0, 0, 0);
      if (v8)
      {
        objc_msgSend(a1, "getObjects:andKeys:count:", v5, v7, v3);
        if (!v3)
          return v8;
        for (i = 0; i != v3; i = (CA::Render::Array *)((char *)i + 1))
        {
          v10 = CAInternAtom(v7[(_QWORD)i], 1);
          v11 = objc_msgSend(*(id *)&v5[8 * (_QWORD)i], "CA_copyRenderValue");
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          v13 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x20uLL, 0x743898A5uLL);
          if (v13)
          {
            v13[2] = 1;
            v13[3] = 28;
            ++dword_1ECDC7C98;
            *(_QWORD *)v13 = off_1E1599568;
            v13[4] = v10;
            if (v11)
            {
              v14 = (unsigned int *)(v11 + 8);
              do
                v15 = __ldaxr(v14);
              while (__stlxr(v15 + 1, v14));
              v16 = v11;
              if (!v15)
              {
                do
                {
                  v16 = 0;
                  v17 = __ldaxr(v14);
                }
                while (__stlxr(v17 - 1, v14));
              }
            }
            else
            {
              v16 = 0;
            }
            *((_QWORD *)v13 + 3) = v16;
          }
          *(_QWORD *)&v8[2 * i + 6] = v13;
          if (v11)
          {
            v18 = (unsigned int *)(v11 + 8);
            do
            {
              v19 = __ldaxr(v18);
              v20 = v19 - 1;
            }
            while (__stlxr(v20, v18));
            if (!v20)
              (*(void (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
          }
        }
      }
    }
  }
  v21 = v4 > 0x1000;
  if (v4 > 0x1000 && v7)
  {
    free(v7);
    v21 = 1;
  }
  if (v21 && v5)
    free(v5);
  return v8;
}

@end
