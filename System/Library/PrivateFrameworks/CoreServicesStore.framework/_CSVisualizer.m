@implementation _CSVisualizer

- (_CSVisualizer)init
{
  abort();
}

- (_CSVisualizer)initWithStore:(__CSStore *)a3
{
  return -[_CSVisualizer initWithStore:useStandardTableFunctions:](self, "initWithStore:useStandardTableFunctions:", a3, 1);
}

- (_CSVisualizer)initWithStore:(__CSStore *)a3 useStandardTableFunctions:(BOOL)a4
{
  _BOOL4 v4;
  _CSVisualizer *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *functions;
  NSMutableDictionary *v9;
  NSMutableDictionary *userInfo;
  NSRecursiveLock *v11;
  NSRecursiveLock *lock;
  objc_super v14;

  v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CSVisualizer;
  v6 = -[_CSVisualizer init](&v14, sel_init);
  if (v6)
  {
    v6->_store = (__CSStore *)CFRetain(a3);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    functions = v6->_functions;
    v6->_functions = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v6->_userInfo;
    v6->_userInfo = v9;

    v11 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v6->_lock;
    v6->_lock = v11;

    if (v4)
      -[_CSVisualizer setStandardTableFunctions](v6, "setStandardTableFunctions");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_store);
  v3.receiver = self;
  v3.super_class = (Class)_CSVisualizer;
  -[_CSVisualizer dealloc](&v3, sel_dealloc);
}

- (id)functionsForTableNoCopy:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *functions;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  functions = self->_functions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](functions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (id)functionsForTable:(unsigned int)a3
{
  void *v3;
  void *v4;

  -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)setFunctions:(id)a3 forTable:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  NSMutableDictionary *functions;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v6 = (void *)objc_msgSend(v9, "copy");
  functions = self->_functions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](functions, "setObject:forKeyedSubscript:", v6, v8);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setStandardTableFunctions
{
  __CSStore *v3;
  __CSStore *v4;
  uint64_t v5;
  CSStore2 **v6;
  char *Table;
  uint64_t v8;
  _CSVisualizerTableFunctions *v9;
  char *v10;
  _CSVisualizerTableFunctions *v11;
  char *v12;
  _CSVisualizerTableFunctions *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = -[_CSVisualizer store](self, "store");
  v4 = v3;
  if (performConstantAssertions)
  {
    v5 = *((_QWORD *)v3 + 42);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  v6 = (CSStore2 **)((char *)v4 + 8);
  Table = (char *)*((_QWORD *)v4 + 34);
  v8 = MEMORY[0x1E0C809B0];
  if (Table || (Table = CSStore2::Store::getTable((CSStore2 **)v4 + 1, CFSTR("<array>"))) != 0)
  {
    v9 = objc_alloc_init(_CSVisualizerTableFunctions);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke;
    v17[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v17[4] = (char *)v4 + 8;
    -[_CSVisualizerTableFunctions setGetDescription:](v9, "setGetDescription:", v17);
    -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v9, (4 * *(_DWORD *)Table));

  }
  v10 = (char *)*((_QWORD *)v4 + 35);
  if (v10 || (v10 = CSStore2::Store::getTable((CSStore2 **)v4 + 1, CFSTR("<string>"))) != 0)
  {
    v11 = objc_alloc_init(_CSVisualizerTableFunctions);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_2;
    v16[3] = &__block_descriptor_40_e39___NSString_24__0___CSVisualizer_8I16I20l;
    v16[4] = (char *)v4 + 8;
    -[_CSVisualizerTableFunctions setGetSummary:](v11, "setGetSummary:", v16);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_3;
    v15[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v15[4] = (char *)v4 + 8;
    -[_CSVisualizerTableFunctions setGetDescription:](v11, "setGetDescription:", v15);
    -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v11, (4 * *(_DWORD *)v10));

  }
  v12 = (char *)*((_QWORD *)v4 + 36);
  if (v12 || (v12 = CSStore2::Store::getTable(v6, CFSTR("<dictionary>"))) != 0)
  {
    v13 = objc_alloc_init(_CSVisualizerTableFunctions);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __42___CSVisualizer_setStandardTableFunctions__block_invoke_4;
    v14[3] = &__block_descriptor_40_e49___NSAttributedString_24__0___CSVisualizer_8I16I20l;
    v14[4] = v6;
    -[_CSVisualizerTableFunctions setGetDescription:](v13, "setGetDescription:", v14);
    -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v13, (4 * *(_DWORD *)v12));

  }
}

