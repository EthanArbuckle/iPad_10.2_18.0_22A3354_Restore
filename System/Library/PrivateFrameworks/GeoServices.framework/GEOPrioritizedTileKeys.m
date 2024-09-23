@implementation GEOPrioritizedTileKeys

- (GEOPrioritizedTileKeys)initWithKeys:(id)a3 priorities:(id)a4
{
  GEOPrioritizedTileKeys *v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t (*v13)(__int128 *, __int128 *);
  uint64_t (*v14)(__int128 *, __int128 *);
  char *v15;
  __int128 v16;
  uint64_t (*v17)(__int128 *, __int128 *);
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _OWORD *v23;
  void *v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t (*v28)(__int128 *, __int128 *);
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t (*v33)(__int128 *, __int128 *);
  uint64_t (*v34)(__int128 *, __int128 *);
  uint64_t (*v35)(__int128 *, __int128 *);
  uint64_t (*v36)(__int128 *, __int128 *);
  __int128 v37;
  uint64_t (*v38)(__int128 *, __int128 *);
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  GEOPrioritizedTileKeys *v46;
  id v47;
  id v48;
  uint64_t v49;
  objc_super v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  BOOL (*v55)(uint64_t, uint64_t);
  uint64_t (*v56)(__int128 *, __int128 *);
  uint64_t (*v57)(__int128 *, __int128 *);
  uint64_t v58;
  uint64_t (*v59)(__int128 *, __int128 *);
  char *v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v48 = a4;
  v50.receiver = self;
  v50.super_class = (Class)GEOPrioritizedTileKeys;
  v6 = -[GEOPrioritizedTileKeys init](&v50, sel_init);
  if (v6)
  {
    v7 = (_QWORD *)operator new();
    v46 = v6;
    v8 = v47;
    v9 = v48;
    v10 = v8;
    v11 = v9;
    v7[1] = 0;
    v7[2] = 0;
    *v7 = 0;
    v12 = objc_msgSend(v10, "count");
    v49 = (uint64_t)(v7 + 2);
    if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v7[2] - *v7) >> 2) < v12)
    {
      if (v12 > 0xCCCCCCCCCCCCCCCLL)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v14 = (uint64_t (*)(__int128 *, __int128 *))*v7;
      v13 = (uint64_t (*)(__int128 *, __int128 *))v7[1];
      v15 = v60;
      if (v13 == (uint64_t (*)(__int128 *, __int128 *))*v7)
      {
        v17 = (uint64_t (*)(__int128 *, __int128 *))v7[1];
      }
      else
      {
        do
        {
          v16 = *(_OWORD *)((char *)v13 - 20);
          *((_DWORD *)v15 - 1) = *((_DWORD *)v13 - 1);
          *(_OWORD *)(v15 - 20) = v16;
          v15 -= 20;
          v13 = (uint64_t (*)(__int128 *, __int128 *))((char *)v13 - 20);
        }
        while (v13 != v14);
        v17 = (uint64_t (*)(__int128 *, __int128 *))*v7;
        v13 = (uint64_t (*)(__int128 *, __int128 *))v7[1];
      }
      *v7 = v15;
      v18 = v7[2];
      *(_OWORD *)(v7 + 1) = v61;
      *(_QWORD *)&v61 = v13;
      *((_QWORD *)&v61 + 1) = v18;
      v59 = v17;
      v60 = (char *)v17;
      if (v13 != v17)
        *(_QWORD *)&v61 = (char *)v17 + ((char *)v13 - (char *)v17 - 20) % 0x14uLL;
      if (v17)
        operator delete(v17);
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, &v59, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v52 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_OWORD **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (v11)
          {
            objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "unsignedIntValue");

          }
          else
          {
            v25 = 0;
          }
          v27 = v7[1];
          v26 = v7[2];
          if (v27 >= v26)
          {
            v29 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v27 - *v7) >> 2);
            v30 = v29 + 1;
            if ((unint64_t)(v29 + 1) > 0xCCCCCCCCCCCCCCCLL)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v31 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v26 - *v7) >> 2);
            if (2 * v31 > v30)
              v30 = 2 * v31;
            if (v31 >= 0x666666666666666)
              v32 = 0xCCCCCCCCCCCCCCCLL;
            else
              v32 = v30;
            v33 = v57;
            *(_OWORD *)v57 = *v23;
            *((_DWORD *)v33 + 4) = v25;
            v34 = v56;
            v28 = (uint64_t (*)(__int128 *, __int128 *))((char *)v57 + 20);
            v57 = (uint64_t (*)(__int128 *, __int128 *))((char *)v57 + 20);
            v36 = (uint64_t (*)(__int128 *, __int128 *))*v7;
            v35 = (uint64_t (*)(__int128 *, __int128 *))v7[1];
            if (v35 == (uint64_t (*)(__int128 *, __int128 *))*v7)
            {
              v38 = (uint64_t (*)(__int128 *, __int128 *))v7[1];
            }
            else
            {
              do
              {
                v37 = *(_OWORD *)((char *)v35 - 20);
                *((_DWORD *)v34 - 1) = *((_DWORD *)v35 - 1);
                *(_OWORD *)((char *)v34 - 20) = v37;
                v34 = (uint64_t (*)(__int128 *, __int128 *))((char *)v34 - 20);
                v35 = (uint64_t (*)(__int128 *, __int128 *))((char *)v35 - 20);
              }
              while (v35 != v36);
              v38 = (uint64_t (*)(__int128 *, __int128 *))*v7;
              v35 = (uint64_t (*)(__int128 *, __int128 *))v7[1];
              v28 = v57;
            }
            *v7 = v34;
            v7[1] = v28;
            v39 = v7[2];
            v7[2] = v58;
            v57 = v35;
            v58 = v39;
            v55 = (BOOL (*)(uint64_t, uint64_t))v38;
            v56 = v38;
            if (v35 != v38)
              v57 = (uint64_t (*)(__int128 *, __int128 *))((char *)v35
                                                                   - 20
                                                                   - 20 * (((char *)v35 - (char *)v38 - 20) / 0x14uLL));
            if (v38)
              operator delete(v38);
          }
          else
          {
            *(_OWORD *)v27 = *v23;
            *(_DWORD *)(v27 + 16) = v25;
            v28 = (uint64_t (*)(__int128 *, __int128 *))(v27 + 20);
          }
          v7[1] = v28;
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, &v59, 16);
      }
      while (v20);
    }

    v40 = *v7;
    v41 = v7[1];
    v42 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v41 - *v7) >> 2));
    v43 = v41 == *v7;
    if (v43)
      v44 = 0;
    else
      v44 = v42;

    v6 = v46;
    v46->_keysAndPriorities = v7;
  }

  return v6;
}

