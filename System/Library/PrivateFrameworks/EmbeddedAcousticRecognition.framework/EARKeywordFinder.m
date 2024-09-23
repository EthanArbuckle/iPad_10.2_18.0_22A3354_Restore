@implementation EARKeywordFinder

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (EARKeywordFinder)initWithConfiguration:(id)a3
{
  id v4;
  EARKeywordFinder *v5;
  char *v6;
  quasar::KeywordFinder *v7;
  uint64_t value;
  EARKeywordFinder *v9;
  objc_super v11;
  void *__p[2];
  char v13;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EARKeywordFinder;
  v5 = -[EARKeywordFinder init](&v11, sel_init);
  if (!v5)
    goto LABEL_7;
  v6 = (char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
  v7 = (quasar::KeywordFinder *)operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, v6);
  quasar::KeywordFinder::KeywordFinder(v7, __p);
  if (v13 < 0)
    operator delete(__p[0]);
  value = (uint64_t)v5->_kwf.__ptr_.__value_;
  v5->_kwf.__ptr_.__value_ = (KeywordFinder *)v7;
  if (value)
  {
    std::default_delete<quasar::KeywordFinder>::operator()[abi:ne180100]((uint64_t)&v5->_kwf, value);
    v7 = (quasar::KeywordFinder *)v5->_kwf.__ptr_.__value_;
  }
  if ((quasar::KeywordFinder::init(v7) & 1) == 0)
    v9 = 0;
  else
LABEL_7:
    v9 = v5;

  return v9;
}

