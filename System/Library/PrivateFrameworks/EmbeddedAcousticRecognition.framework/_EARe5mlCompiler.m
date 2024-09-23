@implementation _EARe5mlCompiler

+ (void)compileWithModelMilPath:(id)a3 computePlatform:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (v9)
  {
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "compileWithModelMilPath:computePlatforms:completion:", v8, v11, v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("compute platform specified is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);

  }
}

+ (void)compileWithModelMilPath:(id)a3 computePlatforms:(id)a4 completion:(id)a5
{
  id v7;
  BOOL isEspressoV2Mil;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  std::vector<std::string>::pointer end;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  std::string *v19;
  std::string *v20;
  __int128 v21;
  std::string *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  _QWORD *v32;
  unsigned int v33;
  void **v34;
  void *v35;
  _QWORD *v36;
  unsigned int v37;
  void **v38;
  void *v39;
  void **v40;
  uint64_t v41;
  _QWORD *v42;
  void **v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  void **v52;
  unsigned int v53;
  void **v54;
  uint64_t v55;
  void (**v56)(id, void *);
  id v57;
  id obj;
  void *__p[2];
  std::string::size_type v60;
  std::__split_buffer<std::string> __v;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  std::vector<std::string> v66;
  void **v67;
  uint64_t v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v57 = a4;
  v56 = (void (**)(id, void *))a5;
  if (v7)
    objc_msgSend(v7, "ear_toString");
  else
    memset(&__v, 0, 24);
  isEspressoV2Mil = kaldi::quasar::isEspressoV2Mil((uint64_t *)&__v);
  v9 = isEspressoV2Mil;
  if (SHIBYTE(__v.__end_) < 0)
  {
    operator delete(__v.__first_);
    if (v9)
      goto LABEL_6;
LABEL_36:
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v73 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mil path is invalid: %@"), v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 3, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2](v56, v26);

    goto LABEL_71;
  }
  if (!isEspressoV2Mil)
    goto LABEL_36;
LABEL_6:
  if (v57 && objc_msgSend(v57, "count"))
  {
    memset(&v66, 0, sizeof(v66));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v57;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v63 != v11)
            objc_enumerationMutation(obj);
          v13 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqual:", CFSTR("CPU")) & 1) == 0
            && (objc_msgSend(v13, "isEqual:", CFSTR("GPU")) & 1) == 0
            && (objc_msgSend(v13, "isEqual:", CFSTR("ANE")) & 1) == 0)
          {
            kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&__v);
            v50 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__v, (uint64_t)"compilation platform not specified correctly: ", 46);
            if (v13)
            {
              objc_msgSend(v13, "ear_toString");
              v53 = HIBYTE(v60);
              v52 = (void **)__p[0];
              v51 = __p[1];
            }
            else
            {
              v51 = 0;
              v52 = 0;
              v53 = 0;
              __p[0] = 0;
              __p[1] = 0;
              v60 = 0;
            }
            if ((v53 & 0x80u) == 0)
              v54 = __p;
            else
              v54 = v52;
            if ((v53 & 0x80u) == 0)
              v55 = v53;
            else
              v55 = (uint64_t)v51;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v50, (uint64_t)v54, v55);
            if (SHIBYTE(v60) < 0)
              operator delete(__p[0]);
            kaldi::KaldiErrorMessage::~KaldiErrorMessage((kaldi::KaldiErrorMessage *)&__v);
          }
          if (v13)
          {
            objc_msgSend(v13, "ear_toString");
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            v60 = 0;
          }
          end = v66.__end_;
          if (v66.__end_ >= v66.__end_cap_.__value_)
          {
            v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v66.__end_ - (char *)v66.__begin_) >> 3);
            v17 = v16 + 1;
            if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v66.__end_cap_.__value_ - (char *)v66.__begin_) >> 3) > v17)
              v17 = 0x5555555555555556 * (((char *)v66.__end_cap_.__value_ - (char *)v66.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v66.__end_cap_.__value_ - (char *)v66.__begin_) >> 3) >= 0x555555555555555)
              v18 = 0xAAAAAAAAAAAAAAALL;
            else
              v18 = v17;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v66.__end_cap_;
            if (v18)
              v19 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v66.__end_cap_, v18);
            else
              v19 = 0;
            v20 = v19 + v16;
            __v.__first_ = v19;
            __v.__begin_ = v20;
            __v.__end_cap_.__value_ = &v19[v18];
            v21 = *(_OWORD *)__p;
            v20->__r_.__value_.__r.__words[2] = v60;
            *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
            __p[1] = 0;
            v60 = 0;
            __p[0] = 0;
            __v.__end_ = v20 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v66, &__v);
            v22 = v66.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v66.__end_ = v22;
          }
          else
          {
            v15 = *(_OWORD *)__p;
            v66.__end_->__r_.__value_.__r.__words[2] = v60;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v15;
            v66.__end_ = end + 1;
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v10);
    }

    if (v7)
      objc_msgSend(v7, "ear_toString");
    else
      memset(&__v, 0, 24);
    __p[0] = 0;
    __p[1] = 0;
    v60 = 0;
    v31 = kaldi::quasar::onDeviceCompile((uint64_t)&__v, (unsigned __int16 **)&v66, (uint64_t *)__p);
    v67 = __p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v67);
    if (SHIBYTE(__v.__end_) < 0)
      operator delete(__v.__first_);
    if (v31)
    {
      if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
      {
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&__v);
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__v, (uint64_t)"Compiling for model: ", 21);
        if (v7)
        {
          objc_msgSend(v7, "ear_toString");
          v33 = HIBYTE(v60);
          v34 = (void **)__p[0];
          v35 = __p[1];
        }
        else
        {
          v35 = 0;
          v34 = 0;
          v33 = 0;
          __p[0] = 0;
          __p[1] = 0;
          v60 = 0;
        }
        if ((v33 & 0x80u) == 0)
          v40 = __p;
        else
          v40 = v34;
        if ((v33 & 0x80u) == 0)
          v41 = v33;
        else
          v41 = (uint64_t)v35;
        v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)v40, v41);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)" is successful", 14);
        if (SHIBYTE(v60) < 0)
          operator delete(__p[0]);
        kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)&__v);
      }
      v56[2](v56, 0);
    }
    else
    {
      if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
      {
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&__v);
        v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__v, (uint64_t)"Compiling for model: ", 21);
        if (v7)
        {
          objc_msgSend(v7, "ear_toString");
          v37 = HIBYTE(v60);
          v38 = (void **)__p[0];
          v39 = __p[1];
        }
        else
        {
          v39 = 0;
          v38 = 0;
          v37 = 0;
          __p[0] = 0;
          __p[1] = 0;
          v60 = 0;
        }
        if ((v37 & 0x80u) == 0)
          v43 = __p;
        else
          v43 = v38;
        if ((v37 & 0x80u) == 0)
          v44 = v37;
        else
          v44 = (uint64_t)v39;
        v45 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)v43, v44);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)" failed", 7);
        if (SHIBYTE(v60) < 0)
          operator delete(__p[0]);
        kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)&__v);
      }
      v46 = (void *)MEMORY[0x1E0CB35C8];
      v68 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("On device compilation fail with mil: %@ and compute platform: %@"), v7, obj);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 0, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2](v56, v49);

    }
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v66;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("compute platforms specified are nil or empty"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 4, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2](v56, v30);

  }