- (id)summaryOfUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v11;

  v4 = 0;
  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    if (a4)
    {
      v6 = *(_QWORD *)&a3;
      v8 = (void *)MEMORY[0x1A85AA4B4](self, a2);
      -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getSummary");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (!v10
        || (((void (**)(_QWORD, _CSVisualizer *, uint64_t, uint64_t))v10)[2](v10, self, v5, v6),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            !v4))
      {
        if (-[_CSVisualizer store](self, "store"))
          v11 = -37516;
        else
          v11 = 0;
        if (v11 == (_DWORD)v5)
          v4 = (void *)_CSStoreCopyTableName((uint64_t)-[_CSVisualizer store](self, "store"), v6);
        else
          v4 = 0;
      }
      objc_autoreleasePoolPop(v8);
    }
  }
  return v4;
}

- (id)descriptionOfUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);

  v4 = 0;
  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    if (a4)
    {
      v6 = *(_QWORD *)&a3;
      v8 = (void *)MEMORY[0x1A85AA4B4](self, a2);
      -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getDescription");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (!v10
        || (((void (**)(_QWORD, _CSVisualizer *, uint64_t, uint64_t))v10)[2](v10, self, v5, v6),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            !v4))
      {
        v4 = _CSStoreCopyDebugDescriptionOfUnit((uint64_t)-[_CSVisualizer store](self, "store"), v5, v6, 1);
      }
      objc_autoreleasePoolPop(v8);
    }
  }
  return v4;
}

- (id)breakDownUsage
{
  __CSStore *v2;
  __CSStore *v3;
  uint64_t v4;
  CSStore2 **v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  void *v12;
  size_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  _QWORD v23[7];

  v2 = -[_CSVisualizer store](self, "store");
  v3 = v2;
  if (performConstantAssertions)
  {
    v4 = *((_QWORD *)v2 + 42);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  v6 = *((_QWORD *)v3 + 1);
  v5 = (CSStore2 **)((char *)v3 + 8);
  v7 = *(_QWORD *)(v6 + 8);
  v8 = *(unsigned int *)(v7 + 12);
  v9 = (char *)malloc_type_malloc(v8 + 4, 0x17BBE915uLL);
  v10 = v9 + 4;
  bzero(v9 + 4, v8);
  *((_DWORD *)v9 + 25) = 33686018;
  *(_QWORD *)&v11 = 0x202020202020202;
  *((_QWORD *)&v11 + 1) = 0x202020202020202;
  *(_OWORD *)(v9 + 84) = v11;
  *(_OWORD *)(v9 + 68) = v11;
  *(_OWORD *)(v9 + 52) = v11;
  *(_OWORD *)(v9 + 36) = v11;
  *(_OWORD *)(v9 + 20) = v11;
  *(_OWORD *)(v9 + 4) = v11;
  v12 = (void *)objc_opt_class();
  objc_msgSend(v12, "breakDownTable:inStore:buffer:", v7 + 20, v5, v9 + 4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __31___CSVisualizer_breakDownUsage__block_invoke;
  v23[3] = &__block_descriptor_56_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16lu32l8;
  v23[4] = v12;
  v23[5] = v5;
  v23[6] = v9 + 4;
  CSStore2::Store::enumerateTables(v5, v23);
  v13 = v8 >> 2;
  if ((_DWORD)v8)
  {
    for (i = 0; i != v8; ++i)
      v10[i >> 2] = v10[i];
  }
  v15 = (void *)MEMORY[0x1A85AA4B4]();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v10, v8 >> 2, 0);
  objc_msgSend(v16, "compressedDataUsingAlgorithm:error:", 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "length");
    if (v19 < v13)
      objc_msgSend(v18, "getBytes:length:", v10, v19);
  }
  else
  {
    v19 = -1;
  }

  objc_autoreleasePoolPop(v15);
  if (v19 >= v13)
  {
    v20 = v13 + 4;
  }
  else
  {
    v20 = v19 + 4;
    v21 = (char *)malloc_type_realloc(v9, v19 + 4, 0x5F69C808uLL);
    if (v21)
      v9 = v21;
  }
  *(_DWORD *)v9 = 1;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v9, v20, 1);
}

