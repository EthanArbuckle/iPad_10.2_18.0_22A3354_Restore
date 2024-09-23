@implementation _NSSharedKeySetS

- (_NSSharedKeySetS)init
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSSharedKeySetS;
    self = -[_NSSharedKeySetS init](&v2, sel_init);
    if (self)
      self->_numKey = 0;
  }
  return self;
}

- (void)initWithConfiguration:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  SEL v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_NSSharedKeySetS;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 12) = 0;
    if (a2)
    {
      *((_BYTE *)v3 + 16) = *(_BYTE *)a2;
      *((_QWORD *)v3 + 4) = *(_QWORD *)(a2 + 8);
      *((_DWORD *)v3 + 10) = *(_DWORD *)(a2 + 16);
      *((_DWORD *)v3 + 11) = *(_DWORD *)(a2 + 20);
      *((_DWORD *)v3 + 12) = *(_DWORD *)(a2 + 24);
      *((_QWORD *)v3 + 7) = *(_QWORD *)(a2 + 32);
      *((_QWORD *)v3 + 1) = *(_QWORD *)(a2 + 40);
      *((_QWORD *)v3 + 3) = *(_QWORD *)(a2 + 48);
      *((_QWORD *)v3 + 8) = *(_QWORD *)(a2 + 56);
      *((_QWORD *)v3 + 9) = *(_QWORD *)(a2 + 64);
      *((_QWORD *)v3 + 10) = *(_QWORD *)(a2 + 72);
      *((_QWORD *)v3 + 11) = *(_QWORD *)(a2 + 80);
      *((_DWORD *)v3 + 26) = *(_DWORD *)(a2 + 88);
      *((_DWORD *)v3 + 27) = *(_DWORD *)(a2 + 92);
      if (*(_QWORD *)(a2 + 96))
      {
        v5 = (id)-[_NSSharedKeySetS initWithConfiguration:]([_NSSharedKeySetS alloc], *(_QWORD *)(a2 + 96));
        objc_setProperty_atomic(v4, v6, v5, 96);
      }
    }
  }
  return v4;
}

- (BOOL)isEmpty
{
  return self->_numKey == 0;
}

- (uint64_t)allKeys
{
  uint64_t v2;
  _DWORD *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  unint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;

  if (!a1)
    return 0;
  if (a1[12])
  {
    LODWORD(v2) = 0;
    v3 = a1;
    do
    {
      v2 = (v3[12] + v2);
      v3 = (_DWORD *)*((_QWORD *)v3 + 12);
    }
    while (v3);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
    v5 = 0;
    v6 = (a1[26] << (a1[27] == 0));
    v7 = v2 - 1;
    do
    {
      v8 = (void *)MEMORY[0x1E0C99D50];
      if (a1[27])
      {
        if (a1[12])
        {
          v9 = v5;
          v10 = a1;
          while (1)
          {
            v11 = v10[12];
            v12 = v9 >= v11;
            v13 = v9 - v11;
            if (!v12)
              break;
            v10 = (_DWORD *)*((_QWORD *)v10 + 12);
            v9 = v13;
            if (!v10)
              goto LABEL_12;
          }
          v14 = *((_QWORD *)v10 + 11) + 3 * v9;
        }
        else
        {
LABEL_12:
          v14 = 0;
        }
      }
      else
      {
        v14 = -[_NSSharedKeySetS keyAtIndex:]((uint64_t)a1, v5);
      }
      objc_msgSend(v4, "addObject:", objc_msgSend(v8, "dataWithBytes:length:", v14, v6));
      ++v5;
    }
    while (v5 <= v7);
    return (uint64_t)v4;
  }
  return objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (uint64_t)keyAtIndex:(uint64_t)a1
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  int v7;

  v2 = 0;
  if (a1 && a2 != 0x7FFFFFFFFFFFFFFFLL && *(_DWORD *)(a1 + 48))
  {
    while (1)
    {
      v3 = *(unsigned int *)(a1 + 48);
      v4 = a2 >= v3;
      v5 = a2 - v3;
      if (!v4)
        break;
      a1 = *(_QWORD *)(a1 + 96);
      a2 = v5;
      if (!a1)
        return 0;
    }
    v7 = *(_DWORD *)(a1 + 104);
    switch(v7)
    {
      case 3:
        return *(_QWORD *)(a1 + 80) + 6 * a2;
      case 2:
        return *(_QWORD *)(a1 + 72) + 4 * a2;
      case 1:
        return *(_QWORD *)(a1 + 64) + 2 * a2;
      default:
        return 0;
    }
  }
  return v2;
}

