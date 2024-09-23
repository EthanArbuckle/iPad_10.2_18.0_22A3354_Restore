@implementation _EARSpeechRecognition

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_tokenSausage, "hash");
  return -[NSArray hash](self->_interpretationIndices, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[NSArray isEqual:](self->_tokenSausage, "isEqual:", v4[1])
    && -[NSArray isEqual:](self->_interpretationIndices, "isEqual:", v4[2]))
  {
    v5 = -[NSSet isEqual:](self->_endsOfSentencePunctuations, "isEqual:", v4[4]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithTokenSausage:(id)a3 interpretationIndices:(id)a4 nBest:(id)a5 endsOfSentencePunctuations:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _EARSpeechRecognition *v14;
  uint64_t v15;
  NSArray *tokenSausage;
  uint64_t v17;
  NSArray *interpretationIndices;
  uint64_t v19;
  NSArray *nBest;
  uint64_t v21;
  NSSet *endsOfSentencePunctuations;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_EARSpeechRecognition;
  v14 = -[_EARSpeechRecognition init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    tokenSausage = v14->_tokenSausage;
    v14->_tokenSausage = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    interpretationIndices = v14->_interpretationIndices;
    v14->_interpretationIndices = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    nBest = v14->_nBest;
    v14->_nBest = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    endsOfSentencePunctuations = v14->_endsOfSentencePunctuations;
    v14->_endsOfSentencePunctuations = (NSSet *)v21;

  }
  return v14;
}

- (id)_initWithNBestList:(const void *)a3 useHatText:(BOOL)a4 endsOfSentencePunctuations:(id)a5
{
  id v8;
  id v9;
  void **v11[3];
  uint64_t v12;
  uint64_t *v13[3];
  void ***v14;

  v8 = a5;
  quasar::getTokenizedNBestListForEAR((uint64_t **)a3, a4, (uint64_t *)v13);
  quasar::getTokenizedTokenPhraseChoiceListForEAR(v13, 0, v11);
  v9 = -[_EARSpeechRecognition _initWithTokenPhraseChoiceList:nBestList:endsOfSentencePunctuations:](self, "_initWithTokenPhraseChoiceList:nBestList:endsOfSentencePunctuations:", v11, v13, v8);
  v14 = (void ***)&v12;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v14 = v11;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v11[0] = (void **)v13;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](v11);

  return v9;
}

