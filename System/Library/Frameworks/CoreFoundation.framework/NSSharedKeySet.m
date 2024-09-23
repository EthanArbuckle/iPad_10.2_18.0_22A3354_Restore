@implementation NSSharedKeySet

- (unint64_t)indexForKey:(id)a3
{
  NSSharedKeySet *v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t numKey;
  unsigned int *seeds;
  unsigned int factor;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int M;
  uint64_t v26;
  int select;
  unint64_t v28;
  id v29;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_numKey)
  {
    v4 = self;
    v5 = objc_msgSend(a3, "hash");
    v6 = v5;
    v7 = 0;
    v8 = HIDWORD(v5);
    do
    {
      numKey = v4->_numKey;
      if (!(_DWORD)numKey)
        goto LABEL_24;
      seeds = v4->_seeds;
      factor = v4->_factor;
      if (v4->_algorithmType == 1)
      {
        v15 = *seeds - 559038729;
        v14 = v15 + seeds[1];
        v13 = v15 + v8;
      }
      else
      {
        if (v4->_algorithmType)
          __break(1u);
        v12 = seeds[1];
        v13 = *seeds - 559038733;
        v14 = v13 + v12;
        v15 = v13;
      }
      HIDWORD(v16) = v13;
      LODWORD(v16) = v13;
      v17 = (v14 ^ v13) - (v16 >> 18);
      HIDWORD(v16) = v17;
      LODWORD(v16) = v17;
      v18 = ((v15 + v6) ^ v17) - (v16 >> 21);
      HIDWORD(v16) = v18;
      LODWORD(v16) = v18;
      v19 = (v18 ^ v13) - (v16 >> 7);
      HIDWORD(v16) = v19;
      LODWORD(v16) = v19;
      v20 = (v19 ^ v17) - (v16 >> 16);
      HIDWORD(v16) = v20;
      LODWORD(v16) = v20;
      HIDWORD(v16) = (v20 ^ v18) - (v16 >> 28);
      LODWORD(v16) = HIDWORD(v16);
      HIDWORD(v16) = (HIDWORD(v16) ^ v19) - (v16 >> 18);
      LODWORD(v16) = HIDWORD(v16);
      v21 = 2 * (((HIDWORD(v16) ^ v20) - (v16 >> 8)) % factor);
      v22 = HIDWORD(v16) % factor;
      v23 = (2 * (HIDWORD(v16) % factor)) | 1;
      v31 = __PAIR64__(v23, v21);
      M = v4->_M;
      if (v21 >= M || v23 >= M)
        goto LABEL_24;
      v26 = *((unsigned int *)&v31
            + (((v4->_g[(unint64_t)(2 * v22) >> 3] >> (v23 & 7)) ^ (v4->_g[v21 >> 3] >> (v21 & 6))) & 1));
      if (v26 >= M)
        goto LABEL_24;
      select = v4->_select;
      if (select == 2)
      {
        v28 = *((unsigned int *)v4->_rankTable + v26);
      }
      else if (select == 1)
      {
        v28 = *((unsigned __int16 *)v4->_rankTable + v26);
      }
      else
      {
        if (v4->_select)
          goto LABEL_24;
        v28 = *((unsigned __int8 *)v4->_rankTable + v26);
      }
      if (v28 < numKey)
      {
        v29 = v4->_keys[v28];
        if (v29)
        {
          if (v29 == a3 || (objc_msgSend(a3, "isEqual:", v31, v32) & 1) != 0)
            return v28 + v7;
          LODWORD(numKey) = v4->_numKey;
        }
      }
LABEL_24:
      v7 += numKey;
      v4 = v4->_subSharedKeySet;
    }
    while (v4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v9;
  unint64_t var0;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v9 = -[NSSharedKeySet count](self, "count");
  var0 = a3->var0;
  if (a3->var0 == v9)
    return 0;
  v11 = 0;
  if (a5)
  {
    v12 = v9;
    if (var0 < v9)
    {
      v11 = 0;
      do
      {
        v13 = var0 + v11;
        a4[v11] = -[NSSharedKeySet keyAtIndex:](self, "keyAtIndex:", var0 + v11);
        ++v11;
      }
      while (v11 < a5 && v13 + 1 < v12);
      var0 += v11;
    }
  }
  a3->var0 = var0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_8;
  return v11;
}

- (id)keyAtIndex:(unint64_t)a3
{
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || *((_DWORD *)self + 10) == 0 || self == 0)
    return 0;
  while (1)
  {
    v5 = *((unsigned int *)self + 10);
    v6 = a3 >= v5;
    v7 = a3 - v5;
    if (!v6)
      break;
    self = (id)*((_QWORD *)self + 8);
    a3 = v7;
    if (!self)
      return self;
  }
  return *(id *)(*((_QWORD *)self + 7) + 8 * a3);
}

- (unint64_t)count
{
  unint64_t i;

  for (i = 0; self; self = self->_subSharedKeySet)
    i += self->_numKey;
  return i;
}