- (unint64_t)indexForKey:(unsigned __int16 *)a3 length:(unint64_t)a4
{
  uint64_t keyLen;
  _NSSharedKeySetS *v5;
  unsigned __int16 *v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int M;
  size_t v13;
  unsigned int *seeds;
  unsigned int factor;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t v24;
  int select;
  unint64_t v26;
  unsigned __int16 *v27;
  _DWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  keyLen = self->_keyLen;
  if (keyLen != a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = self;
  if (!self->_numKey)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = a3;
  v8 = a4;
  if (a4 >= 4)
  {
    v8 = a4;
    v7 = a3;
    do
    {
      v8 = 67503105 * v8 + 16974593 * *v7 + 66049 * v7[1] + 257 * v7[2] + v7[3];
      v7 += 4;
    }
    while (v7 < &a3[a4 & 0xFFFFFFFC]);
  }
  while (v7 < &a3[a4])
  {
    v9 = *v7++;
    v8 = 257 * v8 + v9;
  }
  if (!self)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0;
  v11 = (v8 << a4) + v8;
  M = self->_M;
  v13 = 2 * a4;
  while (1)
  {
    seeds = v5->_seeds;
    factor = v5->_factor;
    v16 = *seeds - 559038733;
    HIDWORD(v17) = v16;
    LODWORD(v17) = v16;
    LODWORD(seeds) = ((v16 + seeds[1]) ^ v16) - (v17 >> 18);
    HIDWORD(v17) = (_DWORD)seeds;
    LODWORD(v17) = (_DWORD)seeds;
    v18 = (seeds ^ (v11 + v16)) - (v17 >> 21);
    HIDWORD(v17) = v18;
    LODWORD(v17) = v18;
    v19 = (v18 ^ v16) - (v17 >> 7);
    HIDWORD(v17) = v19;
    LODWORD(v17) = v19;
    LODWORD(seeds) = (v19 ^ seeds) - (v17 >> 16);
    HIDWORD(v17) = (_DWORD)seeds;
    LODWORD(v17) = (_DWORD)seeds;
    HIDWORD(v17) = (seeds ^ v18) - (v17 >> 28);
    LODWORD(v17) = HIDWORD(v17);
    HIDWORD(v17) = (HIDWORD(v17) ^ v19) - (v17 >> 18);
    LODWORD(v17) = HIDWORD(v17);
    v20 = 2 * (((HIDWORD(v17) ^ seeds) - (v17 >> 8)) % factor);
    v21 = HIDWORD(v17) % factor;
    v22 = (2 * (HIDWORD(v17) % factor)) | 1;
    v29[0] = v20;
    v29[1] = v22;
    if (v20 >= M || v22 >= M)
      goto LABEL_33;
    v24 = v29[((v5->_g[(unint64_t)(2 * v21) >> 3] >> (v22 & 7)) ^ (v5->_g[v20 >> 3] >> (v20 & 6))) & 1];
    if (v24 >= M)
      goto LABEL_33;
    select = v5->_select;
    if (select == 2)
    {
      v26 = *((unsigned int *)v5->_rankTable + v24);
    }
    else if (select == 1)
    {
      v26 = *((unsigned __int16 *)v5->_rankTable + v24);
    }
    else
    {
      if (v5->_select)
        goto LABEL_33;
      v26 = *((unsigned __int8 *)v5->_rankTable + v24);
    }
    if (v26 >= v5->_numKey)
      goto LABEL_33;
    if ((_DWORD)keyLen == 3)
    {
      v27 = v5->_keys3[v26];
      if (v27)
        goto LABEL_31;
      goto LABEL_33;
    }
    if ((_DWORD)keyLen != 2)
      break;
    v27 = v5->_keys2[v26];
    if (v27)
      goto LABEL_31;
LABEL_33:
    v10 += v5->_numKey;
    v5 = v5->_subSharedKeySet;
    if (!v5)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((_DWORD)keyLen != 1)
    goto LABEL_33;
  v27 = v5->_keys1[v26];
  if (!v27)
    goto LABEL_33;
LABEL_31:
  if (v27 != a3 && memcmp(a3, v27, v13))
    goto LABEL_33;
  return v26 + v10;
}

- (unint64_t)indexForBytes:(char *)a3 length:(unint64_t)a4
{
  _NSSharedKeySetS *v4;
  char *v7;
  unsigned __int8 *v8;
  int v9;
  char *v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int *seeds;
  unsigned int factor;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  int select;
  unint64_t v24;
  unint64_t numKey;
  unsigned __int8 (*ckeys)[3];
  char *v27;
  _DWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_keyLen != a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = self;
  if (!self->_numKey)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = a3;
  v8 = (unsigned __int8 *)a3;
  v9 = a4;
  if (a4 >= 4)
  {
    v7 = a3;
    v9 = a4;
    v8 = (unsigned __int8 *)a3;
    do
    {
      v9 = 67503105 * v9 + 16974593 * *v8 + 66049 * v8[1] + (v8[2] | (v8[2] << 8)) + v8[3];
      v8 += 4;
      v7 += 4;
    }
    while (v8 < (unsigned __int8 *)&a3[a4 & 0xFFFFFFFC]);
  }
  if (v8 < (unsigned __int8 *)&a3[a4])
  {
    v10 = (char *)(&a3[a4] - v7);
    do
    {
      v11 = *v8++;
      v9 = 257 * v9 + v11;
      --v10;
    }
    while (v10);
  }
  if (!self)
    return 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0;
  v13 = (v9 << a4) + v9;
  while (1)
  {
    seeds = v4->_seeds;
    factor = v4->_factor;
    v16 = *seeds - 559038733;
    HIDWORD(v17) = v16;
    LODWORD(v17) = v16;
    LODWORD(seeds) = ((v16 + seeds[1]) ^ v16) - (v17 >> 18);
    HIDWORD(v17) = (_DWORD)seeds;
    LODWORD(v17) = (_DWORD)seeds;
    v18 = (seeds ^ (v13 + v16)) - (v17 >> 21);
    HIDWORD(v17) = v18;
    LODWORD(v17) = v18;
    v19 = (v18 ^ v16) - (v17 >> 7);
    HIDWORD(v17) = v19;
    LODWORD(v17) = v19;
    LODWORD(seeds) = (v19 ^ seeds) - (v17 >> 16);
    HIDWORD(v17) = (_DWORD)seeds;
    LODWORD(v17) = (_DWORD)seeds;
    HIDWORD(v17) = (seeds ^ v18) - (v17 >> 28);
    LODWORD(v17) = HIDWORD(v17);
    HIDWORD(v17) = (HIDWORD(v17) ^ v19) - (v17 >> 18);
    LODWORD(v17) = HIDWORD(v17);
    v20 = 2 * (((HIDWORD(v17) ^ seeds) - (v17 >> 8)) % factor);
    v21 = HIDWORD(v17) % factor;
    v29[0] = v20;
    v29[1] = (2 * v21) | 1;
    v22 = v29[((v4->_g[(unint64_t)(2 * v21) >> 3] >> ((2 * v21) & 6 | 1)) ^ (v4->_g[v20 >> 3] >> (v20 & 6))) & 1];
    select = v4->_select;
    if (!v4->_select)
    {
      v24 = *((unsigned __int8 *)v4->_rankTable + v22);
      goto LABEL_17;
    }
    if (select == 1)
      break;
    if (select == 2)
    {
      v24 = *((unsigned int *)v4->_rankTable + v22);
      goto LABEL_17;
    }
    LODWORD(numKey) = v4->_numKey;
LABEL_23:
    v12 += numKey;
    v4 = v4->_subSharedKeySet;
    if (!v4)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v24 = *((unsigned __int16 *)v4->_rankTable + v22);
LABEL_17:
  numKey = v4->_numKey;
  if (v24 >= numKey)
    goto LABEL_23;
  ckeys = v4->_ckeys;
  if (!ckeys)
    goto LABEL_23;
  v27 = (char *)ckeys[v24];
  if (v27 != a3)
  {
    if (memcmp(a3, v27, a4))
      goto LABEL_23;
  }
  return v24 + v12;
}

- (unint64_t)hash
{
  unsigned int v2;
  _NSSharedKeySetS *v3;
  size_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  if (self)
  {
    v3 = self;
    do
    {
      v2 += v3->_numKey;
      v3 = v3->_subSharedKeySet;
    }
    while (v3);
  }
  v4 = v2;
  v5 = (void *)-[_NSSharedKeySetS allKeys](self);
  v6 = malloc_type_calloc(v2, 8uLL, 0x100004000313F17uLL);
  bzero(v6, 8 * v2);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        *((_QWORD *)v6 + (v9 + i)) = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "hash");
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      v9 += i;
    }
    while (v8);
  }
  qsort(v6, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_hash_compare);
  if ((_DWORD)v4)
  {
    v12 = 1;
    v13 = (uint64_t *)v6;
    v14 = v4;
    do
    {
      v15 = *v13++;
      v12 = v15 - v12 + 32 * v12;
      --v14;
    }
    while (v14);
    v16 = 31 * v12;
  }
  else
  {
    v16 = 31;
  }
  free(v6);
  return v16 + v4;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  _NSSharedKeySetS *v6;
  int v7;
  _DWORD *v8;
  int v10;
  _NSSharedKeySetS *v11;
  _QWORD *v12;
  int v13;
  _NSSharedKeySetS *v14;
  _NSSharedKeySetS *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  size_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  const void *v34;
  const void *v35;
  BOOL v36;
  BOOL v37;
  unsigned int v39;
  int v40;
  id obj;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (self == a3)
  {
    LOBYTE(v21) = 1;
    return (char)v21;
  }
  if (!a3)
    goto LABEL_51;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_51;
  v5 = 0;
  if (self)
  {
    v6 = self;
    do
    {
      v5 += v6->_numKey;
      v6 = v6->_subSharedKeySet;
    }
    while (v6);
  }
  v7 = 0;
  v8 = a3;
  do
  {
    v7 += v8[12];
    v8 = (_DWORD *)*((_QWORD *)v8 + 12);
  }
  while (v8);
  if (self)
  {
    if (self->_keyLen != *((_DWORD *)a3 + 26) || v5 != v7)
      goto LABEL_51;
    v10 = 0;
    v11 = self;
    do
    {
      ++v10;
      v11 = v11->_subSharedKeySet;
    }
    while (v11);
  }
  else
  {
    v10 = 0;
    LOBYTE(v21) = 0;
    if (*((_DWORD *)a3 + 26))
      v37 = 0;
    else
      v37 = v5 == v7;
    if (!v37)
      return (char)v21;
  }
  v12 = a3;
  do
  {
    v12 = (_QWORD *)v12[12];
    --v10;
  }
  while (v12);
  if (v10)
    goto LABEL_51;
  if (self)
  {
    v13 = 0;
    v14 = self;
    do
    {
      v13 += v14->_numKey;
      v14 = v14->_subSharedKeySet;
    }
    while (v14);
    v15 = self;
    do
    {
      LODWORD(v14) = v15->_numKey + (_DWORD)v14;
      v15 = v15->_subSharedKeySet;
    }
    while (v15);
    if (v13 != (_DWORD)v14)
      goto LABEL_51;
    v16 = v13 - 1;
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)-[_NSSharedKeySetS allKeys](self);
  v18 = (void *)-[_NSSharedKeySetS allKeys](a3);
  v19 = objc_msgSend(v17, "count");
  if (v19 != objc_msgSend(v18, "count"))
  {
LABEL_51:
    LOBYTE(v21) = 0;
    return (char)v21;
  }
  v20 = 2 * self->_keyLen;
  v21 = malloc_type_malloc(v20, 0xBFC4D599uLL);
  if (v21)
  {
    v22 = v21;
    obj = v18;
    v39 = v16;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v49;
LABEL_31:
      v27 = 0;
      v40 = v25 + v24;
      while (1)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v27), "getBytes:length:", v22, v20);
        if (objc_msgSend(a3, "indexForKey:length:", v22, self->_keyLen) == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_50;
        if (v24 == ++v27)
        {
          v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
          v25 = v40;
          if (v24)
            goto LABEL_31;
          goto LABEL_40;
        }
      }
    }
    v25 = 0;