- (id)_initWithTokenPhraseChoiceList:(const void *)a3 earNbest:(id)a4 endsOfSentencePunctuations:(id)a5
{
  uint64_t **v7;
  id v8;
  void *v9;
  uint64_t *v10;
  uint64_t *i;
  id v12;
  void *v13;
  const quasar::Token *v14;
  const quasar::Token *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  unsigned int *j;
  std::string::size_type size;
  void *v24;
  id v25;
  _QWORD *v27;
  id v28;
  id v29;
  uint64_t **v31;
  void *v32;
  uint64_t **v33;
  std::string v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  char v42;
  void *__p;
  char v44;
  const quasar::Token *v45;
  const quasar::Token *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  void **v51[2];

  v29 = a4;
  v28 = a5;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3)) >> 3));
  v7 = (uint64_t **)*((_QWORD *)a3 + 3);
  v27 = a3;
  v31 = (uint64_t **)*((_QWORD *)a3 + 4);
  if (v7 != v31)
  {
    do
    {
      v48 = 0;
      v49 = 0;
      v50 = 0;
      std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v48, *v7, v7[1], 0xAAAAAAAAAAAAAAABLL * (v7[1] - *v7));
      v33 = v7;
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v9 = (void *)objc_msgSend(v8, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v49 - v48));
      v10 = v48;
      for (i = v49; v10 != i; v10 += 3)
      {
        v45 = 0;
        v46 = 0;
        v47 = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v45, *v10, v10[1], 0x6DB6DB6DB6DB6DB7 * ((v10[1] - *v10) >> 5));
        v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v13 = (void *)objc_msgSend(v12, "initWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v46 - v45) >> 5));
        v15 = v45;
        v14 = v46;
        while (v15 != v14)
        {
          quasar::Token::Token(&v34, v15);
          v16 = -[_EARSpeechRecognitionToken _initWithQuasarToken:]([_EARSpeechRecognitionToken alloc], "_initWithQuasarToken:", &v34);
          objc_msgSend(v13, "addObject:", v16);

          if (v44 < 0)
            operator delete(__p);
          if (v42 < 0)
            operator delete(v41);
          v51[0] = (void **)&v40;
          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](v51);
          if (v39 < 0)
            operator delete(v38);
          v51[0] = (void **)&v37;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v51);
          if (v36 < 0)
            operator delete(v35);
          if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v34.__r_.__value_.__l.__data_);
          v15 = (const quasar::Token *)((char *)v15 + 224);
        }
        objc_msgSend(v9, "addObject:", v13);

        v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
      }
      objc_msgSend(v32, "addObject:", v9);

      v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
      std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
      v7 = v33 + 3;
    }
    while (v33 + 3 != v31);
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  v18 = *(_QWORD *)a3;
  v19 = v27[1];
  if (*v27 != v19)
  {
    do
    {
      memset(&v34, 0, sizeof(v34));
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v34, *(const void **)v18, *(_QWORD *)(v18 + 8), (uint64_t)(*(_QWORD *)(v18 + 8) - *(_QWORD *)v18) >> 2);
      v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v21 = (void *)objc_msgSend(v20, "initWithCapacity:", (uint64_t)(v34.__r_.__value_.__l.__size_ - v34.__r_.__value_.__r.__words[0]) >> 2);
      size = v34.__r_.__value_.__l.__size_;
      for (j = (unsigned int *)v34.__r_.__value_.__r.__words[0]; j != (unsigned int *)size; ++j)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v24);

      }
      objc_msgSend(v17, "addObject:", v21);

      if (v34.__r_.__value_.__r.__words[0])
      {
        v34.__r_.__value_.__l.__size_ = v34.__r_.__value_.__r.__words[0];
        operator delete(v34.__r_.__value_.__l.__data_);
      }
      v18 += 24;
    }
    while (v18 != v19);
  }
  v25 = -[_EARSpeechRecognition _initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:](self, "_initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:", v32, v17, v29, v28);

  return v25;
}

- (id)_initWithTokenPhraseChoiceList:(const void *)a3 nBestList:(const void *)a4 endsOfSentencePunctuations:(id)a5
{
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v16;

  v16 = a5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3));
  v7 = *(uint64_t **)a4;
  v8 = (uint64_t *)*((_QWORD *)a4 + 1);
  if (*(uint64_t **)a4 != v8)
  {
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v7[1] - *v7) >> 5));
      v11 = *v7;
      v10 = v7[1];
      while (v11 != v10)
      {
        v12 = -[_EARSpeechRecognitionToken _initWithQuasarToken:]([_EARSpeechRecognitionToken alloc], "_initWithQuasarToken:", v11);
        objc_msgSend(v9, "addObject:", v12);

        v11 += 224;
      }
      objc_msgSend(v6, "addObject:", v9);

      v7 += 3;
    }
    while (v7 != v8);
  }
  v13 = -[_EARSpeechRecognition _initWithTokenPhraseChoiceList:earNbest:endsOfSentencePunctuations:](self, "_initWithTokenPhraseChoiceList:earNbest:endsOfSentencePunctuations:", a3, v6, v16);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _EARSpeechRecognition *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = [_EARSpeechRecognition alloc];
  -[_EARSpeechRecognition tokenSausage](self, "tokenSausage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognition interpretationIndices](self, "interpretationIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognition nBest](self, "nBest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognition endsOfSentencePunctuations](self, "endsOfSentencePunctuations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_EARSpeechRecognition _initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:](v4, "_initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:", v5, v6, v7, v8);

  return v9;
}