- (void)dealloc
{
  void *rankTable;
  char *g;
  unsigned int *seeds;
  id *keys;
  uint64_t numKey;
  uint64_t v8;
  uint64_t v9;
  NSSharedKeySet *subSharedKeySet;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  rankTable = self->_rankTable;
  if (rankTable)
    free(rankTable);
  g = self->_g;
  if (g)
    free(g);
  seeds = self->_seeds;
  if (seeds)
    free(seeds);
  keys = self->_keys;
  if (keys)
  {
    numKey = self->_numKey;
    if ((_DWORD)numKey)
    {
      v8 = 8 * numKey - 8;
      do
      {
        v9 = *(uint64_t *)((char *)self->_keys + v8);
        if (v9 >= 1)

        v8 -= 8;
      }
      while (v8 != -8);
      keys = self->_keys;
    }
    free(keys);
  }
  subSharedKeySet = self->_subSharedKeySet;
  if ((uint64_t)subSharedKeySet >= 1)

  v11.receiver = self;
  v11.super_class = (Class)NSSharedKeySet;
  -[NSSharedKeySet dealloc](&v11, sel_dealloc);
}

+ (NSSharedKeySet)keySetWithKeys:(id)a3
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  NSSharedKeySet *v13;
  uint64_t v15;
  NSException *v16;
  CFStringRef v17;
  NSException *v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v19 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: keys cannot be nil"), v19);
    goto LABEL_12;
  }
  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    v15 = __CFExceptionProem((objc_class *)a1, a2);
    v20 = objc_opt_class();
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: keys must be a kind of NSArray instead of '%@'"), v15, v20);
LABEL_12:
    v16 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v16);
  }
  v6 = objc_msgSend(a3, "count");
  v8 = v6;
  if (v6 >> 60)
  {
    v17 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v18 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v17, 0);
    CFRelease(v17);
    objc_exception_throw(v18);
  }
  if (v6 <= 1)
    v6 = 1;
  v9 = MEMORY[0x1E0C80A78](v6, v7);
  v11 = (char *)&v21 - v10;
  v21 = 0;
  if (v8 >= 0x101)
  {
    v11 = (char *)_CFCreateArrayStorage(v9, 0, &v21);
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(a3, "getObjects:range:", v11, 0, v8, v21, v22);
  v13 = (NSSharedKeySet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKeys:count:", v11, v8);
  free(v12);
  return v13;
}

- (NSSharedKeySet)initWithKeys:(id *)a3 count:(unint64_t)a4
{
  NSSharedKeySet *v6;
  uint64_t v7;
  NSSharedKeySet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  NSSet *v17;
  size_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unsigned int v29;
  uint64_t v30;
  size_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  char v45;
  int v46;
  double v47;
  unint64_t v48;
  unsigned int v49;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  char v55;
  char v56;
  __NSSKGraph *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int *seeds;
  int v62;
  unint64_t v63;
  int v64;
  int v65;
  edge **v66;
  uint64_t v67;
  void *v68;
  edge *v69;
  unint64_t var2;
  char v71;
  unint64_t M;
  int select;
  _BYTE *v74;
  void *v75;
  uint64_t v76;
  char v77;
  _DWORD *v78;
  uint64_t v79;
  int v80;
  _WORD *v81;
  uint64_t v82;
  __int16 v83;
  unsigned int v84;
  uint64_t v85;
  char *v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  char v90;
  unint64_t v91;
  unsigned int v92;
  char v93;
  uint64_t v94;
  NSSharedKeySet *result;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  unsigned int *v99;
  unsigned int factor;
  unsigned int *rankTable;
  char *g;
  int v103;
  uint64_t v104;
  unsigned int v105;
  int v106;
  int v107;
  int v108;
  unint64_t v109;
  int v110;
  int v111;
  int v112;
  int v113;
  unint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  CFStringRef v120;
  NSException *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id *v128;
  id *v129;
  uint64_t *v130;
  size_t v131;
  size_t v132;
  objc_super v133;
  _BYTE v134[128];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _DWORD v139[2];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v133.receiver = self;
  v133.super_class = (Class)NSSharedKeySet;
  v6 = -[NSSharedKeySet init](&v133, sel_init);
  v8 = v6;
  if (!v6)
    return v8;
  if (!a4)
  {
    v6->_numKey = 0;
    return v8;
  }
  if (a4 >> 60)
  {
    v120 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), a4);
    v121 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v120, 0);
    CFRelease(v120);
    objc_exception_throw(v121);
  }
  v9 = MEMORY[0x1E0C80A78](v6, v7);
  v129 = (id *)((char *)&v123 - v11);
  v132 = 0;
  v126 = v12;
  if (a4 > 0x100)
  {
    v128 = (id *)_CFCreateArrayStorage(a4, 0, &v132);
    MEMORY[0x1E0C80A78](v128, v15);
    v13 = (char *)&v122;
    v131 = 0;
    v14 = (char *)_CFCreateArrayStorage(a4, 0, &v131);
    v129 = v128;
  }
  else
  {
    MEMORY[0x1E0C80A78](v9, v10);
    v13 = (char *)&v123 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
    v128 = 0;
    v14 = 0;
    v131 = 0;
  }
  v127 = v14;
  if (a4 >= 0x101)
    v16 = v14;
  else
    v16 = v13;
  v130 = (uint64_t *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (a4 < 2)
  {
    *v129 = *a3;
    v39 = objc_msgSend(*a3, "hash");
    v27 = 0;
    *v130 = v39;
    v31 = 1;
  }
  else
  {
    v17 = -[NSSet initWithObjects:count:]([NSSet alloc], "initWithObjects:count:", a3, a4);
    v18 = -[NSSet count](v17, "count");
    v19 = v16;
    v20 = (uint64_t *)malloc_type_malloc(16 * v18, 0x1080040FC6463CFuLL);
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v21 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v135, v134, 16);
    if (v21)
    {
      v22 = 0;
      v23 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v136 != v23)
            objc_enumerationMutation(v17);
          v25 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          v26 = (v22 + i);
          v20[2 * v26] = (uint64_t)v25;
          v20[2 * v26 + 1] = objc_msgSend(v25, "hash");
        }
        v21 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v135, v134, 16);
        v22 += i;
      }
      while (v21);
    }

    qsort(v20, v18, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareHashesAscending);
    *v129 = (id)*v20;
    *v130 = v20[1];
    v16 = v19;
    v27 = 0;
    if (v18 < 2)
    {
      v31 = 1;
    }
    else
    {
      v28 = v20 + 1;
      v29 = 2;
      v30 = 1;
      v31 = 1;
      do
      {
        v32 = &v20[2 * v30];
        v35 = v32[1];
        v33 = v32 + 1;
        v34 = v35;
        v36 = *v28;
        v28 += 2;
        v37 = (void *)v20[2 * v30];
        if (v34 == v36)
        {
          *(_QWORD *)&v19[8 * v27++] = v37;
        }
        else
        {
          v129[v31] = v37;
          v130[v31++] = *v33;
        }
        v30 = v29;
        v38 = v18 > v29++;
      }
      while (v38);
    }
    free(v20);
  }
  v8->_numKey = v31;
  v8->_algorithmType = 1;
  v40 = vcvtpd_u64_f64((double)v31 * 2.125) >> 1;
  v41 = (v40 + 1) | 1;
  if (v40 - 3 > 0xFFFFFFFD)
  {
LABEL_39:
    v44 = v41;
  }
  else
  {
    do
    {
      if (-1431655765 * v41 >= 0x55555556)
      {
        if (v41 < 0x19)
          goto LABEL_39;
        v42 = 11;
        while (v41 % (v42 - 6) && v41 % (v42 - 4))
        {
          v43 = v42 * v42;
          v42 += 6;
          if (v43 > v41)
            goto LABEL_39;
        }
      }
      v44 = v41 + 2;
      v38 = v41 > 1;
      v41 += 2;
    }
    while (v38);
  }
  v8->_M = 2 * v44;
  v8->_factor = v44;
  v124 = v16;
  v125 = v27;
  if (2 * v44 > 0xFE)
  {
    if (2 * v44 > 0xFFFE)
      v45 = 2;
    else
      v45 = 1;
    v8->_select = v45;
  }
  else
  {
    v8->_select = 0;
  }
  v46 = 0;
  v8->_seeds = (unsigned int *)malloc_type_calloc(2uLL, 4uLL, 0x100004052888210uLL);
  v47 = 2.125;
  while (1)
  {
    arc4random_buf(v8->_seeds, 4uLL);
    arc4random_buf(v8->_seeds + 1, 4uLL);
    if (v46)
    {
      v47 = v47 + 0.125;
      LODWORD(v48) = v8->_numKey;
      v49 = vcvtpd_u64_f64(v47 * (double)v48) >> 1;
      v50 = (v49 + 1) | 1;
      if (v49 - 3 > 0xFFFFFFFD)
      {
LABEL_58:
        v53 = v50;
      }
      else
      {
        do
        {
          if (-1431655765 * v50 >= 0x55555556)
          {
            if (v50 < 0x19)
              goto LABEL_58;
            v51 = 11;
            while (v50 % (v51 - 6) && v50 % (v51 - 4))
            {
              v52 = v51 * v51;
              v51 += 6;
              if (v52 > v50)
                goto LABEL_58;
            }
          }
          v53 = v50 + 2;
          v38 = v50 > 1;
          v50 += 2;
        }
        while (v38);
      }
      v54 = 2 * v53;
      v8->_M = 2 * v53;
      v8->_factor = v53;
      if (2 * v53 < 0xFFFF)
        v55 = 1;
      else
        v55 = 2;
      if (v54 >= 0xFF)
        v56 = v55;
      else
        v56 = 0;
      v8->_select = v56;
    }
    v57 = -[__NSSKGraph initWithNumberOfVertices:numberOfEdges:]([__NSSKGraph alloc], "initWithNumberOfVertices:numberOfEdges:", v8->_M, v31);
    v58 = v130;
    v59 = v31;
    if ((_DWORD)v31)
    {
      do
      {
        v60 = *v58++;
        seeds = v8->_seeds;
        v62 = *seeds - 559038729;
        HIDWORD(v63) = v62 + HIDWORD(v60);
        LODWORD(v63) = v62 + HIDWORD(v60);
        LODWORD(seeds) = ((v62 + seeds[1]) ^ (v62 + HIDWORD(v60))) - (v63 >> 18);
        HIDWORD(v63) = (_DWORD)seeds;
        LODWORD(v63) = (_DWORD)seeds;
        v64 = (seeds ^ (v62 + v60)) - (v63 >> 21);
        HIDWORD(v63) = v64;
        LODWORD(v63) = v64;
        HIDWORD(v63) = (v64 ^ (v62 + HIDWORD(v60))) - (v63 >> 7);
        v65 = HIDWORD(v63);
        LODWORD(v63) = HIDWORD(v63);
        LODWORD(seeds) = (HIDWORD(v63) ^ seeds) - (v63 >> 16);
        HIDWORD(v63) = (_DWORD)seeds;
        LODWORD(v63) = (_DWORD)seeds;
        HIDWORD(v63) = (seeds ^ v64) - (v63 >> 28);
        LODWORD(v63) = HIDWORD(v63);
        HIDWORD(v63) = (HIDWORD(v63) ^ v65) - (v63 >> 18);
        LODWORD(v63) = HIDWORD(v63);
        -[__NSSKGraph addEdgeWithH1:withH2:](v57, "addEdgeWithH1:withH2:", 2 * (((HIDWORD(v63) ^ seeds) - (v63 >> 8)) % v8->_factor), (2 * (HIDWORD(v63) % v8->_factor)) | 1);
        --v59;
      }
      while (v59);
    }
    v66 = -[__NSSKGraph isAcyclic](v57, "isAcyclic");
    if (-[__NSSKGraph isEmpty](v57, "isEmpty"))
      break;
    free(v66);

    if (++v46 == 1000)
    {
      v57 = 0;
      goto LABEL_86;
    }
  }
  if (!v66)
  {
LABEL_86:

    v8 = 0;
    v57 = 0;
LABEL_134:

    free(v130);
    free(v127);
    free(v128);
    return v8;
  }
  v67 = -[__NSSKGraph numOfEdges](v57, "numOfEdges");
  v68 = malloc_type_calloc(v8->_M, 1uLL, 0x100004077774924uLL);
  memset(v68, 2, v8->_M);
  for (; v67; --v67)
  {
    v69 = v66[v67 - 1];
    var2 = v69->var2;
    if (v69->var1[0] == (_DWORD)var2)
      v71 = *((_BYTE *)v68 + LODWORD(v69->var1[1]));
    else
      v71 = 1 - *((_BYTE *)v68 + v69->var1[0]);
    *((_BYTE *)v68 + var2) = v71 & 1;
  }
  v8->_g = (char *)v68;
  M = v8->_M;
  select = v8->_select;
  if (select == 2)
  {
    v78 = malloc_type_calloc(v8->_M, 4uLL, 0x100004052888210uLL);
    v75 = v78;
    if (!(_DWORD)M)
      goto LABEL_105;
    v79 = 0;
    v80 = 0;
    do
    {
      v78[v79] = v80;
      if (*((_BYTE *)v68 + v79) != 2)
        ++v80;
      ++v79;
    }
    while (M != v79);
  }
  else if (select == 1)
  {
    v81 = malloc_type_calloc(v8->_M, 2uLL, 0x1000040BDFB0063uLL);
    v75 = v81;
    if (!(_DWORD)M)
      goto LABEL_105;
    v82 = 0;
    v83 = 0;
    do
    {
      v81[v82] = v83;
      if (*((_BYTE *)v68 + v82) != 2)
        ++v83;
      ++v82;
    }
    while (M != v82);
  }
  else if (v8->_select)
  {
    v75 = 0;
  }
  else
  {
    v74 = malloc_type_calloc(v8->_M, 1uLL, 0x100004077774924uLL);
    v75 = v74;
    if (!(_DWORD)M)
      goto LABEL_105;
    v76 = 0;
    v77 = 0;
    do
    {
      v74[v76] = v77;
      if (*((_BYTE *)v68 + v76) != 2)
        ++v77;
      ++v76;
    }
    while (M != v76);
  }
  if ((_DWORD)M)
  {
    v84 = M - 1;
    do
    {
      v85 = v84;
      if (*((_BYTE *)v68 + v84) == 2)
        *((_BYTE *)v68 + v84) = 0;
      --v84;
    }
    while (v85);
  }