LABEL_40:
    if (v25 != v5)
      goto LABEL_50;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = *(_QWORD *)v44;
LABEL_43:
      v32 = 0;
      v30 += v29;
      while (1)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v32), "getBytes:length:", v22, v20);
        if (-[_NSSharedKeySetS indexForKey:length:](self, "indexForKey:length:", v22, self->_keyLen) == 0x7FFFFFFFFFFFFFFFLL)
          break;
        if (v29 == ++v32)
        {
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
          if (v29)
            goto LABEL_43;
          goto LABEL_54;
        }
      }
LABEL_50:
      free(v22);
      goto LABEL_51;
    }
    v30 = 0;
LABEL_54:
    free(v22);
    if (v30 != v5)
      goto LABEL_51;
    v33 = 0;
    do
    {
      v34 = (const void *)-[_NSSharedKeySetS keyAtIndex:]((uint64_t)a3, v33);
      v35 = (const void *)-[_NSSharedKeySetS keyAtIndex:]((uint64_t)self, -[_NSSharedKeySetS indexForKey:length:](self, "indexForKey:length:", v34, self->_keyLen));
      if (v34 && v35)
      {
        if (memcmp(v34, v35, v20))
          goto LABEL_51;
      }
      else if ((v34 != 0) != (v35 != 0))
      {
        goto LABEL_51;
      }
      ++v33;
    }
    while (v33 <= v39);
    v36 = -[_NSSharedKeySetS isEmpty](self, "isEmpty");
    LOBYTE(v21) = v36 ^ objc_msgSend(a3, "isEmpty") ^ 1;
  }
  return (char)v21;
}

