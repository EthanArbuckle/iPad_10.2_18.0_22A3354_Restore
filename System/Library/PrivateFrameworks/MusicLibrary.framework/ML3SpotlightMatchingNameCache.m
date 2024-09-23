@implementation ML3SpotlightMatchingNameCache

- (id)_initWithLibrary:(id)a3 matchString:(id)a4 cancelHandler:(id)a5
{
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD);
  ML3SpotlightMatchingNameCache *v12;
  ML3SpotlightMatchingNameCache *v13;
  ML3MusicLibrary *library;
  ML3SpotlightMatchingNameCache *v15;
  _QWORD v17[4];
  __CFString *v18;
  id v19;
  ML3SpotlightMatchingNameCache *v20;
  uint64_t (**v21)(_QWORD);
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = (uint64_t (**)(_QWORD))a5;
  v22.receiver = self;
  v22.super_class = (Class)ML3SpotlightMatchingNameCache;
  v12 = -[ML3SpotlightMatchingNameCache init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_matchString, a4);
    if (objc_msgSend(v10, "length"))
    {
      library = v13->_library;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke;
      v17[3] = &unk_1E5B63BF0;
      v18 = CFSTR("SELECT name_order FROM sort_map WHERE ML3SearchStringMatch(?, name)");
      v19 = v10;
      v20 = v13;
      v21 = v11;
      -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v17);

    }
  }
  if (v11 && (v11[2](v11) & 1) != 0)
    v15 = 0;
  else
    v15 = v13;

  return v15;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3SpotlightMatchingNameCache;
  -[ML3SpotlightMatchingNameCache dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_matchString, 0);
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_matchingSet);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

void __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke_2;
  v7[3] = &unk_1E5B63BA0;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v6, "enumerateRowsWithBlock:", v7);

}

void __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint8x8_t v13;
  _QWORD *v14;
  _QWORD *i;
  unint64_t v16;
  _QWORD *v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v28 = v7;
  v9 = objc_msgSend(v7, "int64ForColumnIndex:", 0);
  v10 = v9;
  v11 = (uint64_t *)(v8 + 8);
  v12 = *(_QWORD *)(v8 + 16);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v12)
        v4 = v9 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v9;
    }
    v14 = *(_QWORD **)(*v11 + 8 * v4);
    if (v14)
    {
      for (i = (_QWORD *)*v14; i; i = (_QWORD *)*i)
      {
        v16 = i[1];
        if (v16 == v9)
        {
          if (i[2] == v9)
            goto LABEL_40;
        }
        else
        {
          if (v13.u32[0] > 1uLL)
          {
            if (v16 >= v12)
              v16 %= v12;
          }
          else
          {
            v16 &= v12 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = operator new(0x18uLL);
  *v17 = 0;
  v17[1] = v10;
  v17[2] = v10;
  v18 = (float)(unint64_t)(*(_QWORD *)(v8 + 32) + 1);
  v19 = *(float *)(v8 + 40);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    v20 = 1;
    if (v12 >= 3)
      v20 = (v12 & (v12 - 1)) != 0;
    v21 = v20 | (2 * v12);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(v8 + 8, v23);
    v12 = *(_QWORD *)(v8 + 16);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v10 >= v12)
        v4 = v10 % v12;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
  }
  v24 = *v11;
  v25 = *(_QWORD **)(*v11 + 8 * v4);
  if (v25)
  {
    *v17 = *v25;
LABEL_38:
    *v25 = v17;
    goto LABEL_39;
  }
  *v17 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v17;
  *(_QWORD *)(v24 + 8 * v4) = v8 + 24;
  if (*v17)
  {
    v26 = *(_QWORD *)(*v17 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v26 >= v12)
        v26 %= v12;
    }
    else
    {
      v26 &= v12 - 1;
    }
    v25 = (_QWORD *)(*v11 + 8 * v26);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(v8 + 32);
LABEL_40:
  v27 = *(_QWORD *)(a1 + 40);
  if (v27)
    LOBYTE(v27) = (*(uint64_t (**)(void))(v27 + 16))();
  *a4 = v27;

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && __nameCacheOnce != -1)
    dispatch_once(&__nameCacheOnce, &__block_literal_global_15755);
}

+ (void)loadFromLibrary:(id)a3 namesMatchingString:(id)a4 cancelHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = __nameCacheLoadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke;
  block[3] = &unk_1E5B656C0;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_sync(v10, block);

}

void __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  if (__matchingNameCache
    && *(_QWORD *)(__matchingNameCache + 64) == a1[4]
    && (objc_msgSend(*(id *)(__matchingNameCache + 48), "isEqualToString:", a1[5]) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[ML3SpotlightMatchingNameCache _initWithLibrary:matchString:cancelHandler:]([ML3SpotlightMatchingNameCache alloc], "_initWithLibrary:matchString:cancelHandler:", a1[4], a1[5], a1[6]);
  }
  v3 = __nameCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke_2;
  block[3] = &unk_1E5B65D80;
  v6 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

void __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_storeStrong((id *)&__matchingNameCache, v1);
    ML3SpotlightMatchingNameCacheTimer((ML3SpotlightMatchingNameCache *)__matchingNameCache);
  }
  if (__matchingNameCache)
    *(_BYTE *)(__matchingNameCache + 56) = 0;
}

@end