- (id)oneBest
{
  void *v3;

  if (-[NSArray count](self->_nBest, "count"))
  {
    -[NSArray objectAtIndex:](self->_nBest, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

+ (id)tokens:(id)a3 alignedToTokens:(id)a4
{
  id v5;
  const quasar::Token **DestToks;
  void *v7;
  void *v9[26];
  uint64_t v10[3];
  uint64_t v11[3];

  v5 = a4;
  EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(a3, v11);
  EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v5, v10);
  quasar::Align::Align(v9, v10, v11, 2);
  DestToks = (const quasar::Token **)quasar::Align::getDestToks((quasar::Align *)v9);
  EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens(DestToks);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::Align::~Align(v9);
  v9[0] = v10;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  v9[0] = v11;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);

  return v7;
}

- (id)oneBestAlignedToTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_EARSpeechRecognition oneBest](self, "oneBest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EARSpeechRecognition tokens:alignedToTokens:](_EARSpeechRecognition, "tokens:alignedToTokens:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (pair<std::vector<std::vector<unsigned)_tokenPhraseChoiceList
{
  NSArray *v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  int v12;
  int v13;
  char *v14;
  void *v15;
  char *v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  int v23;
  NSArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  id v30;
  void *v31;
  unint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  pair<std::vector<std::vector<unsigned int>>, std::vector<std::vector<std::vector<quasar::Token>>>> *result;
  uint64_t v41;
  uint64_t v42;
  NSArray *v43;
  uint64_t j;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  NSArray *obj;
  uint64_t v52;
  char *v53;
  char *v54;
  id v55;
  __int128 v56;
  void *v57;
  uint64_t v58[3];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *__p[2];
  _OWORD v71[3];
  void **v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81[2];
  _OWORD v82[2];
  void *v83[2];
  _OWORD v84[2];
  void *v85[2];
  _OWORD v86[2];
  void *v87[2];
  __int128 v88;
  void *v89[2];
  _OWORD v90[2];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var0.var2.var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  v3 = self->_interpretationIndices;
  *(_QWORD *)&v67 = 0;
  v66 = 0uLL;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v3;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
  if (v4)
  {
    v52 = *(_QWORD *)v74;
    do
    {
      v5 = 0;
      v53 = (char *)v4;
      do
      {
        if (*(_QWORD *)v74 != v52)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v5);
        __p[1] = 0;
        *(_QWORD *)&v71[0] = 0;
        __p[0] = 0;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
        v54 = v5;
        if (v8)
        {
          v9 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v78 != v9)
                objc_enumerationMutation(v7);
              v11 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * i);
              v12 = objc_msgSend(v11, "unsignedIntValue");
              v13 = v12;
              v14 = (char *)__p[1];
              if (__p[1] >= (void *)*(_QWORD *)&v71[0])
              {
                v16 = (char *)__p[0];
                v17 = ((char *)__p[1] - (char *)__p[0]) >> 2;
                v18 = v17 + 1;
                if ((unint64_t)(v17 + 1) >> 62)
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                v19 = *(_QWORD *)&v71[0] - (unint64_t)__p[0];
                if ((uint64_t)(*(_QWORD *)&v71[0] - (unint64_t)__p[0]) >> 1 > v18)
                  v18 = v19 >> 1;
                if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
                  v20 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v20 = v18;
                if (v20)
                {
                  v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v71, v20);
                  v16 = (char *)__p[0];
                  v14 = (char *)__p[1];
                }
                else
                {
                  v21 = 0;
                }
                v22 = &v21[4 * v17];
                *(_DWORD *)v22 = v13;
                v15 = v22 + 4;
                while (v14 != v16)
                {
                  v23 = *((_DWORD *)v14 - 1);
                  v14 -= 4;
                  *((_DWORD *)v22 - 1) = v23;
                  v22 -= 4;
                }
                __p[0] = v22;
                __p[1] = v15;
                *(_QWORD *)&v71[0] = &v21[4 * v20];
                if (v16)
                  operator delete(v16);
              }
              else
              {
                *(_DWORD *)__p[1] = v12;
                v15 = v14 + 4;
              }
              __p[1] = v15;

            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
          }
          while (v8);
        }

        std::vector<std::vector<unsigned int>>::push_back[abi:ne180100]((uint64_t *)&v66, (uint64_t)__p);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        v5 = v54 + 1;
      }
      while (v54 + 1 != v53);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    }
    while (v4);
  }

  std::vector<std::vector<int>>::__vdeallocate((uint64_t *)retstr);
  *(_OWORD *)&retstr->var0.var0 = v66;
  retstr->var0.var2.var0 = (void *)v67;
  *(_QWORD *)&v67 = 0;
  v66 = 0uLL;
  v81[0] = &v66;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);
  v24 = self->_tokenSausage;
  v57 = 0;
  v56 = 0uLL;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v43 = v24;
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v59, &v73, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v60 != v42)
          objc_enumerationMutation(v43);
        v25 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * j);
        memset(v58, 0, sizeof(v58));
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v46 = v25;
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, &v77, 16);
        if (v48)
        {
          v47 = *(_QWORD *)v67;
          do
          {
            for (k = 0; k != v48; ++k)
            {
              if (*(_QWORD *)v67 != v47)
                objc_enumerationMutation(v46);
              v26 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * k);
              v64 = 0;
              v65 = 0;
              v63 = 0;
              *(_OWORD *)__p = 0u;
              memset(v71, 0, sizeof(v71));
              v55 = v26;
              v27 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", __p, v91, 16);
              if (v27)
              {
                v28 = **(_QWORD **)&v71[0];
                do
                {
                  for (m = 0; m != v27; ++m)
                  {
                    if (**(_QWORD **)&v71[0] != v28)
                      objc_enumerationMutation(v55);
                    v30 = *((id *)__p[1] + m);
                    v31 = v30;
                    if (v30)
                    {
                      objc_msgSend(v30, "quasarToken");
                    }
                    else
                    {
                      memset(v90, 0, sizeof(v90));
                      v88 = 0u;
                      *(_OWORD *)v89 = 0u;
                      *(_OWORD *)v87 = 0u;
                      *(_OWORD *)v85 = 0u;
                      memset(v86, 0, sizeof(v86));
                      memset(v84, 0, sizeof(v84));
                      *(_OWORD *)v83 = 0u;
                      *(_OWORD *)v81 = 0u;
                      memset(v82, 0, sizeof(v82));
                    }

                    v32 = v64;
                    if (v64 >= v65)
                    {
                      v64 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v63, (__int128 *)v81);
                      if (SBYTE7(v90[0]) < 0)
                        operator delete(v89[0]);
                    }
                    else
                    {
                      v33 = *(_OWORD *)v81;
                      *(_QWORD *)(v64 + 16) = *(_QWORD *)&v82[0];
                      *(_OWORD *)v32 = v33;
                      *(_QWORD *)&v82[0] = 0;
                      v81[1] = 0;
                      v81[0] = 0;
                      v34 = *(_QWORD *)((char *)&v82[1] + 6);
                      *(_OWORD *)(v32 + 24) = *(_OWORD *)((char *)v82 + 8);
                      *(_QWORD *)(v32 + 38) = v34;
                      v35 = *(_QWORD *)&v84[0];
                      *(_OWORD *)(v32 + 48) = *(_OWORD *)v83;
                      *(_QWORD *)(v32 + 64) = v35;
                      *(_QWORD *)(v32 + 72) = 0;
                      v83[1] = 0;
                      *(_QWORD *)&v84[0] = 0;
                      v83[0] = 0;
                      *(_QWORD *)(v32 + 80) = 0;
                      *(_QWORD *)(v32 + 88) = 0;
                      *(_OWORD *)(v32 + 72) = *(_OWORD *)((char *)v84 + 8);
                      *(_QWORD *)(v32 + 88) = *((_QWORD *)&v84[1] + 1);
                      memset((char *)v84 + 8, 0, 24);
                      v36 = *(_OWORD *)v85;
                      *(_QWORD *)(v32 + 112) = *(_QWORD *)&v86[0];
                      *(_QWORD *)(v32 + 120) = 0;
                      *(_OWORD *)(v32 + 96) = v36;
                      v85[1] = 0;
                      *(_QWORD *)&v86[0] = 0;
                      v85[0] = 0;
                      *(_QWORD *)(v32 + 128) = 0;
                      *(_QWORD *)(v32 + 136) = 0;
                      *(_OWORD *)(v32 + 120) = *(_OWORD *)((char *)v86 + 8);
                      *(_QWORD *)(v32 + 136) = *((_QWORD *)&v86[1] + 1);
                      memset((char *)v86 + 8, 0, 24);
                      v37 = *(_OWORD *)v87;
                      *(_QWORD *)(v32 + 160) = v88;
                      *(_OWORD *)(v32 + 144) = v37;
                      v87[1] = 0;
                      *(_QWORD *)&v88 = 0;
                      v87[0] = 0;
                      LODWORD(v35) = DWORD2(v88);
                      *(_WORD *)(v32 + 172) = WORD6(v88);
                      *(_DWORD *)(v32 + 168) = v35;
                      v38 = *(_OWORD *)v89;
                      *(_QWORD *)(v32 + 192) = *(_QWORD *)&v90[0];
                      *(_OWORD *)(v32 + 176) = v38;
                      v89[1] = 0;
                      *(_QWORD *)&v90[0] = 0;
                      v89[0] = 0;
                      v39 = *(_OWORD *)((char *)v90 + 8);
                      *(_DWORD *)(v32 + 216) = DWORD2(v90[1]);
                      *(_OWORD *)(v32 + 200) = v39;
                      v64 = v32 + 224;
                    }
                    if (SBYTE7(v88) < 0)
                      operator delete(v87[0]);
                    v72 = (void **)v86 + 1;
                    std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v72);
                    if (SBYTE7(v86[0]) < 0)
                      operator delete(v85[0]);
                    v72 = (void **)v84 + 1;
                    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v72);
                    if (SBYTE7(v84[0]) < 0)
                      operator delete(v83[0]);
                    if (SBYTE7(v82[0]) < 0)
                      operator delete(v81[0]);

                  }
                  v27 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", __p, v91, 16);
                }
                while (v27);
              }

              std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v58, (uint64_t)&v63);
              v81[0] = &v63;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);

            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, &v77, 16);
          }
          while (v48);
        }

        std::vector<std::vector<std::vector<quasar::Token>>>::push_back[abi:ne180100]((uint64_t *)&v56, (uint64_t)v58);
        v81[0] = v58;
        std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);

      }
      v41 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v59, &v73, 16);
    }
    while (v41);
  }

  std::vector<std::vector<std::vector<quasar::Token>>>::__vdeallocate((void ***)&retstr->var1);
  *(_OWORD *)&retstr->var1.var0 = v56;
  retstr->var1.var2.var0 = v57;
  v57 = 0;
  v56 = 0uLL;
  v81[0] = &v56;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);
  return result;
}