LABEL_105:
  v86 = (char *)malloc_type_calloc((M >> 3) + 1, 1uLL, 0x100004077774924uLL);
  v87 = v86;
  if ((M & 0xFFFFFFF8) == 0)
  {
    LODWORD(v88) = 0;
    v92 = M - 2;
    v93 = *((_BYTE *)v68 + (M - 1)) != 0;
LABEL_113:
    v94 = v92;
    do
    {
      v93 = (*((_BYTE *)v68 + v94) != 0) | (2 * v93);
      if (!v94)
        break;
      --v92;
      --v94;
    }
    while (v92 >= v88);
    goto LABEL_116;
  }
  v88 = 0;
  v89 = 6;
  do
  {
    v90 = 2 * (*((_BYTE *)v68 + (v88 | 7)) != 0);
    v91 = v89;
    do
      v90 = 2 * (v90 | (*((_BYTE *)v68 + v91--) != 0));
    while (v91 >= (v88 | 1));
    v86[v88 >> 3] = v90 | (*((_BYTE *)v68 + v88) != 0);
    v88 += 8;
    v89 += 8;
  }
  while (v88 < (M & 0xFFFFFFF8));
  v92 = M - 2;
  v93 = *((_BYTE *)v68 + (M - 1)) != 0;
  if ((int)M - 2 >= v88)
    goto LABEL_113;
