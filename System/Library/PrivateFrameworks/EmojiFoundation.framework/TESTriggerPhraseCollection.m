@implementation TESTriggerPhraseCollection

- (TESTriggerPhraseCollection)initWithLocale:(id)a3
{
  id v4;
  TESTriggerPhraseCollection *v5;
  uint64_t v6;
  void *v7;
  TESTriggerPhraseLoader *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TESTriggerPhraseCollection;
  v5 = -[TESTriggerPhraseCollection init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v6;

    v8 = [TESTriggerPhraseLoader alloc];
    -[TESTriggerPhraseCollection locale](v5, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TESTriggerPhraseLoader initWithLocaleIdentifier:](v8, "initWithLocaleIdentifier:", v10);
    v12 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v11;

    v13 = *((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = 0;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    -[TESTriggerPhraseCollection _loadTrie](v5, "_loadTrie");
  }

  return v5;
}

- (id)_dispatchQueue
{
  if (-[TESTriggerPhraseCollection _dispatchQueue]::onceToken != -1)
    dispatch_once(&-[TESTriggerPhraseCollection _dispatchQueue]::onceToken, &__block_literal_global_13);
  return (id)-[TESTriggerPhraseCollection _dispatchQueue]::__queue;
}

void __44__TESTriggerPhraseCollection__dispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.EmojiFoundation.triggers-collection", 0);
  v1 = (void *)-[TESTriggerPhraseCollection _dispatchQueue]::__queue;
  -[TESTriggerPhraseCollection _dispatchQueue]::__queue = (uint64_t)v0;

}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = *((_QWORD *)self + 1);
  if (v3)
  {
    *((_QWORD *)self + 1) = 0;
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v3 + 8))(v3, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)TESTriggerPhraseCollection;
  -[TESTriggerPhraseCollection dealloc](&v4, sel_dealloc);
}

- (void)enumerateMatchStringsInString:(id)a3 searchRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  std::basic_string<char16_t>::size_type v15;
  std::basic_string<char16_t>::size_type v16;
  std::basic_string<char16_t>::size_type size;
  char v18;
  std::basic_string<char16_t> *v19;
  std::basic_string<char16_t> *v20;
  void *v21;
  NSUInteger v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  BOOL v28;
  char v29;
  char v30;
  std::mutex *v31;
  void (**v32)(id, NSUInteger, NSUInteger, _QWORD, char *);
  void *v33;
  void *v34;
  uint64_t v35;
  std::string __p;
  uint64_t v37;
  std::string v38;
  std::basic_string<char16_t> v39;
  char v40;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v32 = (void (**)(id, NSUInteger, NSUInteger, _QWORD, char *))a5;
  v31 = (std::mutex *)((char *)self + 40);
  std::mutex::lock((std::mutex *)((char *)self + 40));
  if (*((_QWORD *)self + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    if (v10 >= length)
      v11 = length;
    else
      v11 = v10;
    if (location < objc_msgSend(v9, "length"))
    {
      v40 = 0;
      memset(&v39, 0, sizeof(v39));
      if (location < v11)
      {
        while (1)
        {
          (*(void (**)(uint64_t *__return_ptr))(**((_QWORD **)self + 1) + 104))(&v37);
          v12 = location;
          while (1)
          {
            if (((*(uint64_t (**)(_QWORD, uint64_t *))(**((_QWORD **)self + 1) + 112))(*((_QWORD *)self + 1), &v37) & 1) == 0)
            {
LABEL_41:
              v29 = 0;
              goto LABEL_42;
            }
            -[TESTriggerPhraseCollection locale](self, "locale");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "getLowercaseCharacterAt:locale:", v12, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = objc_msgSend(v14, "length");
            v16 = v15;
            size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
            v18 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
            if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              size = v39.__r_.__value_.__l.__size_;
            if (v15 > size)
            {
              std::basic_string<char16_t>::resize(&v39, v15, 0);
              v18 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
            }
            if (v18 >= 0)
              v19 = &v39;
            else
              v19 = (std::basic_string<char16_t> *)v39.__r_.__value_.__r.__words[0];
            objc_msgSend(v14, "getCharacters:", v19);
            if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v20 = &v39;
            else
              v20 = (std::basic_string<char16_t> *)v39.__r_.__value_.__r.__words[0];
            (*(void (**)(uint64_t *__return_ptr, _QWORD, uint64_t *, std::basic_string<char16_t> *, std::basic_string<char16_t>::size_type))(**((_QWORD **)self + 1) + 120))(&v35, *((_QWORD *)self + 1), &v37, v20, v16);
            v37 = v35;
            std::string::operator=(&v38, &__p);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            LOWORD(v35) = 0;
            v21 = v9;
            if (((*(uint64_t (**)(_QWORD, uint64_t *, uint64_t *))(**((_QWORD **)self + 1) + 128))(*((_QWORD *)self + 1), &v37, &v35) & 1) != 0)break;
            v22 = v12 + 1;
LABEL_39:

            v12 = v22;
            v28 = v22 >= v11;
            v9 = v21;
            if (v28)
              goto LABEL_41;
          }
          v22 = v12 + 1;
          if (v12 + 1 == v11)
          {
            v23 = 0;
            if (!location)
              goto LABEL_31;
          }
          else
          {
            v24 = objc_msgSend(v21, "characterAtIndex:", v12 + 1);
            if ((objc_msgSend(v34, "characterIsMember:", v24) & 1) != 0)
            {
              v23 = 1;
              if (!location)
                goto LABEL_31;
            }
            else
            {
              v23 = objc_msgSend(v33, "characterIsMember:", v24);
              if (!location)
                goto LABEL_31;
            }
          }
          v25 = objc_msgSend(v21, "characterAtIndex:", location - 1);
          if ((objc_msgSend(v34, "characterIsMember:", v25) & 1) != 0)
          {
LABEL_31:
            v26 = 1;
            goto LABEL_33;
          }
          v26 = objc_msgSend(v33, "characterIsMember:", v25);
LABEL_33:
          if (v22 == v11)
            v27 = 1;
          else
            v27 = v23;
          if (v27 != 1)
            goto LABEL_39;
          if (!v26)
            goto LABEL_39;
          v32[2](v32, location, v12 - location + 1, (unsigned __int16)v35, &v40);
          if (!v40)
            goto LABEL_39;

          v29 = 1;
          v9 = v21;
LABEL_42:
          if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v38.__r_.__value_.__l.__data_);
          if (++location == v11)
            v30 = 1;
          else
            v30 = v29;
          if ((v30 & 1) != 0)
          {
            if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v39.__r_.__value_.__l.__data_);
            break;
          }
        }
      }
    }

  }
  std::mutex::unlock(v31);

}