- (_QWORD)removeKey:(__int128 *)a3
{
  char **v3;
  char *v4;
  char *v5;
  int64_t v7;
  __int128 v8;

  v3 = (char **)result[1];
  v5 = *v3;
  v4 = v3[1];
  v8 = *a3;
  if (*v3 != v4)
  {
    while ((_QWORD)v8 != *(_QWORD *)v5 || *((_QWORD *)&v8 + 1) != *((_QWORD *)v5 + 1))
    {
      v5 += 20;
      if (v5 == v4)
        return result;
    }
  }
  if (v5 != v4)
  {
    v7 = v4 - (v5 + 20);
    if (v4 != v5 + 20)
      result = memmove(v5, v5 + 20, v4 - (v5 + 20));
    v3[1] = &v5[v7];
  }
  return result;
}

- (unsigned)highestPriority
{
  uint64_t *keysAndPriorities;
  uint64_t v3;
  uint64_t v4;

  keysAndPriorities = (uint64_t *)self->_keysAndPriorities;
  v4 = *keysAndPriorities;
  v3 = keysAndPriorities[1];
  if (v4 == v3)
    return 0;
  else
    return *(_DWORD *)(v3 - 4);
}

- (unint64_t)count
{
  return 0xCCCCCCCCCCCCCCCDLL
       * ((uint64_t)(*((_QWORD *)self->_keysAndPriorities + 1) - *(_QWORD *)self->_keysAndPriorities) >> 2);
}