LABEL_116:
  v86[M >> 3] = v93;
  free(v68);
  v8->_g = v87;
  v8->_rankTable = v75;
  result = (NSSharedKeySet *)malloc_type_calloc(v31, 8uLL, 0x80040B8603338uLL);
  v8->_keys = (id *)&result->super.isa;
  v96 = v125;
  if (!v31)
  {
LABEL_129:
    if (v96)
    {
      v118 = objc_alloc((Class)objc_opt_class());
      v119 = objc_msgSend(v118, "initWithKeys:count:", v124, v96);
      if (v119)
      {
        v8->_subSharedKeySet = (NSSharedKeySet *)v119;
      }
      else
      {

        v8 = 0;
      }
    }
    free(v66);
    goto LABEL_134;
  }
  v97 = 0;
  v98 = 1;
  while (1)
  {
    v99 = v8->_seeds;
    factor = v8->_factor;
    rankTable = (unsigned int *)v8->_rankTable;
    g = v8->_g;
    v103 = v8->_select;
    v104 = v130[v97];
    if (v8->_algorithmType == 1)
    {
      v108 = *v99 - 559038729;
      v107 = v108 + v99[1];
      v106 = v108 + HIDWORD(v104);
    }
    else
    {
      if (v8->_algorithmType)
        break;
      v105 = v99[1];
      v106 = *v99 - 559038733;
      v107 = v106 + v105;
      v108 = v106;
    }
    HIDWORD(v109) = v106;
    LODWORD(v109) = v106;
    v110 = (v107 ^ v106) - (v109 >> 18);
    HIDWORD(v109) = v110;
    LODWORD(v109) = v110;
    v111 = ((v108 + v104) ^ v110) - (v109 >> 21);
    HIDWORD(v109) = v111;
    LODWORD(v109) = v111;
    v112 = (v111 ^ v106) - (v109 >> 7);
    HIDWORD(v109) = v112;
    LODWORD(v109) = v112;
    v113 = (v112 ^ v110) - (v109 >> 16);
    HIDWORD(v109) = v113;
    LODWORD(v109) = v113;
    HIDWORD(v109) = (v113 ^ v111) - (v109 >> 28);
    LODWORD(v109) = HIDWORD(v109);
    HIDWORD(v109) = (HIDWORD(v109) ^ v112) - (v109 >> 18);
    LODWORD(v109) = HIDWORD(v109);
    v114 = 2 * (((HIDWORD(v109) ^ v113) - (v109 >> 8)) % factor);
    v115 = HIDWORD(v109) % factor;
    v139[0] = v114;
    v139[1] = (2 * v115) | 1;
    v116 = v139[((g[(unint64_t)(2 * v115) >> 3] >> ((2 * v115) & 6 | 1)) ^ (g[v114 >> 3] >> (v114 & 6))) & 1];
    if (v103 == 2)
    {
      v117 = rankTable[v116];
      goto LABEL_128;
    }
    if (v103 == 1)
    {
      v117 = *((unsigned __int16 *)rankTable + v116);
      goto LABEL_128;
    }
    if (v103)
      break;
    v117 = *((unsigned __int8 *)rankTable + v116);
LABEL_128:
    result = (NSSharedKeySet *)objc_msgSend(v129[v97], "copyWithZone:", 0);
    v8->_keys[v117] = result;
    v97 = v98;
    v38 = v31 > v98++;
    if (!v38)
      goto LABEL_129;
  }
  __break(1u);
  return result;
}

