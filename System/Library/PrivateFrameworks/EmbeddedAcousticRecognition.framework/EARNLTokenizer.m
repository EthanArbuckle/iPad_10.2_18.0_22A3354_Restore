@implementation EARNLTokenizer

void __28___EARNLTokenizer_tokenize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  quasar *v8;
  quasar *v9;
  _QWORD *PunctuationReplacements;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  _QWORD *v13;
  void *v14;
  quasar *v15;
  quasar *v16;
  void *__p[2];
  uint64_t v18;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v8 = (quasar *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 17))
  {
    PunctuationReplacements = (_QWORD *)quasar::getPunctuationReplacements(v8);
    if (v9)
    {
      -[quasar ear_toString](v9, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v18 = 0;
    }
    v11 = std::__hash_table<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>>>::find<std::string>(PunctuationReplacements, (unsigned __int8 *)__p);
    v12 = v11;
    if (SHIBYTE(v18) < 0)
    {
      operator delete(__p[0]);
      if (!v12)
        goto LABEL_13;
    }
    else if (!v11)
    {
      goto LABEL_13;
    }
    v13 = v12 + 40;
    if ((char)v12[63] < 0)
      v13 = (_QWORD *)*v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
      goto LABEL_17;
    }
  }
LABEL_13:
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 16))
  {
    -[quasar lowercaseString](v9, "lowercaseString");
    v15 = (quasar *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v9;
  }
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

  v14 = 0;
LABEL_17:

}

@end