LABEL_71:

}

+ (void)compileWithModelConfig:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  quasar::PTree *PtreeOptional;
  __int128 *v17;
  __int128 *v18;
  __int128 v19;
  std::string *v20;
  std::string::size_type v21;
  void *v22;
  std::string::size_type size;
  void *v24;
  std::string *v25;
  void **v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  std::string *v39;
  std::string::size_type v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  void **v49;
  uint64_t v50;
  void *v51;
  char Bool;
  void *v53;
  uint64_t v54;
  _QWORD v55[5];
  uint64_t v56[2];
  void *v57[2];
  unsigned __int8 v58;
  void *v59[2];
  __int128 v60;
  void (*v61)(uint64_t);
  id v62;
  void *__p;
  __int128 *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  unsigned __int8 v68;
  std::string v69;
  void **v70[193];
  __int128 *v71;
  __int128 *v72;
  uint64_t v73;
  void *v74;
  char v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v53 = v6;
  std::string::basic_string[abi:ne180100]<0>(&v74, "");
  v71 = 0;
  v72 = 0;
  v73 = 0;
  v8 = objc_msgSend(a1, "getMilPathWithModelConfig:files:", v6, &v71);
  if (v8 == 1)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v80 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mil file not found in: %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 2, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v15);

  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      v64 = 0;
      v65 = 0;
    }
    memset(&v69, 0, sizeof(v69));
    *(_OWORD *)v59 = 0u;
    v60 = 0u;
    LODWORD(v61) = 1065353216;
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v70, (uint64_t)&__p, (uint64_t *)&v69, (uint64_t)v59);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v59);
    v59[0] = &v69;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v59);
    if (SHIBYTE(v65) < 0)
      operator delete(__p);
    std::string::basic_string[abi:ne180100]<0>(v59, "misc-shared.mil-is-ane-ready-on-low-end-device-v2");
    PtreeOptional = (quasar::PTree *)quasar::SystemConfig::getPtreeOptional((uint64_t)v70, (uint64_t)v59);
    if (SBYTE7(v60) < 0)
      operator delete(v59[0]);
    if (PtreeOptional)
      Bool = quasar::PTree::getBool(PtreeOptional);
    else
      Bool = 0;
    v17 = v71;
    v18 = v72;
    if (v71 == v72)
    {
LABEL_83:
      v7[2](v7, 0);
    }
    else
    {
      v54 = *MEMORY[0x1E0CB2D50];
      while (1)
      {
        if (*((char *)v17 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v69, *(const std::string::value_type **)v17, *((_QWORD *)v17 + 1));
        }
        else
        {
          v19 = *v17;
          v69.__r_.__value_.__r.__words[2] = *((_QWORD *)v17 + 2);
          *(_OWORD *)&v69.__r_.__value_.__l.__data_ = v19;
        }
        v20 = (v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v69
            : (std::string *)v69.__r_.__value_.__r.__words[0];
        v21 = (v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v69.__r_.__value_.__r.__words[2])
            : v69.__r_.__value_.__l.__size_;
        objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "fileExistsAtPath:", v22) & 1) != 0)
        {
          if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v69.__r_.__value_.__r.__words[2]);
          else
            size = v69.__r_.__value_.__l.__size_;
          std::string::basic_string[abi:ne180100]((uint64_t)&v66, size + 7);
          if ((v68 & 0x80u) == 0)
            v24 = &v66;
          else
            v24 = v66;
          if (size)
          {
            if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v25 = &v69;
            else
              v25 = (std::string *)v69.__r_.__value_.__r.__words[0];
            memmove(v24, v25, size);
          }
          strcpy((char *)v24 + size, ".config");
          v26 = (v68 & 0x80u) == 0 ? &v66 : (void **)v66;
          v27 = (v68 & 0x80u) == 0 ? v68 : v67;
          objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "fileExistsAtPath:", v28) & 1) != 0)
          {
            kaldi::quasar::deduceComputePlatformsWithBestEffort((uint64_t)&v66, Bool, (uint64_t)&__p);
            if ((_BYTE)__p)
            {
              v29 = 3;
            }
            else
            {
              if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
              {
                kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v59);
                v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v59, (uint64_t)"Compiling E5ML mode mil path: ", 30);
                if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v39 = &v69;
                else
                  v39 = (std::string *)v69.__r_.__value_.__r.__words[0];
                if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v40 = HIBYTE(v69.__r_.__value_.__r.__words[2]);
                else
                  v40 = v69.__r_.__value_.__l.__size_;
                v41 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)v39, v40);
                v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)"\n", 1);
                v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"E5ML model config path: ", 24);
                if ((v68 & 0x80u) == 0)
                  v44 = &v66;
                else
                  v44 = v66;
                if ((v68 & 0x80u) == 0)
                  v45 = v68;
                else
                  v45 = v67;
                v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)v44, v45);
                v47 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v46, (uint64_t)"\n", 1);
                v48 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v47, (uint64_t)"E5ML compilation platform: ", 27);
                v56[0] = (uint64_t)"|";
                v56[1] = 1;
                quasar::join<std::vector<std::string>>((uint64_t *)&v64, v56);
                if ((v58 & 0x80u) == 0)
                  v49 = v57;
                else
                  v49 = (void **)v57[0];
                if ((v58 & 0x80u) == 0)
                  v50 = v58;
                else
                  v50 = (uint64_t)v57[1];
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)v49, v50);
                if ((char)v58 < 0)
                  operator delete(v57[0]);
                kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)v59);
              }
              EARHelpers::NSArrayOfStringFromVectorOfString(&v64);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v59[0] = 0;
              v59[1] = v59;
              *(_QWORD *)&v60 = 0x3032000000;
              *((_QWORD *)&v60 + 1) = __Block_byref_object_copy__3;
              v61 = __Block_byref_object_dispose__3;
              v62 = 0;
              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = __54___EARe5mlCompiler_compileWithModelConfig_completion___block_invoke;
              v55[3] = &unk_1E5D47430;
              v55[4] = v59;
              objc_msgSend(a1, "compileWithModelMilPath:computePlatforms:completion:", v22, v51, v55);
              if (*((_QWORD *)v59[1] + 5))
              {
                ((void (*)(void (**)(id, void *)))v7[2])(v7);
                v29 = 1;
              }
              else
              {
                v29 = 0;
              }
              _Block_object_dispose(v59, 8);

            }
            v59[0] = &v64;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v59);
          }
          else
          {
            v34 = (void *)MEMORY[0x1E0CB35C8];
            v76 = v54;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mil config file does not exist: %@"), v28);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = v35;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 5, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v37);

            v29 = 1;
          }

          if ((char)v68 < 0)
            operator delete(v66);
        }
        else
        {
          v30 = (void *)MEMORY[0x1E0CB35C8];
          v78 = v54;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mil file does not exist: %@"), v22);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 2, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v33);

          v29 = 1;
        }

        if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v69.__r_.__value_.__l.__data_);
        if (v29 != 3 && v29)
          break;
        v17 = (__int128 *)((char *)v17 + 24);
        if (v17 == v18)
          goto LABEL_83;
      }
    }
    quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v70);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("config file invalid: %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.espressoV2compilation"), 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
  v70[0] = (void **)&v71;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v70);
  if (v75 < 0)
    operator delete(v74);

}