- (void)enumerateReferencesToUnit:(unsigned int)a3 inTable:(unsigned int)a4 block:(id)a5
{
  id v8;
  uint64_t v9;
  __CSStore *v10;
  __CSStore *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;

  v8 = a5;
  v9 = objc_opt_class();
  v10 = -[_CSVisualizer store](self, "store");
  v11 = v10;
  if (performConstantAssertions)
  {
    v12 = *((_QWORD *)v10 + 42);
    if (v12)
      (*(void (**)(_QWORD))(**(_QWORD **)(v12 + 8) + 8))(*(_QWORD *)(v12 + 8));
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke;
  v14[3] = &unk_1E4E22088;
  v18 = a4;
  v19 = a3;
  v16 = (char *)v11 + 8;
  v17 = v9;
  v14[4] = self;
  v13 = v8;
  v15 = v13;
  CSStore2::Store::enumerateTables((CSStore2 **)v11 + 1, v14);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStore:useStandardTableFunctions:", -[_CSVisualizer store](self, "store"), 0);
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_msgSend(v4[1], "addEntriesFromDictionary:", self->_functions);
  objc_msgSend(v4[4], "addEntriesFromDictionary:", self->_userInfo);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (__CSStore)store
{
  return self->_store;
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_functions, 0);
}

+ (_CSVisualizer)new
{
  abort();
}

+ (_NSRange)rangeOfValueForTitle:(id)a3 inDescription:(id)a4
{
  id v6;
  id v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __n128 (*v18)(__n128 *, __n128 *);
  uint64_t (*v19)();
  const char *v20;
  __int128 v21;
  _NSRange result;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x4012000000;
  v18 = __Block_byref_object_copy__632;
  v19 = __Block_byref_object_dispose__633;
  v20 = "";
  v21 = xmmword_1A4E89680;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___CSVisualizer_rangeOfValueForTitle_inDescription___block_invoke;
  v12[3] = &unk_1E4E21FA8;
  v13 = v6;
  v14 = &v15;
  v7 = v6;
  objc_msgSend(a1, "enumerateValuesForTitlesInDescription:block:", a4, v12);
  v8 = v16[6];
  v9 = v16[7];

  _Block_object_dispose(&v15, 8);
  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

+ (void)enumerateValuesForTitlesInDescription:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  char *v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _OWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(id, void *, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t *);
  void *context;
  void *v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  __n128 (*v48)(__n128 *, __n128 *);
  uint64_t (*v49)();
  const char *v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  __n128 (*v58)(__n128 *, __n128 *);
  void (*v59)(uint64_t);
  const char *v60;
  void *v61;
  void *v62;
  uint64_t v63;

  v5 = a3;
  v41 = (void (**)(id, void *, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t *))a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x4812000000;
  v58 = __Block_byref_object_copy__33;
  v59 = __Block_byref_object_dispose__34;
  v60 = "";
  v61 = 0;
  v62 = 0;
  v63 = 0;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke;
  v52[3] = &unk_1E4E21FD0;
  v6 = v5;
  v53 = v6;
  v54 = &v55;
  v7 = MEMORY[0x1A85AA61C](v52);
  v8 = (void *)MEMORY[0x1A85AA4B4]();
  v43 = v6;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_CSVOutputType"), 0, objc_msgSend(v6, "length"), 0, v7);
  objc_autoreleasePoolPop(v8);
  v39 = (void *)v7;
  v9 = (uint64_t *)v56[6];
  v10 = (uint64_t *)v56[7];
  if (v9 == v10)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *v9;
      v15 = v9[1];
      v45 = 0;
      v46 = &v45;
      v47 = 0x4012000000;
      v48 = __Block_byref_object_copy__632;
      v49 = __Block_byref_object_dispose__633;
      v50 = "";
      v51 = xmmword_1A4E89680;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke_39;
      v44[3] = &unk_1E4E21FF8;
      v44[4] = &v45;
      v16 = (void *)MEMORY[0x1A85AA61C](v44);
      v17 = (void *)MEMORY[0x1A85AA4B4]();
      objc_msgSend(v43, "enumerateAttributesInRange:options:usingBlock:", v15 + v14, objc_msgSend(v43, "length") - (v15 + v14), 0, v16);
      v18 = v46 + 6;
      if ((unint64_t)v12 >= v13)
      {
        v19 = (v12 - v11) >> 4;
        v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 60)
          abort();
        if ((uint64_t)(v13 - (_QWORD)v11) >> 3 > v20)
          v20 = (uint64_t)(v13 - (_QWORD)v11) >> 3;
        if (v13 - (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
          v21 = 0xFFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
          v21 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v21);
        else
          v22 = 0;
        v23 = (_OWORD *)(v21 + 16 * v19);
        *v23 = *v18;
        if (v12 == v11)
        {
          v25 = (char *)(v21 + 16 * v19);
        }
        else
        {
          v24 = v21 + 16 * v19;
          do
          {
            v25 = (char *)(v24 - 16);
            *(_OWORD *)(v24 - 16) = *((_OWORD *)v12 - 1);
            v12 -= 16;
            v24 -= 16;
          }
          while (v12 != v11);
        }
        v13 = v21 + 16 * v22;
        v12 = (char *)(v23 + 1);
        if (v11)
          operator delete(v11);
        v11 = v25;
      }
      else
      {
        *(_OWORD *)v12 = *v18;
        v12 += 16;
      }
      objc_autoreleasePoolPop(v17);

      _Block_object_dispose(&v45, 8);
      v9 += 2;
    }
    while (v9 != v10);
  }
  objc_msgSend(v43, "string");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v56[7] - v56[6];
  if ((v12 - v11) >> 4 >= (unint64_t)(v26 >> 4))
    v27 = v26 >> 4;
  else
    v27 = (v12 - v11) >> 4;
  LOBYTE(v45) = 0;
  if (v27)
  {
    v28 = 0;
    v29 = 1;
    do
    {
      v30 = (void *)MEMORY[0x1A85AA4B4]();
      v31 = v56[6];
      v32 = *(_QWORD *)(v31 + v28);
      v33 = *(_QWORD *)&v11[v28];
      if (v32 != 0x7FFFFFFFFFFFFFFFLL && v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        context = v30;
        v35 = *(_QWORD *)&v11[v28 + 8];
        v36 = *(_QWORD *)(v31 + v28 + 8);
        objc_msgSend(v40, "substringWithRange:", v32, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "attributedSubstringFromRange:", v33, v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2](v41, v37, v32, v36, v38, v33, v35, &v45);

        v30 = context;
      }
      objc_autoreleasePoolPop(v30);
      if (v29 >= v27)
        break;
      ++v29;
      v28 += 16;
    }
    while (!(_BYTE)v45);

  }
  else
  {

    if (!v11)
      goto LABEL_40;
  }
  operator delete(v11);
