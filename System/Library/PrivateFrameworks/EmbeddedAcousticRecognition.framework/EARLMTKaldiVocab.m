@implementation EARLMTKaldiVocab

void __52___EARLMTKaldiVocab_initWithContentsOfUrl_outError___block_invoke(_QWORD *a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *__p[2];
  char v21;
  void **v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if ((objc_msgSend(v7, "isEqualToString:", &stru_1E5D49530) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 > 3)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
        v18 = a1[4];
        v19 = *(_QWORD *)(v18 + 64);
        v22 = __p;
        *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v18 + 40, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v22)+ 5) = (int)v19;
        if (v21 < 0)
          operator delete(__p[0]);
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("<VocabSize>")))
      {
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (int)objc_msgSend(v11, "intValue");
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("<UnknownWord>")))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v11);
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("<BeginOfSentenceWord>")))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v11);
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("<EndOfSentenceWord>")))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), v11);
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect format of vocab file for line=%@"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1[5] + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      *a4 = 1;
    }

  }
}

@end