+ (unint64_t)getMilPathWithModelConfig:(id)a3 files:(void *)a4
{
  id v5;
  void *v6;
  _QWORD *v7;
  void **v8;
  uint64_t v9;
  void ***v10;
  quasar::PTree *Ptree;
  __int128 *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *__p[2];
  uint64_t v19;
  std::string *v20;
  __int128 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25[2];
  unsigned __int8 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v14 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v5, "ear_toString");
  if ((kaldi::g_kaldi_verbose_level & 0x80000000) == 0)
  {
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v20);
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v20, (uint64_t)"Getting model config for compilation :", 38);
    if ((v26 & 0x80u) == 0)
      v8 = v25;
    else
      v8 = (void **)v25[0];
    if ((v26 & 0x80u) == 0)
      v9 = v26;
    else
      v9 = (uint64_t)v25[1];
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)v8, v9);
    kaldi::KaldiLogMessage::~KaldiLogMessage((kaldi::KaldiLogMessage *)&v20);
  }
  v22 = 0;
  v23 = 0;
  v24 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v19 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 1065353216;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&v20, (uint64_t)v25, (uint64_t *)__p, (uint64_t)&v27);
  v10 = (void ***)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v27);
  *(_QWORD *)&v27 = __p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v10);
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  Ptree = (quasar::PTree *)quasar::SystemConfig::getPtree((uint64_t)&v20, (uint64_t)__p);
  *(_QWORD *)&v27 = &unk_1E5D3D040;
  *((_QWORD *)&v27 + 1) = kaldi::quasar::isEspressoV2Mil;
  *((_QWORD *)&v28 + 1) = &v27;
  quasar::findLeafValuesWithCondition(Ptree, (uint64_t)&v27, &v22);
  v12 = (__int128 *)*((_QWORD *)&v28 + 1);
  if (*((__int128 **)&v28 + 1) == &v27)
  {
    v13 = 4;
    v12 = &v27;
    goto LABEL_15;
  }
  if (*((_QWORD *)&v28 + 1))
  {
    v13 = 5;
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)v12 + 8 * v13))();
  }
  if (SHIBYTE(v19) < 0)
    operator delete(__p[0]);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&v20);
  v15 = v22;
  for (i = v23; v15 != i; v15 += 24)
  {
    std::string::basic_string[abi:ne180100]<0>(&v27, ":,");
    quasar::splitStringSimple(v15, (uint64_t *)&v27, (uint64_t *)&v20);
    if (SBYTE7(v28) < 0)
      operator delete((void *)v27);
    std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((std::vector<std::string> *)a4, *((std::string **)a4 + 1), v20, v21, 0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (char *)v20) >> 3));
    *(_QWORD *)&v27 = &v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
  }
  if (*((_QWORD *)a4 + 1) == *(_QWORD *)a4)
    v14 = 1;
  else
    v14 = 2;
  v20 = (std::string *)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  if ((char)v26 < 0)
    operator delete(v25[0]);
LABEL_27:

  return v14;
}

@end
