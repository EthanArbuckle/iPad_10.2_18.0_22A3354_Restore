@implementation _EARLMTKaldiVocab

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.speech.languagemodeltraining", "_EARLMTKaldiVocab");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (_EARLMTKaldiVocab)init
{

  return 0;
}

- (_EARLMTKaldiVocab)initWithContentsOfUrl:(id)a3 outError:(id *)a4
{
  _EARLMTKaldiVocab *v6;
  void *v7;
  void *v8;
  _EARLMTKaldiVocab *v9;
  uint64_t v10;
  unint64_t value;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _EARLMTKaldiVocab *v24;
  void *v26;
  void *v27;
  id v28;
  void *__p[2];
  char v30;
  _QWORD v31[4];
  _EARLMTKaldiVocab *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  objc_super v66;
  void **v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v66.receiver = self;
  v66.super_class = (Class)_EARLMTKaldiVocab;
  v6 = -[_EARLMTKaldiVocab init](&v66, sel_init);
  if (!v6)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v28, 4, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_20;
  v26 = v7;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__4;
  v64 = __Block_byref_object_dispose__4;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__4;
  v58 = __Block_byref_object_dispose__4;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52___EARLMTKaldiVocab_initWithContentsOfUrl_outError___block_invoke;
  v31[3] = &unk_1E5D47458;
  v33 = &v42;
  v34 = &v38;
  v35 = &v48;
  v36 = &v60;
  v37 = &v54;
  v9 = v6;
  v32 = v9;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v31);
  v10 = v39[3];
  value = v9->_w2i.__table_.__p2_.__value_;
  v12 = (uint64_t *)MEMORY[0x1E0CB2D50];
  if (v10 != value)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v70 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VocabSize in the file %lu does not match total vocabulary in file %lu"), v10, value);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v43[5];
    v43[5] = v16;

  }
  if (!v49[5] || !v61[5] || !v55[5])
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("One of <UnknownWord>, <BeginOfSentenceWord> or <EndOfSentenceWord> symbols are missing from file:%@"), v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v43[5];
    v43[5] = v21;

  }
  v23 = (void *)v43[5];
  if (v23)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v23);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease((id)v49[5]), "UTF8String"));
    v67 = __p;
    v9->_unkIndex = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v67)+ 5);
    if (v30 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease((id)v55[5]), "UTF8String"));
    v67 = __p;
    v9->_eosIndex = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v67)+ 5);
    if (v30 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease((id)v61[5]), "UTF8String"));
    v67 = __p;
    v9->_bosIndex = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v67)+ 5);
    if (v30 < 0)
      operator delete(__p[0]);
    objc_storeStrong((id *)&v9->_eosToken, (id)v55[5]);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  if (v23)
LABEL_20:
    v24 = 0;
  else
LABEL_21:
    v24 = v6;

  return v24;
}

- (unint64_t)indexForWord:(id)a3
{
  id v4;
  unint64_t *p_unkIndex;
  unint64_t v6;
  void *__p[2];
  char v9;
  void **v10;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  if (std::__hash_table<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>>>::find<std::string>(&self->_w2i.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p))
  {
    v10 = __p;
    p_unkIndex = (unint64_t *)(std::__hash_table<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10)+ 40);
  }
  else
  {
    p_unkIndex = &self->_unkIndex;
  }
  v6 = *p_unkIndex;
  if (v9 < 0)
    operator delete(__p[0]);

  return v6;
}

- (unint64_t)vocabSize
{
  return self->_w2i.__table_.__p2_.__value_;
}

- (unint64_t)endOfSentenceIndex
{
  return self->_eosIndex;
}

- (unint64_t)beginOfSentenceIndex
{
  return self->_bosIndex;
}

- (unint64_t)unknownWordIndex
{
  return self->_unkIndex;
}

- (id)endOfSentenceToken
{
  return self->_eosToken;
}

- (void).cxx_destruct
{
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_w2i);
  objc_storeStrong((id *)&self->_eosToken, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

@end
