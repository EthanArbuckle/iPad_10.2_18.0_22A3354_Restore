@implementation NSString

void __80__NSString_LSVisualOrderingAdditions__ls_visuallyOrderCharactersReturningError___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  std::vector<int>::pointer end;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int ResultLength;
  void *v11;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::vector<int> __p;
  int v23;

  if (ubidi_open())
  {
    ubidi_setReorderingOptions();
    v23 = 0;
    ubidi_setPara();
    memset(&__p, 0, sizeof(__p));
    if (a3)
    {
      std::vector<unsigned int>::__vallocate[abi:nn180100](&__p, a3);
      end = __p.__end_;
      bzero(__p.__end_, 4 * a3);
      __p.__end_ = &end[a3];
    }
    ubidi_getVisualMap();
    if (v23 <= 0)
    {
      ResultLength = ubidi_getResultLength();
      std::vector<int>::resize(&__p, ResultLength);
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        begin = __p.__begin_;
        v13 = __p.__end_;
        while (begin != v13)
          objc_msgSend(v11, "appendCharacters:length:", a2 + 2 * *begin++, 1);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v15 = v11;
        v16 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v15;
      }
      else
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"-[NSString(LSVisualOrderingAdditions) ls_visuallyOrderCharactersReturningError:]_block_invoke", 837, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;
      }

    }
    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }
    if (v23 >= 1)
    {
      _LSMakeNSErrorImpl(CFSTR("Unicode"), v23, (uint64_t)"-[NSString(LSVisualOrderingAdditions) ls_visuallyOrderCharactersReturningError:]_block_invoke", 844, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
    ubidi_close();
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"-[NSString(LSVisualOrderingAdditions) ls_visuallyOrderCharactersReturningError:]_block_invoke", 850, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;

  v6 = a2;
  if (_NSIsNSString())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "ls_matchesStringForPluginQuery:", v6);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  else
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke_cold_1(a1, v7);

  }
}

void __61__NSString_LSPluginQueryAdditions__ls_matchesForPluginQuery___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Cannot match invalid query %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