LABEL_40:

  _Block_object_dispose(&v55, 8);
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }

}

+ (id)predicateForSearchingDescriptionWithString:(id)a3 error:(id *)a4
{
  +[_CSVisualizerPredicate predicateWithFormatString:error:](_CSVisualizerPredicate, "predicateWithFormatString:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)breakDownTable:(const Table *)a3 inStore:(const void *)a4 buffer:(char *)a5
{
  uint64_t v8;
  unint64_t v9;
  int v10;
  BOOL v11;
  unint64_t v12;
  char *v14;
  __int128 v15;
  const Table *v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  const CSStore2::Store *v22;
  uint64_t var5;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  _DWORD *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  _DWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v39;
  unint64_t v40;
  _DWORD *v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  unint64_t v45;
  unint64_t v46;
  unsigned int *v47;
  int v48;
  _DWORD *v49;
  unint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *Table;
  char *v58;
  char *v59;
  char v60;
  char *StringCache;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  _BOOL4 v67;
  _QWORD *v68;
  void *v69;
  _DWORD *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int *v83;
  int v84;
  _DWORD *v85;
  unint64_t v86;
  _BOOL8 v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  _QWORD v93[6];
  char v94;
  _QWORD v95[2];
  void *(*v96)(uint64_t, unsigned int, size_t, int, int);
  void *v97;
  char *v98;
  char v99;
  _QWORD v100[2];
  void *(*v101)(uint64_t, unsigned int, size_t, int, int);
  void *v102;
  char *v103;
  char v104;
  _BYTE v105[9];

  if (a3)
  {
    v8 = *(_QWORD *)a4;
    if (*(_QWORD *)a4)
      v9 = *(_QWORD *)(v8 + 8);
    else
      v9 = 0;
    v10 = -1;
    v11 = (unint64_t)a3 >= v9;
    v12 = (unint64_t)a3 - v9;
    if (v11 && !HIDWORD(v12))
    {
      if ((v12 + 1) > *(_DWORD *)(*(_QWORD *)(v8 + 8) + 12) || v12 == -1)
        v10 = -1;
      else
        v10 = v12;
    }
  }
  else
  {
    v10 = -1;
  }
  v14 = &a5[v10];
  *(_QWORD *)&v15 = 0x404040404040404;
  *((_QWORD *)&v15 + 1) = 0x404040404040404;
  *((_OWORD *)v14 + 3) = v15;
  *((_OWORD *)v14 + 4) = v15;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v15;
  *(_OWORD *)v14 = v15;
  v16 = a3 + 1;
  v17 = *(_QWORD *)a4;
  if (*(_QWORD *)a4)
    v18 = *(_QWORD *)(v17 + 8);
  else
    v18 = 0;
  v19 = -1;
  v11 = (unint64_t)v16 >= v18;
  v20 = (unint64_t)v16 - v18;
  if (v11 && !HIDWORD(v20))
  {
    if ((v20 + 1) > *(_DWORD *)(*(_QWORD *)(v17 + 8) + 12) || v20 == -1)
      v19 = -1;
    else
      v19 = v20;
  }
  memset(&a5[v19], 68, a3->var0.var2 - 72);
  var5 = a3->var5;
  v24 = MEMORY[0x1E0C809B0];
  if ((_DWORD)var5 != -1)
  {
    v25 = *(_QWORD *)(*(_QWORD *)a4 + 8);
    v26 = *(_DWORD *)(v25 + 12);
    if (v26 > var5)
    {
      v27 = (_DWORD *)(v25 + var5);
      v28 = v25 + var5 < v25;
      v29 = (int)var5 + 1 > v26 || var5 == -1;
      v30 = a3->var5;
      if (v28 || v29)
        v30 = 0xFFFFFFFFLL;
      *(_DWORD *)&a5[v30] = 134744072;
      v95[0] = v24;
      v95[1] = 3221225472;
      v96 = ___ZN8CSStore27HashMapIjjNS_20_IdentifierFunctionsELy1EE14WriteBreakdownERKNS_5StoreEPKS2_hPh_block_invoke;
      v97 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
      v99 = 4;
      v98 = a5;
      v31 = v95;
      v32 = v31;
      LOBYTE(v100[0]) = 0;
      v33 = v27 + 1;
      v34 = *(_QWORD *)a4;
      if (*(_QWORD *)a4)
        v35 = *(_QWORD *)(v34 + 8);
      else
        v35 = 0;
      v36 = 0xFFFFFFFFLL;
      v11 = (unint64_t)v33 >= v35;
      v37 = (unint64_t)v33 - v35;
      if (v11 && !HIDWORD(v37))
      {
        if ((v37 + 1) > *(_DWORD *)(*(_QWORD *)(v34 + 8) + 12) || v37 == -1)
          v36 = 0xFFFFFFFFLL;
        else
          v36 = v37;
      }
      ((void (*)(_QWORD *, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD *))v96)(v31, v36, (8 * *v27), 1, 1, v100);
      v39 = *v27;
      if ((_DWORD)v39 && !LOBYTE(v100[0]))
      {
        v40 = 0;
        do
        {
          v41 = &v27[2 * v40];
          v42 = v41[2];
          if ((_DWORD)v42 == -1)
          {
            v46 = 0;
          }
          else
          {
            v43 = *(_QWORD *)(*(_QWORD *)a4 + 8);
            v44 = *(_DWORD *)(v43 + 12) > v42;
            v45 = v43 + v42;
            if (v44)
              v46 = v45;
            else
              v46 = 0;
          }
          v47 = v41 + 1;
          v48 = v41[1];
          if (v48)
          {
            v49 = (_DWORD *)(v46 + 4);
            v50 = 1;
            do
            {
              if (*(v49 - 1))
                v51 = *v49 != -1;
              else
                v51 = 0;
              v52 = *(_QWORD *)a4;
              if (*(_QWORD *)a4)
                v53 = *(_QWORD *)(v52 + 8);
              else
                v53 = 0;
              v54 = 0xFFFFFFFFLL;
              v11 = v46 >= v53;
              v55 = v46 - v53;
              if (v11 && !HIDWORD(v55))
              {
                if ((v55 + 1) > *(_DWORD *)(*(_QWORD *)(v52 + 8) + 12) || v55 == -1)
                  v54 = 0xFFFFFFFFLL;
                else
                  v54 = v55;
              }
              ((void (*)(void *, uint64_t, uint64_t, _QWORD, _BOOL8, _QWORD *))v96)(v32, v54, 8, 0, v51, v100);
              v48 = LOBYTE(v100[0]);
              if (v50 >= *v47)
                break;
              ++v50;
              v49 += 2;
              v46 += 8;
            }
            while (!LOBYTE(v100[0]));
            v39 = *v27;
          }
          ++v40;
        }
        while (v40 < v39 && !v48);
      }

      v24 = MEMORY[0x1E0C809B0];
    }
  }
  Table = (char *)*((_QWORD *)a4 + 34);
  if (!Table)
    Table = CSStore2::Store::getTable((CSStore2 **)a4, CFSTR("<string>"));
  if (Table == (char *)a3)
  {
    StringCache = CSStore2::getStringCache((CSStore2 *)a4, v22);
    if (StringCache)
    {
      v62 = StringCache;
      v63 = *(_QWORD *)a4;
      if (*(_QWORD *)a4)
        v64 = *(_QWORD *)(v63 + 8);
      else
        v64 = 0;
      v65 = 0xFFFFFFFFLL;
      v11 = (unint64_t)StringCache >= v64;
      v66 = (unint64_t)&StringCache[-v64];
      if (v11 && !HIDWORD(v66))
      {
        v67 = (v66 + 1) > *(_DWORD *)(*(_QWORD *)(v63 + 8) + 12) || (_DWORD)v66 == -1;
        v65 = v66;
        if (v67)
          v65 = 0xFFFFFFFFLL;
      }
      *(_DWORD *)&a5[v65] = 168430090;
      v100[0] = v24;
      v100[1] = 3221225472;
      v101 = ___ZN8CSStore27HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke;
      v102 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
      v104 = 5;
      v103 = a5;
      v68 = v100;
      v69 = v68;
      v105[0] = 0;
      v70 = v62 + 4;
      v71 = *(_QWORD *)a4;
      if (*(_QWORD *)a4)
        v72 = *(_QWORD *)(v71 + 8);
      else
        v72 = 0;
      v73 = 0xFFFFFFFFLL;
      v11 = (unint64_t)v70 >= v72;
      v74 = (unint64_t)v70 - v72;
      if (v11 && !HIDWORD(v74))
      {
        if ((v74 + 1) > *(_DWORD *)(*(_QWORD *)(v71 + 8) + 12) || v74 == -1)
          v73 = 0xFFFFFFFFLL;
        else
          v73 = v74;
      }
      ((void (*)(_QWORD *, uint64_t, _QWORD, uint64_t, uint64_t, _BYTE *))v101)(v68, v73, (8 * *(_DWORD *)v62), 1, 1, v105);
      v76 = *(unsigned int *)v62;
      if ((_DWORD)v76 && !v105[0])
      {
        v77 = 0;
        do
        {
          v78 = &v62[8 * v77];
          v79 = *((unsigned int *)v78 + 2);
          if ((_DWORD)v79 == -1)
          {
            v82 = 0;
          }
          else
          {
            v80 = *(_QWORD *)(*(_QWORD *)a4 + 8);
            v44 = *(_DWORD *)(v80 + 12) > v79;
            v81 = v80 + v79;
            if (v44)
              v82 = v81;
            else
              v82 = 0;
          }
          v83 = (unsigned int *)(v78 + 4);
          v84 = *((_DWORD *)v78 + 1);
          if (v84)
          {
            v85 = (_DWORD *)(v82 + 4);
            v86 = 1;
            do
            {
              if (*(v85 - 1))
                v87 = *v85 != 0;
              else
                v87 = 0;
              v88 = *(_QWORD *)a4;
              if (*(_QWORD *)a4)
                v89 = *(_QWORD *)(v88 + 8);
              else
                v89 = 0;
              v90 = 0xFFFFFFFFLL;
              v11 = v82 >= v89;
              v91 = v82 - v89;
              if (v11 && !HIDWORD(v91))
              {
                if ((v91 + 1) > *(_DWORD *)(*(_QWORD *)(v88 + 8) + 12) || v91 == -1)
                  v90 = 0xFFFFFFFFLL;
                else
                  v90 = v91;
              }
              ((void (*)(void *, uint64_t, uint64_t, _QWORD, _BOOL8, _BYTE *))v101)(v69, v90, 8, 0, v87, v105);
              v84 = v105[0];
              if (v86 >= *v83)
                break;
              ++v86;
              v85 += 2;
              v82 += 8;
            }
            while (!v105[0]);
            v76 = *(unsigned int *)v62;
          }
          ++v77;
        }
        while (v77 < v76 && !v84);
      }

      v60 = 6;
      v24 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v60 = 6;
    }
  }
  else
  {
    v58 = (char *)*((_QWORD *)a4 + 33);
    if (!v58)
      v58 = CSStore2::Store::getTable((CSStore2 **)a4, CFSTR("<array>"));
    if (v58 == (char *)a3)
    {
      v60 = 7;
    }
    else
    {
      v59 = (char *)*((_QWORD *)a4 + 35);
      if (!v59)
        v59 = CSStore2::Store::getTable((CSStore2 **)a4, CFSTR("<dictionary>"));
      if (v59 == (char *)a3)
        v60 = 8;
      else
        v60 = 3;
    }
  }
  v93[0] = v24;
  v93[1] = 3221225472;
  v93[2] = __47___CSVisualizer_breakDownTable_inStore_buffer___block_invoke;
  v93[3] = &__block_descriptor_49_e30_v24__0r__Unit_b30b2I_0c__8_B16l;
  v94 = v60;
  v93[4] = a4;
  v93[5] = a5;
  CSStore2::Store::enumerateUnits((CSStore2 **)a4, (unsigned int *)a3, v93);
}

+ (void)enumerateReferencesToUnitsInUnitDescription:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke;
  v10[3] = &unk_1E4E220D8;
  v7 = v6;
  v11 = v7;
  v8 = (void *)MEMORY[0x1A85AA61C](v10);
  v9 = (void *)MEMORY[0x1A85AA4B4]();
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v5, "length"), 0x100000, v8);
  objc_autoreleasePoolPop(v9);

}