- (BOOL)isEmpty
{
  return self->_numKey == 0;
}

- (NSSharedKeySet)init
{
  return -[NSSharedKeySet initWithKeys:count:](self, "initWithKeys:count:", 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int select;
  void *rankTable;
  uint64_t M;
  uint64_t v9;
  NSException *v10;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v9 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: this object can only be encoded by a keyed coder"), v9);
    v10 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v10);
  }
  objc_msgSend(a3, "encodeInt64:forKey:", self->_numKey, CFSTR("NS.numKey"));
  if (self->_numKey)
  {
    objc_msgSend(a3, "encodeInt32:forKey:", self->_select, CFSTR("NS.select"));
    objc_msgSend(a3, "encodeInt64:forKey:", self->_factor, CFSTR("NS.factor"));
    objc_msgSend(a3, "encodeInt64:forKey:", *self->_seeds, CFSTR("NS.seed0"));
    objc_msgSend(a3, "encodeInt64:forKey:", self->_seeds[1], CFSTR("NS.seed1"));
    objc_msgSend(a3, "encodeInt64:forKey:", self->_M, CFSTR("NS.M"));
    select = self->_select;
    if (select == 2)
    {
      rankTable = self->_rankTable;
      M = 4 * self->_M;
    }
    else if (select == 1)
    {
      rankTable = self->_rankTable;
      M = 2 * self->_M;
    }
    else
    {
      if (self->_select)
      {
LABEL_11:
        objc_msgSend(a3, "encodeBytes:length:forKey:", self->_g, ((unint64_t)self->_M >> 3) + 1, CFSTR("NS.g"));
        objc_msgSend(a3, "encodeObject:forKey:", self->_subSharedKeySet, CFSTR("NS.subskset"));
        objc_msgSend(a3, "encodeObject:forKey:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", self->_keys, self->_numKey), CFSTR("NS.keys"));
        objc_msgSend(a3, "encodeInteger:forKey:", self->_algorithmType & 1, CFSTR("NS.algorithmType"));
        return;
      }
      rankTable = self->_rankTable;
      M = self->_M;
    }
    objc_msgSend(a3, "encodeBytes:length:forKey:", rankTable, M, CFSTR("NS.rankTable"));
    goto LABEL_11;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSharedKeySet)initWithCoder:(id)a3
{
  char isKindOfClass;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id v23;
  Class v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t block;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  Class v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v31 = __CFExceptionProem((objc_class *)self, a2);
    v9 = CFSTR("%@: this object can only be decoded by a keyed coder");
    goto LABEL_8;
  }
  objc_getClass("NSKeyedUnarchiver");
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v7 = a3;
  else
    v7 = 0;
  v8 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.numKey"));
  if (v8 >= 0x7FFFFFFF)
  {
    v31 = __CFExceptionProem((objc_class *)self, a2);
    v9 = CFSTR("%@: extreme number of keys");
LABEL_8:
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v9, v31, v32, block, v34, v35, v36, v37);
    v10 = _CFAutoreleasePoolAddObject();

    objc_msgSend(a3, "failWithError:", __archiveIsCorrupt_0(v10));
    return 0;
  }
  v12 = v8;
  if (!(_DWORD)v8)
    return self;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = objc_opt_new();
    if (!v13)
    {
      v31 = __CFExceptionProem((objc_class *)self, a2);
      v9 = CFSTR("%@: unable to unarchive - memory failure");
      goto LABEL_8;
    }
    v14 = (void *)v13;
    objc_msgSend(a3, "replaceObject:withObject:", self, v13);
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.subskset"));
  if (v15)
  {
    v16 = objc_opt_class();
    if (v16 != objc_opt_class())
    {
      v17 = __CFExceptionProem((objc_class *)self, a2);
      v18 = objc_opt_class();
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unexpected shared key set class: %@"), v17, v18);
      v19 = _CFAutoreleasePoolAddObject();

      objc_msgSend(a3, "failWithError:", __archiveIsCorrupt_0(v19));
      goto LABEL_21;
    }
    self->_subSharedKeySet = (NSSharedKeySet *)v15;
    if (v15 >= 1)
      v23 = (id)v15;
LABEL_28:
    v22 = 1;
    if (!v14)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (!objc_msgSend(a3, "error"))
  {
    self->_subSharedKeySet = 0;
    goto LABEL_28;
  }
  v20 = __CFExceptionProem((objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: unable to unarchive - invalid class"), v20);
  v21 = _CFAutoreleasePoolAddObject();

  objc_msgSend(a3, "failWithError:", __archiveIsCorrupt_0(v21));
LABEL_21:
  v22 = 0;
  if (v14)
  {
LABEL_29:
    objc_msgSend(v7, "replaceObject:withObject:", v14, self);

  }
LABEL_30:
  if (!v22)
    return 0;
  v24 = objc_lookUpClass("NSArray");
  objc_lookUpClass("NSDictionary");
  block = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __32__NSSharedKeySet_initWithCoder___block_invoke;
  v36 = &unk_1E12E5C68;
  v37 = v24;
  if (initWithCoder__onceToken_0 != -1)
    dispatch_once(&initWithCoder__onceToken_0, &block);
  v25 = (void *)objc_msgSend(a3, "allowedClasses");
  v26 = (void *)objc_msgSend((id)objc_msgSend(v25, "setByAddingObjectsFromSet:", initWithCoder__oPlistClasses_0), "mutableCopy");
  objc_msgSend(v26, "removeObject:", objc_opt_class());
  v27 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v26, CFSTR("NS.keys"));

  if (!v27 && objc_msgSend(a3, "error"))
  {
    v31 = __CFExceptionProem((objc_class *)self, a2);
    v9 = CFSTR("%@: unable to unarchive - invalid class");
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = objc_opt_class();
    v9 = CFSTR("unexpected mutable keys (%@)");
    goto LABEL_8;
  }
  if ((_NSIsNSArray((uint64_t)v27) & 1) == 0)
  {
    v31 = objc_opt_class();
    v9 = CFSTR("unexpected keys (%@)");
    goto LABEL_8;
  }
  v28 = objc_msgSend(v27, "count");
  if (v28 != v12)
  {
    v31 = objc_msgSend(v27, "count");
    v32 = v12;
    v9 = CFSTR("key count mismatch %lu vs %u");
    goto LABEL_8;
  }
  v29 = v28 - 1;
  while (v29 != -1)
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", v29);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      --v29;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        continue;
    }
    v31 = objc_opt_class();
    v9 = CFSTR("unexpected recursive keys (%@)");
    goto LABEL_8;
  }
  v30 = +[NSArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v27);
  -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", -[NSSharedKeySet allKeys](self->_subSharedKeySet, "allKeys"));

  return +[NSSharedKeySet keySetWithKeys:](NSSharedKeySet, "keySetWithKeys:", v30);
}