- (id)granularizedRecognition
{
  _EARSpeechRecognition *v3;
  id v4;
  _QWORD v6[3];
  uint64_t v7;
  _BYTE v8[24];
  uint64_t v9;
  void **v10;

  v3 = [_EARSpeechRecognition alloc];
  -[_EARSpeechRecognition _tokenPhraseChoiceList](self, "_tokenPhraseChoiceList");
  quasar::TextProc::GranularizedTokenPhraseChoiceList(v6, (uint64_t)v8);
  v4 = -[_EARSpeechRecognition _initWithTokenPhraseChoiceList:earNbest:endsOfSentencePunctuations:](v3, "_initWithTokenPhraseChoiceList:earNbest:endsOfSentencePunctuations:", v8, self->_nBest, self->_endsOfSentencePunctuations);
  v10 = (void **)&v9;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100](&v10);
  v10 = (void **)v8;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v10);
  v10 = (void **)&v7;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100](&v10);
  v10 = (void **)v6;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v10);
  return v4;
}

- (id)potentialPrecedingRecognition
{
  return -[_EARSpeechRecognition splitRecognitionWithPotentialCommandRecognition:](self, "splitRecognitionWithPotentialCommandRecognition:", 0);
}

- (id)potentialCommandRecognition
{
  return -[_EARSpeechRecognition splitRecognitionWithPotentialCommandRecognition:](self, "splitRecognitionWithPotentialCommandRecognition:", 1);
}