- (void)dealloc
{
  void *rankTable;
  char *g;
  unsigned int *seeds;
  void *ckeys;
  _QWORD *p_ckeys;
  unsigned int keyLen;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  rankTable = self->_rankTable;
  if (rankTable)
    free(rankTable);
  g = self->_g;
  if (g)
    free(g);
  seeds = self->_seeds;
  if (seeds)
    free(seeds);
  self->_rankTable = 0;
  self->_g = 0;
  if (self->_type)
  {
    p_ckeys = &self->_ckeys;
    ckeys = self->_ckeys;
    if (ckeys)
      goto LABEL_9;
  }
  else
  {
    keyLen = self->_keyLen;
    if (keyLen == 3)
    {
      p_ckeys = &self->_keys3;
      ckeys = self->_keys3;
      if (!ckeys)
        goto LABEL_10;
      goto LABEL_9;
    }
    if (keyLen == 2)
    {
      p_ckeys = &self->_keys2;
      ckeys = self->_keys2;
      if (!ckeys)
        goto LABEL_10;
      goto LABEL_9;
    }
    if (keyLen != 1)
      goto LABEL_11;
    p_ckeys = &self->_keys1;
    ckeys = self->_keys1;
    if (ckeys)
LABEL_9:
      free(ckeys);
  }
LABEL_10:
  *p_ckeys = 0;
LABEL_11:

  v9.receiver = self;
  v9.super_class = (Class)_NSSharedKeySetS;
  -[_NSSharedKeySetS dealloc](&v9, sel_dealloc);
}

@end