- (void)waitForSync
{
  NSObject *v3;
  _QWORD block[5];

  -[TESTriggerPhraseCollection _dispatchQueue](self, "_dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__TESTriggerPhraseCollection_waitForSync__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __41__TESTriggerPhraseCollection_waitForSync__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  emf_logging_get_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "locale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1B3DE1000, v2, OS_LOG_TYPE_INFO, "[TESTriggerPhraseCollection] preheat for %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

- (id)_trieBlobURL
{
  CFURLRef v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = CEM::copyLibraryKeyboardDirectoryURL((CEM *)self);
  -[TESTriggerPhraseCollection locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TextEffectPhrases_%@.dat"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFURL URLByAppendingPathComponent:](v3, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_shouldRecompileTrie:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "SHA224ChecksumSize");
  objc_msgSend(v4, "subdataWithRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TESTriggerPhraseCollection triggerPhraseLoader](self, "triggerPhraseLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plistPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (v11 = objc_msgSend(v9, "length"), v11 >= objc_msgSend(MEMORY[0x1E0C99D50], "SHA224ChecksumSize")))
    {
      objc_msgSend(v10, "subdataWithRange:", 0, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isEqualToData:", v13) ^ 1;

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_loadTrie
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1B3DE1000, a2, a3, "Failed to open file for serialized trie: %{public}@", (uint8_t *)&v3);
}

- (void)_buildAndLoadTrie
{
  NSObject *v3;
  _QWORD block[5];

  -[TESTriggerPhraseCollection _dispatchQueue](self, "_dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t *v11;
  __int128 *v12;
  std::basic_string<char16_t> *v13;
  __int128 v14;
  std::basic_string<char16_t> *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int16 v25;
  char *v26;
  char **v27;
  BOOL v28;
  uint64_t v29;
  void **v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  std::mutex *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *p_p;
  char *v45;
  char *v46;
  void *__p;
  std::basic_string<char16_t> *v48;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char **v54;
  char *v55[2];
  void *v56[2];
  unsigned __int8 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "triggerPhraseLoader");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = 0;
  v55[1] = 0;
  v54 = v55;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v51 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[TESLocaleData textEffectTypeForAnimationName:](TESLocaleData, "textEffectTypeForAnimationName:", v8);

        objc_msgSend(v7, "lowercaseString");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CEM::getUTF16StringFromCFString(v10, (uint64_t)&__p);
        LOWORD(p_p) = v9;
        std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned short>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned short>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned short>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&,unsigned short>((uint64_t **)&v54, (unsigned __int16 *)&__p, (uint64_t)&__p, &p_p);
        if (SHIBYTE(v49) < 0)
          operator delete(__p);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v4);
  }

  __p = 0;
  v48 = 0;
  v49 = 0;
  p_p = 0;
  v45 = 0;
  v46 = 0;
  v11 = (uint64_t *)v54;
  if (v54 != v55)
  {
    do
    {
      v12 = (__int128 *)(v11 + 4);
      v13 = v48;
      if ((unint64_t)v48 >= v49)
      {
        v15 = (std::basic_string<char16_t> *)std::vector<std::basic_string<char16_t>>::__emplace_back_slow_path<std::basic_string<char16_t> const&>((uint64_t)&__p, v12);
      }
      else
      {
        if (*((char *)v11 + 55) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v48, (const std::basic_string<char16_t>::value_type *)v11[4], v11[5]);
        }
        else
        {
          v14 = *v12;
          v48->__r_.__value_.__r.__words[2] = v11[6];
          *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
        }
        v15 = v13 + 1;
      }
      v48 = v15;
      v16 = v45;
      if (v45 >= v46)
      {
        v18 = (char *)p_p;
        v19 = v45 - (_BYTE *)p_p;
        if (v45 - (_BYTE *)p_p <= -3)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v20 = v19 >> 1;
        if (v46 - (_BYTE *)p_p <= (unint64_t)((v19 >> 1) + 1))
          v21 = v20 + 1;
        else
          v21 = v46 - (_BYTE *)p_p;
        if ((unint64_t)(v46 - (_BYTE *)p_p) >= 0x7FFFFFFFFFFFFFFELL)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        if (v22)
        {
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>((uint64_t)&v46, v22);
          v18 = (char *)p_p;
          v16 = v45;
        }
        else
        {
          v23 = 0;
        }
        v24 = &v23[2 * v20];
        *(_WORD *)v24 = *((_WORD *)v11 + 28);
        v17 = v24 + 2;
        while (v16 != v18)
        {
          v25 = *((_WORD *)v16 - 1);
          v16 -= 2;
          *((_WORD *)v24 - 1) = v25;
          v24 -= 2;
        }
        p_p = v24;
        v45 = v17;
        v46 = &v23[2 * v22];
        if (v18)
          operator delete(v18);
      }
      else
      {
        *(_WORD *)v45 = *((_WORD *)v11 + 28);
        v17 = v16 + 2;
      }
      v45 = v17;
      v26 = (char *)v11[1];
      if (v26)
      {
        do
        {
          v27 = (char **)v26;
          v26 = *(char **)v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          v27 = (char **)v11[2];
          v28 = *v27 == (char *)v11;
          v11 = (uint64_t *)v27;
        }
        while (!v28);
      }
      v11 = (uint64_t *)v27;
    }
    while (v27 != v55);
  }
  v29 = operator new();
  *(_QWORD *)v29 = &unk_1E66E46C0;
  *(_DWORD *)(v29 + 8) = 0;
  internal::marisa::Trie::Trie((_QWORD *)(v29 + 16));
  *(_QWORD *)(v29 + 56) = 0;
  *(_OWORD *)(v29 + 40) = 0u;
  *(_OWORD *)(v29 + 24) = 0u;
  if (((*(uint64_t (**)(uint64_t, void **, void **))(*(_QWORD *)v29 + 64))(v29, &__p, &p_p) & 1) != 0)
  {
    (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)v29 + 48))(v56, v29);
    if ((v57 & 0x80u) == 0)
      v30 = v56;
    else
      v30 = (void **)v56[0];
    if ((v57 & 0x80u) == 0)
      v31 = v57;
    else
      v31 = (unint64_t)v56[1];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "SHA224Checksum");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendData:", v34);

    objc_msgSend(v33, "appendData:", v32);
    objc_msgSend(*(id *)(a1 + 32), "_trieBlobURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "writeToURL:atomically:", v35, 1) & 1) == 0)
    {
      emf_logging_get_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke_cold_1((uint64_t)v35, v36, v37);

    }
    v38 = (std::mutex *)(*(_QWORD *)(a1 + 32) + 40);
    std::mutex::lock(v38);
    v39 = *(_QWORD *)(a1 + 32);
    v40 = *(_QWORD *)(v39 + 8);
    *(_QWORD *)(v39 + 8) = v29;
    if (v40)
      (*(void (**)(uint64_t))(*(_QWORD *)v40 + 8))(v40);
    std::mutex::unlock(v38);

    if ((char)v57 < 0)
      operator delete(v56[0]);
  }
  else
  {
    emf_logging_get_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "locale");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke_cold_2(v42, (uint64_t)v56, v41);
    }

    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  }
  if (p_p)
  {
    v45 = (char *)p_p;
    operator delete(p_p);
  }
  p_p = &__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned short>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned short>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned short>>>::destroy((uint64_t)&v54, v55[0]);

}

- (NSLocale)locale
{
  return (NSLocale *)*((_QWORD *)self + 13);
}

- (TESTriggerPhraseLoader)triggerPhraseLoader
{
  return (TESTriggerPhraseLoader *)*((_QWORD *)self + 14);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 40));
  if (*((char *)self + 39) < 0)
    operator delete(*((void **)self + 2));
  v3 = *((_QWORD *)self + 1);
  *((_QWORD *)self + 1) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_QWORD *)self + 5) = 850045863;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  return self;
}

void __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1B3DE1000, a2, a3, "Failed to open file path for trie serialization: %{public}@", (uint8_t *)&v3);
}

void __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1B3DE1000, a3, (uint64_t)a3, "Failed to compile the trie for locale: %{public}@", (uint8_t *)a2);

}

@end