- (id)adjustSpaceForTokens:(id)a3 currTokenIndex:(unint64_t)a4 endsOfSentencePunctuations:(id)a5 isPotentialCommandRecognition:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  _EARSpeechRecognitionToken *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _EARSpeechRecognitionToken *v51;
  id v52;

  v6 = a6;
  v9 = a3;
  v52 = a5;
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (a4 + 1 < objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "appendedAutoPunctuation"))
    {
      if (v6)
      {

      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", a4 + 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tokenName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v52, "containsObject:", v14);

        if ((v15 & 1) != 0)
          goto LABEL_8;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", a4 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = [_EARSpeechRecognitionToken alloc];
      objc_msgSend(v11, "tokenName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "start");
      v18 = v17;
      objc_msgSend(v11, "end");
      v20 = v19;
      objc_msgSend(v11, "silenceStart");
      v22 = v21;
      objc_msgSend(v11, "confidence");
      v24 = v23;
      v25 = objc_msgSend(v12, "hasSpaceAfter");
      v26 = objc_msgSend(v11, "hasSpaceBefore");
      objc_msgSend(v11, "phoneSequence");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ipaPhoneSequence");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_EARSpeechRecognitionToken initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:](v51, "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:", v16, v25, v26, v27, v28, v18, v20, v22, v24);

      v11 = (void *)v29;
    }

  }
LABEL_8:
  if (a4)
  {
    v30 = a4 - 1;
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4 - 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v31, "prependedAutoPunctuation"))
    {
LABEL_14:

      goto LABEL_15;
    }
    if (v6)
    {

LABEL_13:
      objc_msgSend(v9, "objectAtIndexedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = [_EARSpeechRecognitionToken alloc];
      objc_msgSend(v11, "tokenName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "start");
      v38 = v37;
      objc_msgSend(v11, "end");
      v40 = v39;
      objc_msgSend(v11, "silenceStart");
      v42 = v41;
      objc_msgSend(v11, "confidence");
      v44 = v43;
      v45 = objc_msgSend(v11, "hasSpaceAfter");
      v46 = objc_msgSend(v31, "hasSpaceBefore");
      objc_msgSend(v11, "phoneSequence");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ipaPhoneSequence");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_EARSpeechRecognitionToken initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:](v35, "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:", v36, v45, v46, v47, v48, v38, v40, v42, v44);

      v11 = (void *)v49;
      goto LABEL_14;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "tokenName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v52, "containsObject:", v33);

    if ((v34 & 1) == 0)
      goto LABEL_13;
  }
LABEL_15:

  return v11;
}

- (id)splitRecognitionWithPotentialCommandRecognition:(BOOL)a3
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  id v31;
  id v32;
  void *v33;
  void *v35;
  _BOOL4 v36;
  NSArray *v38;
  id obj;
  id obja;
  _QWORD v41[5];
  id v42;
  __int128 *v43;
  BOOL v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v36 = a3;
  v82 = *MEMORY[0x1E0C80C00];
  if (quasar::gLogLevel >= 5)
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v61 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v61);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v61, (uint64_t)"Voice Command: tokenSausage count:", 34);
    -[NSArray count](self->_tokenSausage, "count");
    std::ostream::operator<<();
    quasar::QuasarDebugMessage::~QuasarDebugMessage((quasar::QuasarDebugMessage *)&v61);
  }
  v3 = -[NSArray count](self->_tokenSausage, "count");
  if (v3 < 2)
  {
LABEL_27:
    if (v36)
      v20 = -[_EARSpeechRecognition _initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:]([_EARSpeechRecognition alloc], "_initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:", self->_tokenSausage, self->_interpretationIndices, self->_nBest, self->_endsOfSentencePunctuations);
    else
      v20 = 0;
    return v20;
  }
  v4 = (v3 - 2);
  while (1)
  {
    -[NSArray objectAtIndex:](self->_tokenSausage, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
    if (v6)
      break;

LABEL_25:
    if (v4-- <= 0)
      goto LABEL_27;
  }
  v7 = *(_QWORD *)v58;
  v8 = -1;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v58 != v7)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v80, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v54;
        while (2)
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v54 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            objc_msgSend(v15, "end");
            v17 = v16;
            objc_msgSend(v15, "silenceStart");
            if (v17 - v18 >= 1.0)
            {
              v8 = v4;
              goto LABEL_20;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v80, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_20:

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
  }
  while (v6);

  if (v8 == -1)
    goto LABEL_25;
  v21 = v8 + 1;
  if (v36)
  {
    v22 = v8 + 1;
    v21 = -[NSArray count](self->_tokenSausage, "count") + ~v8;
  }
  else
  {
    v22 = 0;
  }
  -[NSArray subarrayWithRange:](self->_tokenSausage, "subarrayWithRange:", v22, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = self->_interpretationIndices;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v79, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "subarrayWithRange:", v22, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v27 = obja;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v78, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v46;
          while (2)
          {
            for (m = 0; m != v28; ++m)
            {
              if (*(_QWORD *)v46 != v29)
                objc_enumerationMutation(v27);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * m), "isEqualToArray:", v26) & 1) != 0)
              {

                goto LABEL_48;
              }
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v78, 16);
            if (v28)
              continue;
            break;
          }
        }

        objc_msgSend(v27, "addObject:", v26);