+ (BOOL)unitDescription:(id)a3 referencesUnit:(unsigned int)a4 inTable:(unsigned int)a5
{
  char v5;
  _QWORD v7[5];
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___CSVisualizer_unitDescription_referencesUnit_inTable___block_invoke;
  v7[3] = &unk_1E4E22100;
  v8 = a5;
  v9 = a4;
  v7[4] = &v10;
  objc_msgSend(a1, "enumerateReferencesToUnitsInUnitDescription:block:", a3, v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)URLForUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("x-csstore-vis-unit:?t=%llu&u=%llu"), a4, a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);

  return v5;
}

+ (BOOL)getUnit:(unsigned int *)a3 inTable:(unsigned int *)a4 fromURL:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  char v27[1024];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)MEMORY[0x1A85AA4B4]();
  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "getCString:maxLength:encoding:", v27, 1024, 4);

  if (v10 && (v23 = 0, v19 = 0, sscanf(v27, "x-csstore-vis-unit:?t=%llu&u=%llu", &v23, &v19) == 2))
  {
    if (a4)
      *a4 = v23;
    if (a3)
      *a3 = v19;
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v7, 1);
    objc_msgSend(v12, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      && (objc_msgSend(v12, "scheme"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("x-csstore-vis-unit")) == 0,
          v14,
          v13,
          v15))
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      objc_msgSend(v12, "queryItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __41___CSVisualizer_getUnit_inTable_fromURL___block_invoke;
      v18[3] = &unk_1E4E22128;
      v18[4] = &v23;
      v18[5] = &v19;
      v18[6] = a4;
      v18[7] = a3;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

      if (*((_BYTE *)v24 + 24))
        v11 = *((_BYTE *)v20 + 24) != 0;
      else
        v11 = 0;
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v11 = 0;
    }

  }
  objc_autoreleasePoolPop(v8);

  return v11;
}