id __32__NSSharedKeySet_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1;
  Class v2;
  Class v3;
  Class v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_lookUpClass("NSString");
  v3 = objc_lookUpClass("NSNumber");
  v4 = objc_lookUpClass("NSDate");
  initWithCoder__oPlistClasses_0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_lookUpClass("NSURL"), 0);
  return (id)initWithCoder__oPlistClasses_0;
}

- (unint64_t)maximumIndex
{
  return -[NSSharedKeySet count](self, "count") - 1;
}

- (id)allKeys
{
  NSSharedKeySet *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  id *v9;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  id v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  CFStringRef v18;
  NSException *v19;
  size_t v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_numKey)
    return +[NSArray array](NSArray, "array");
  v2 = self;
  v3 = -[NSSharedKeySet count](self, "count");
  if (v3 >> 60)
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v3);
    v19 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v18, 0);
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  if (v3 <= 1)
    v3 = 1;
  v5 = MEMORY[0x1E0C80A78](v3, v4);
  v7 = (char *)v20 - v6;
  v20[0] = 0;
  if (v8 >= 0x101)
  {
    v7 = (char *)_CFCreateArrayStorage(v5, 0, v20);
    v9 = (id *)v7;
  }
  else
  {
    v9 = 0;
  }
  LODWORD(v11) = 0;
  do
  {
    memmove(&v7[8 * v11], v2->_keys, 8 * v2->_numKey);
    v11 = (v2->_numKey + v11);
    v2 = v2->_subSharedKeySet;
  }
  while (v2);
  if (v9)
  {
    if ((_DWORD)v11)
    {
      v12 = v9;
      v13 = v11;
      do
      {
        v14 = *v12++;
        --v13;
      }
      while (v13);
    }
    v15 = [NSArray alloc];
    v16 = -[NSArray _initByAdoptingBuffer:count:size:](v15, "_initByAdoptingBuffer:count:size:", v9, v11, v11, v20[0]);
  }
  else
  {
    v17 = [NSArray alloc];
    v16 = -[NSArray initWithObjects:count:](v17, "initWithObjects:count:", v7, v11, v20[0]);
  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSSharedKeySet count](self, "count");
      if (v5 == objc_msgSend(a3, "count"))
      {
        v6 = -[NSSharedKeySet keySetCount](self, "keySetCount");
        if (v6 == objc_msgSend(a3, "keySetCount"))
        {
          v7 = -[NSSharedKeySet allKeys](self, "allKeys");
          v8 = (void *)objc_msgSend(a3, "allKeys");
          v9 = objc_msgSend(v7, "count");
          if (v9 == objc_msgSend(v8, "count"))
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
            if (v10)
            {
              v11 = v10;
              v12 = 0;
              v13 = *(_QWORD *)v32;
LABEL_9:
              v14 = 0;
              v12 += v11;
              while (1)
              {
                if (*(_QWORD *)v32 != v13)
                  objc_enumerationMutation(v7);
                if (objc_msgSend(a3, "indexForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14)) == 0x7FFFFFFFFFFFFFFFLL)
                  break;
                if (v11 == ++v14)
                {
                  v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
                  if (v11)
                    goto LABEL_9;
                  goto LABEL_18;
                }
              }
            }
            else
            {
              v12 = 0;
LABEL_18:
              if (v12 == v5)
              {
                v28 = 0u;
                v29 = 0u;
                v26 = 0u;
                v27 = 0u;
                v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = 0;
                  v19 = *(_QWORD *)v27;
LABEL_21:
                  v20 = 0;
                  v18 += v17;
                  while (1)
                  {
                    if (*(_QWORD *)v27 != v19)
                      objc_enumerationMutation(v8);
                    if (-[NSSharedKeySet indexForKey:](self, "indexForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20)) == 0x7FFFFFFFFFFFFFFFLL)break;
                    if (v17 == ++v20)
                    {
                      v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
                      if (v17)
                        goto LABEL_21;
                      goto LABEL_29;
                    }
                  }
                }
                else
                {
                  v18 = 0;
LABEL_29:
                  if (v18 == v5)
                  {
                    v21 = -[NSSharedKeySet maximumIndex](self, "maximumIndex");
                    if (v21 == objc_msgSend(a3, "maximumIndex"))
                    {
                      v22 = 0;
                      while (1)
                      {
                        v23 = (void *)objc_msgSend(a3, "keyAtIndex:", v22);
                        if ((objc_msgSend(v23, "isEqual:", -[NSSharedKeySet keyAtIndex:](self, "keyAtIndex:", -[NSSharedKeySet indexForKey:](self, "indexForKey:", v23))) & 1) == 0)break;
                        if (++v22 > v21)
                        {
                          v24 = -[NSSharedKeySet isEmpty](self, "isEmpty");
                          return v24 ^ objc_msgSend(a3, "isEmpty") ^ 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return 0;
}

- (unint64_t)keySetCount
{
  unint64_t i;

  for (i = 0; self; self = self->_subSharedKeySet)
    ++i;
  return i;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  id v5;
  int select;
  const __CFString *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  Class v18;
  uint64_t v20;
  int8x16_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[objc_class string](objc_lookUpClass("NSMutableString"), "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p>\n"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("  numKey = %u\n"), self->_numKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("  M = %u (should always be even)\n"), self->_M);
  objc_msgSend(v3, "appendFormat:", CFSTR("  factor = %u (should always be prime)\n"), self->_factor);
  objc_msgSend(v3, "appendFormat:", CFSTR("  keys = [\n"));
  if (self->_numKey)
  {
    v4 = 0;
    do
    {
      v5 = self->_keys[v4];
      objc_msgSend(v3, "appendFormat:", CFSTR("    <%@: %p>, 0x%lx\n"), objc_opt_class(), v5, objc_msgSend(v5, "hash"));
      ++v4;
    }
    while (v4 < self->_numKey);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("  ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  seeds[0] = 0x%xu\n"), *self->_seeds);
  objc_msgSend(v3, "appendFormat:", CFSTR("  seeds[1] = 0x%xu\n"), self->_seeds[1]);
  select = self->_select;
  if (self->_select)
  {
    if (select == 1)
    {
      v7 = CFSTR("unsigned short");
    }
    else
    {
      v7 = CFSTR("unknown");
      if (select == 2)
        v7 = CFSTR("unsigned int");
    }
  }
  else
  {
    v7 = CFSTR("unsigned char");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("  ranktable = %p (select = %u (%@)) [\n"), self->_rankTable, self->_select, v7);
  v8 = self->_select;
  if (self->_select)
  {
    if (v8 == 1)
    {
      if (self->_M)
      {
        v11 = 0;
        do
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("    %d - %u\n"), v11, *((unsigned __int16 *)self->_rankTable + v11));
          ++v11;
        }
        while (v11 < self->_M);
      }
    }
    else if (v8 == 2 && self->_M)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v3, "appendFormat:", CFSTR("    %d - %u\n"), v9, *((unsigned int *)self->_rankTable + v9));
        ++v9;
      }
      while (v9 < self->_M);
    }
  }
  else if (self->_M)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("    %d - %u\n"), v10, *((unsigned __int8 *)self->_rankTable + v10));
      ++v10;
    }
    while (v10 < self->_M);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("  ]\n"));
  if (self->_algorithmType)
    v12 = CFSTR("use_full_hash_64");
  else
    v12 = CFSTR("clamp_hash_to_32");
  objc_msgSend(v3, "appendFormat:", CFSTR("  algorithmType: %@\n"), v12);
  objc_msgSend(v3, "appendFormat:", CFSTR("  g = %p\n"), self->_g);
  objc_msgSend(v3, "appendFormat:", CFSTR("    packed bits (binary):\n      "));
  v13 = 0;
  do
  {
    v14 = (int8x16_t)vdupq_n_s32(self->_g[v13]);
    v15.i64[0] = 0x31003100310031;
    v15.i64[1] = 0x31003100310031;
    v16.i64[0] = 0x30003000300030;
    v16.i64[1] = 0x30003000300030;
    v21 = vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v14, (int8x16_t)xmmword_182DC88D0)), (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v14, (int8x16_t)xmmword_182DC88E0))), v16, v15);
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), -[objc_class stringWithCharacters:length:](objc_lookUpClass("NSString"), "stringWithCharacters:length:", &v21, 8));
  }
  while (v13++ < (unint64_t)self->_M >> 3);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  if (self->_subSharedKeySet)
  {
    v18 = objc_lookUpClass("NSMutableString");
    objc_msgSend(v3, "appendFormat:", CFSTR("  subSharedKeySet = %@\n"), -[objc_class stringWithFormat:](v18, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self->_subSharedKeySet));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("  subSharedKeySet = nil\n"), v20);
  }
  return v3;
}

- (char)g
{
  return self->_g;
}

- (void)setG:(char *)a3
{
  self->_g = a3;
}

- (unsigned)select
{
  return self->_select;
}

- (void)setSelect:(unsigned __int8)a3
{
  self->_select = a3;
}

- (void)rankTable
{
  return self->_rankTable;
}

- (void)setRankTable:(void *)a3
{
  self->_rankTable = a3;
}

- (unsigned)M
{
  return self->_M;
}

- (void)setM:(unsigned int)a3
{
  self->_M = a3;
}

- (unsigned)factor
{
  return self->_factor;
}

- (void)setFactor:(unsigned int)a3
{
  self->_factor = a3;
}

- (unsigned)numKey
{
  return self->_numKey;
}

- (void)setNumKey:(unsigned int)a3
{
  self->_numKey = a3;
}

- (unsigned)seeds
{
  return self->_seeds;
}

- (void)setSeeds:(unsigned int *)a3
{
  self->_seeds = a3;
}

- (id)keys
{
  return self->_keys;
}

- (void)setKeys:(id *)a3
{
  self->_keys = a3;
}

- (NSSharedKeySet)subSharedKeySet
{
  return (NSSharedKeySet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubSharedKeySet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