- (id)correctedResultWithKeyword:(id)a3 tokenizedKeyword:(id)a4 preItnSausage:(id)a5 preItnOneBest:(id)a6 preItnOneBestIndices:(id)a7 nbestSize:(int64_t)a8
{
  int v8;
  id v14;
  KeywordFinder *value;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  unint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  int v31;
  int v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  int v42;
  uint64_t *v43;
  uint64_t *v44;
  void *v45;
  const quasar::Token *v46;
  const quasar::Token *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v53;
  void *v54;
  int v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  id obj;
  void *v63;
  char *v64;
  char *v65;
  std::string v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  void *v70[2];
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *__p[2];
  _OWORD v78[2];
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  std::string v85;
  void *v86;
  char v87;
  uint64_t v88;
  void *v89;
  char v90;
  uint64_t v91;
  void *v92;
  char v93;
  void *v94;
  char v95;
  uint64_t v96;

  v8 = a8;
  v96 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v57 = a4;
  v58 = a5;
  v59 = a6;
  v56 = a7;
  value = self->_kwf.__ptr_.__value_;
  v53 = v14;
  if (v14)
  {
    objc_msgSend(v14, "ear_toString", v14);
  }
  else
  {
    v70[0] = 0;
    v70[1] = 0;
    v71 = 0;
  }
  v60 = (uint64_t)value;
  v16 = v57;
  v68 = 0;
  v69 = 0;
  v67 = 0;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, &v85, 16);
  v55 = v8;
  if (v17)
  {
    v18 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v82 != v18)
          objc_enumerationMutation(obj);
        v20 = *(id *)(*((_QWORD *)&v81 + 1) + 8 * i);
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "_quasarProns");
        }
        else
        {
          v80 = 0;
          v79 = 0u;
          *(_OWORD *)__p = 0u;
          memset(v78, 0, sizeof(v78));
        }

        v22 = v68;
        if (v68 >= v69)
        {
          v24 = std::vector<quasar::G2P::TokenProns>::__push_back_slow_path<quasar::G2P::TokenProns>(&v67, (uint64_t)__p);
        }
        else
        {
          v23 = *(_OWORD *)__p;
          *(_QWORD *)(v68 + 16) = *(_QWORD *)&v78[0];
          *(_QWORD *)(v22 + 24) = 0;
          *(_OWORD *)v22 = v23;
          __p[1] = 0;
          *(_QWORD *)&v78[0] = 0;
          __p[0] = 0;
          *(_QWORD *)(v22 + 32) = 0;
          *(_QWORD *)(v22 + 40) = 0;
          *(_OWORD *)(v22 + 24) = *(_OWORD *)((char *)v78 + 8);
          *((_QWORD *)&v78[0] + 1) = 0;
          *(_QWORD *)&v78[1] = 0;
          *(_QWORD *)(v22 + 40) = *((_QWORD *)&v78[1] + 1);
          *(_QWORD *)(v22 + 48) = 0;
          *((_QWORD *)&v78[1] + 1) = 0;
          *(_QWORD *)(v22 + 56) = 0;
          *(_QWORD *)(v22 + 64) = 0;
          *(_OWORD *)(v22 + 48) = v79;
          *(_QWORD *)(v22 + 64) = v80;
          v79 = 0uLL;
          v80 = 0;
          v24 = v22 + 72;
        }
        v68 = v24;
        v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v79;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v66);
        v66.__r_.__value_.__r.__words[0] = (std::string::size_type)v78 + 8;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v66);
        if (SBYTE7(v78[0]) < 0)
          operator delete(__p[0]);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, &v85, 16);
    }
    while (v17);
  }

  EARHelpers::ArrayToVector2<std::vector<quasar::Token>,std::vector<quasar::Token> (*)(NSArray<_EARSpeechRecognitionToken *> *)>(v58, (void (*)(_QWORD *__return_ptr))EARHelpers::QuasarResultFromEARSpeechRecognitionTokens, (uint64_t *)&v81);
  EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v59, (uint64_t *)&v66);
  v25 = v56;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  *(_OWORD *)__p = 0u;
  memset(v78, 0, sizeof(v78));
  v79 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __p, &v85, 16);
  if (v27)
  {
    v28 = **(_QWORD **)&v78[0];
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (**(_QWORD **)&v78[0] != v28)
          objc_enumerationMutation(v26);
        v30 = *((id *)__p[1] + j);
        v31 = objc_msgSend(v30, "intValue");
        v32 = v31;
        v33 = v64;
        if (v64 >= v65)
        {
          v35 = (char *)v63;
          v36 = (v64 - (_BYTE *)v63) >> 2;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v38 = v65 - (_BYTE *)v63;
          if ((v65 - (_BYTE *)v63) >> 1 > v37)
            v37 = v38 >> 1;
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v37;
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v65, v39);
            v35 = (char *)v63;
            v33 = v64;
          }
          else
          {
            v40 = 0;
          }
          v41 = &v40[4 * v36];
          *(_DWORD *)v41 = v32;
          v34 = v41 + 4;
          while (v33 != v35)
          {
            v42 = *((_DWORD *)v33 - 1);
            v33 -= 4;
            *((_DWORD *)v41 - 1) = v42;
            v41 -= 4;
          }
          v63 = v41;
          v64 = v34;
          v65 = &v40[4 * v39];
          if (v35)
            operator delete(v35);
        }
        else
        {
          *(_DWORD *)v64 = v31;
          v34 = v33 + 4;
        }
        v64 = v34;

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __p, &v85, 16);
    }
    while (v27);
  }

  quasar::KeywordFinder::correctResultWithKeyword(v60, (uint64_t)v70, &v67, (uint64_t *)&v81, &v66, &v63, v55, (uint64_t)&v72);
  if (v63)
  {
    v64 = (char *)v63;
    operator delete(v63);
  }
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v66;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v81;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v67;
  std::vector<quasar::G2P::TokenProns>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  if (SHIBYTE(v71) < 0)
    operator delete(v70[0]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v53);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v72;
  if (v72 != v73)
  {
    v44 = v73;
    do
    {
      __p[0] = 0;
      __p[1] = 0;
      *(_QWORD *)&v78[0] = 0;
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(__p, *v43, v43[1], 0x6DB6DB6DB6DB6DB7 * ((v43[1] - *v43) >> 5));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (const quasar::Token *)__p[0];
      v46 = (const quasar::Token *)__p[1];
      while (v47 != v46)
      {
        quasar::Token::Token(&v85, v47);
        v48 = -[_EARSpeechRecognitionToken _initWithQuasarToken:]([_EARSpeechRecognitionToken alloc], "_initWithQuasarToken:", &v85);
        objc_msgSend(v45, "addObject:", v48);

        if (v95 < 0)
          operator delete(v94);
        if (v93 < 0)
          operator delete(v92);
        *(_QWORD *)&v81 = &v91;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
        if (v90 < 0)
          operator delete(v89);
        *(_QWORD *)&v81 = &v88;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
        if (v87 < 0)
          operator delete(v86);
        if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v85.__r_.__value_.__l.__data_);
        v47 = (const quasar::Token *)((char *)v47 + 224);
      }
      v49 = (void *)objc_msgSend(v45, "copy");

      objc_msgSend(v61, "addObject:", v49);
      v85.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
      v43 += 3;
    }
    while (v43 != v44);
  }
  v50 = (void *)objc_msgSend(v61, "copy");

  v51 = -[EARKeywordFinderResult _initWithCorrectedUtterances:]([EARKeywordFinderResult alloc], "_initWithCorrectedUtterances:", v50);
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v76;
  std::vector<quasar::KeywordFinder::KeywordLocationLoggingStats>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v75;
  std::vector<quasar::KeywordFinder::KeywordLoggingStats>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v74;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  v85.__r_.__value_.__r.__words[0] = (std::string::size_type)&v72;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);

  return v51;
}

- (void).cxx_destruct
{
  unique_ptr<quasar::KeywordFinder, std::default_delete<quasar::KeywordFinder>> *p_kwf;
  uint64_t v3;
  KeywordFinder *value;

  value = self->_kwf.__ptr_.__value_;
  p_kwf = &self->_kwf;
  v3 = (uint64_t)value;
  p_kwf->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<quasar::KeywordFinder>::operator()[abi:ne180100]((uint64_t)p_kwf, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