LABEL_48:

      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v79, 16);
    }
    while (v23);
  }

  *(_QWORD *)&v61 = 0;
  *((_QWORD *)&v61 + 1) = &v61;
  *(_QWORD *)&v62 = 0x3032000000;
  *((_QWORD *)&v62 + 1) = __Block_byref_object_copy__2;
  *(_QWORD *)&v63 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v35, "count"));
  *((_QWORD *)&v63 + 1) = objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke;
  v41[3] = &unk_1E5D46EE8;
  v44 = v36;
  v41[4] = self;
  v31 = v35;
  v42 = v31;
  v43 = &v61;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v41);
  v32 = *(id *)(*((_QWORD *)&v61 + 1) + 40);

  +[_EARSpeechRecognition reconstructNBestFromSausage:interpretationIndices:](_EARSpeechRecognition, "reconstructNBestFromSausage:interpretationIndices:", v32, obja);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_EARSpeechRecognition _initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:]([_EARSpeechRecognition alloc], "_initWithTokenSausage:interpretationIndices:nBest:endsOfSentencePunctuations:", v32, obja, v33, self->_endsOfSentencePunctuations);

  _Block_object_dispose(&v61, 8);
  return v20;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<tokenSausage = %@, interpretationIndices = %@>"), self->_tokenSausage, self->_interpretationIndices);
}

+ (id)reconstructNBestFromSausage:(id)a3 interpretationIndices:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = a4;
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v16;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "count", v16);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
        if (v9)
        {
          for (j = 0; j != v9; ++j)
          {
            objc_msgSend(v8, "objectAtIndex:", j);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndex:", j);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndex:", (int)objc_msgSend(v12, "intValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObjectsFromArray:", v14);
          }
        }
        objc_msgSend(v19, "addObject:", v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v19;
}

- (NSArray)tokenSausage
{
  return self->_tokenSausage;
}

- (void)setTokenSausage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)interpretationIndices
{
  return self->_interpretationIndices;
}

- (NSArray)nBest
{
  return self->_nBest;
}

- (NSSet)endsOfSentencePunctuations
{
  return self->_endsOfSentencePunctuations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endsOfSentencePunctuations, 0);
  objc_storeStrong((id *)&self->_nBest, 0);
  objc_storeStrong((id *)&self->_interpretationIndices, 0);
  objc_storeStrong((id *)&self->_tokenSausage, 0);
}

@end