- (BOOL)popHighestPriorityKey:(_OWORD *)a3 priority:(_DWORD *)a4
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;

  v4 = *(uint64_t **)(a1 + 8);
  v5 = *v4;
  v6 = v4[1];
  if (*v4 != v6)
  {
    v9 = *(_OWORD *)(v6 - 20);
    v7 = *(_DWORD *)(v6 - 4);
    v4[1] = v6 - 20;
    *a3 = v9;
    *a4 = v7;
  }
  return v5 != v6;
}

- (void)dealloc
{
  void **keysAndPriorities;
  void *v4;
  objc_super v5;

  keysAndPriorities = (void **)self->_keysAndPriorities;
  if (keysAndPriorities)
  {
    v4 = *keysAndPriorities;
    if (*keysAndPriorities)
    {
      keysAndPriorities[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x18D76437C](keysAndPriorities, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOPrioritizedTileKeys;
  -[GEOPrioritizedTileKeys dealloc](&v5, sel_dealloc);
}

- (GEOPrioritizedTileKeys)init
{
  GEOPrioritizedTileKeys *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOPrioritizedTileKeys;
  v2 = -[GEOPrioritizedTileKeys init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v2->_keysAndPriorities = v3;
  }
  return v2;
}

- (void)setPriority:(int)a3 forKey:(_OWORD *)a4
{
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v9;
  int64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  const std::nothrow_t *v15;
  char *v16;
  BOOL v17;
  char *v18;
  uint64_t (*v19[3])(char *, char *);
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = *(uint64_t **)(a1 + 8);
  v5 = *v4;
  v6 = (char *)v4[1];
  *(_OWORD *)v19 = *a4;
  v7 = v5;
  if ((char *)v5 != v6)
  {
    v7 = v5;
    while (v19[0] != *(uint64_t (**)(char *, char *))v7
         || v19[1] != *(uint64_t (**)(char *, char *))(v7 + 8))
    {
      v7 += 20;
      if ((char *)v7 == v6)
        return;
    }
  }
  if ((char *)v7 != v6)
  {
    *(_DWORD *)(v7 + 16) = a3;
    if (v5 != v7)
    {
      if (v7 - v5 < 1)
      {
        v9 = 0;
        v10 = 0;
      }
      else
      {
        v9 = (char *)operator new(0x14uLL, MEMORY[0x1E0DE4E10]);
        v10 = v9 != 0;
      }
      if (v9)
        operator delete(v9);
      v5 = *v4;
      v6 = (char *)v4[1];
    }
    v11 = (char *)(v7 + 20);
    v12 = (v6 - v11) >> 2;
    v13 = 0xCCCCCCCCCCCCCCCDLL * v12;
    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * v12) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v11[-v5] >> 2)))
      v14 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v11[-v5] >> 2);
    else
      v14 = 0xCCCCCCCCCCCCCCCDLL * v12;
    if (v14 < 1)
    {
LABEL_24:
      v18 = 0;
      v14 = 0;
    }
    else
    {
      v15 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
      while (1)
      {
        v16 = (char *)operator new(20 * v14, v15);
        if (v16)
          break;
        v17 = (unint64_t)v14 > 1;
        v14 = (unint64_t)v14 >> 1;
        if (!v17)
          goto LABEL_24;
      }
      v18 = v16;
    }
    if (v18)
      operator delete(v18);
  }
}

@end