- (id)handlerForTable:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _CSVisualizer *v12;
  unsigned int v13;

  -[_CSVisualizer functionsForTableNoCopy:](self, "functionsForTableNoCopy:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45___CSVisualizer_Deprecated__handlerForTable___block_invoke;
    v10[3] = &unk_1E4E22198;
    v11 = v5;
    v12 = self;
    v13 = a3;
    v7 = (void *)MEMORY[0x1A85AA61C](v10);

  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)MEMORY[0x1A85AA61C](v7);
  return v8;
}

- (void)setHandler:(id)a3 forTable:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  _CSVisualizerTableFunctions *v7;
  uint64_t v8;
  id v9;
  _CSVisualizerTableFunctions *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc_init(_CSVisualizerTableFunctions);
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke;
    v16[3] = &unk_1E4E221C0;
    v9 = v6;
    v17 = v9;
    -[_CSVisualizerTableFunctions setGetSummary:](v7, "setGetSummary:", v16);
    v11 = v8;
    v12 = 3221225472;
    v13 = __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke_2;
    v14 = &unk_1E4E221E8;
    v15 = v9;
    -[_CSVisualizerTableFunctions setGetDescription:](v7, "setGetDescription:", &v11);

    v10 = v7;
  }
  else
  {
    v10 = 0;
  }
  -[_CSVisualizer setFunctions:forTable:](self, "setFunctions:forTable:", v10, v4, v11, v12, v13, v14);

}

@end
