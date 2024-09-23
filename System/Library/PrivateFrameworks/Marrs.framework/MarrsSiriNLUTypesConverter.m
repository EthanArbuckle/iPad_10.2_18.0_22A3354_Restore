@implementation MarrsSiriNLUTypesConverter

+ (basic_string<char,)NSString2StdString:(std::allocator<char>> *__return_ptr)retstr
{
  void *v1;
  id v3;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  id v5;

  v3 = v1;
  v5 = v3;
  if (v3)
    std::string::basic_string[abi:ne180100]<0>(retstr, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  else
    std::string::basic_string[abi:ne180100]<0>(retstr, "");

  return result;
}

+ (vector<std::string,)NSMutableArrayNSString2StdVectorStdString:(id)a2
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char *var0;
  char *var1;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  std::string *v17;
  void *v18;
  vector<std::string, std::allocator<std::string>> *result;
  id obj;
  void *__p[2];
  std::string::size_type v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  std::__split_buffer<std::string> __v;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (v5)
  {
    std::vector<std::string>::reserve((std::vector<std::string> *)retstr, objc_msgSend(v5, "count"));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            v12 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            v13 = v12 + 1;
            if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v14 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v14 > v13)
              v13 = 2 * v14;
            if (v14 >= 0x555555555555555)
              v15 = 0xAAAAAAAAAAAAAAALL;
            else
              v15 = v13;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->var2;
            if (v15)
              v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v15);
            else
              v16 = 0;
            v17 = (std::string *)(v15 + 24 * v12);
            __v.__first_ = (std::__split_buffer<std::string>::pointer)v15;
            __v.__begin_ = v17;
            __v.__end_cap_.__value_ = (std::string *)(v15 + 24 * v16);
            v17->__r_.__value_.__r.__words[2] = v22;
            *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            v22 = 0;
            *(_OWORD *)__p = 0uLL;
            __v.__end_ = v17 + 1;
            std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
            v18 = retstr->var1;
            std::__split_buffer<std::string>::~__split_buffer(&__v);
            retstr->var1 = v18;
          }
          else
          {
            *((_QWORD *)var1 + 2) = v22;
            *(_OWORD *)var1 = *(_OWORD *)__p;
            retstr->var1 = var1 + 24;
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

  }
  return result;
}

+ (id)stdString2NSString:()basic_string<char
{
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", var0);
}

+ (id)StdVectorStdString2NSMutableArrayNSString:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  void *v4;
  std::string *var0;
  void *var1;
  int v7;
  void *v8;
  std::string __p;
  std::string v11;

  v4 = (void *)objc_opt_new();
  var0 = (std::string *)a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      if (SHIBYTE(var0->__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v11, var0->__r_.__value_.__l.__data_, var0->__r_.__value_.__l.__size_);
      else
        v11 = *var0;
      v7 = SHIBYTE(v11.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
      else
        __p = v11;
      +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &__p);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v7 < 0)
LABEL_13:
          operator delete(v11.__r_.__value_.__l.__data_);
      }
      else if (v7 < 0)
      {
        goto LABEL_13;
      }
      ++var0;
    }
    while (var0 != var1);
  }
  return v4;
}

+ (int)fromPluginRepetitionType:(int)a3
{
  if (a3 >= 4)
    return 1;
  else
    return a3;
}

+ (int)fromPluginRewriteType:(int)a3
{
  return a3 == 1;
}

+ (Uuid)toPluginUuid:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  Uuid result;

  v3 = a3;
  v4 = objc_msgSend(v3, "highInt");
  v5 = objc_msgSend(v3, "lowInt");

  v6 = v4;
  v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

+ (id)fromPluginUuid:(Uuid)a3
{
  unint64_t var1;
  unint64_t var0;
  id v5;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
  objc_msgSend(v5, "setLowInt:", var1);
  objc_msgSend(v5, "setHighInt:", var0);
  return v5;
}

+ (QRToken)toPluginToken:(QRToken *__return_ptr)retstr
{
  void *v1;
  id v3;
  void *v4;
  char *v5;
  void *v6;
  void **p_var1;
  QRToken *result;
  void *__p[2];
  unint64_t v10;

  v3 = v1;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v4);
  marrs::qr::orchestration::QRToken::QRToken((std::string *)retstr, (__int128 *)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  retstr[1].var0.var0.var1.var0[1] = objc_msgSend(v3, "startIndex");
  retstr[1].var0.var0.var1.var0[2] = objc_msgSend(v3, "endIndex");
  objc_msgSend(v3, "asrConfidence");
  retstr[2].var0.var0.var0.var0.var1.var0 = v5;
  objc_msgSend(v3, "phoneSequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v6);
  p_var1 = (void **)&retstr[2].var0.var0.var0.var0.var1.var1;
  if (SHIBYTE(retstr[2].var0.var0.var1.var0[0]) < 0)
    operator delete(*p_var1);
  *(_OWORD *)p_var1 = *(_OWORD *)__p;
  retstr[2].var0.var0.var1.var0[0] = v10;
  HIBYTE(v10) = 0;
  LOBYTE(__p[0]) = 0;

  LOBYTE(retstr[2].var0.var0.var1.var0[1]) = objc_msgSend(v3, "removeSpaceAfter");
  return result;
}

+ (QRToken)internalTokentoPluginToken:(QRToken *__return_ptr)retstr
{
  void *v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  QRToken *result;
  __int128 *v8[3];
  __int128 __p;
  char v10;
  __int128 v11;
  char v12;
  __int128 **v13;

  v3 = v1;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v4);
  objc_msgSend(v3, "cleanValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v5);
  objc_msgSend(v3, "normalizedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSMutableArrayNSString2StdVectorStdString:](MarrsSiriNLUTypesConverter, "NSMutableArrayNSString2StdVectorStdString:", v6);
  marrs::qr::orchestration::QRToken::QRToken((std::string *)retstr, &v11, &__p, v8, objc_msgSend(v3, "isSignificant"), objc_msgSend(v3, "isWhitespace"));
  v13 = v8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);

  if (v10 < 0)
    operator delete((void *)__p);

  if (v12 < 0)
    operator delete((void *)v11);

  retstr[1].var0.var0.var1.var0[1] = (int)objc_msgSend(v3, "begin");
  retstr[1].var0.var0.var1.var0[2] = (int)objc_msgSend(v3, "end");
  retstr[2].var0.var0.var0.var0.var1.var0 = (char *)0x408F400000000000;
  MEMORY[0x1C3BC59A0](&retstr[2].var0.var0.var0.var0.var1.var1, "");
  LOBYTE(retstr[2].var0.var0.var1.var0[1]) = 0;

  return result;
}

+ (id)fromPluginToken:(QRToken *)a3
{
  id v4;
  void *v5;
  void *v6;
  std::string __p;
  std::string var0;

  v4 = objc_alloc_init(MEMORY[0x1E0D9FA30]);
  if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
  else
    var0 = (std::string)a3->var0.var0.var0;
  +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0)
    operator delete(var0.__r_.__value_.__l.__data_);
  objc_msgSend(v4, "setStartIndex:", LODWORD(a3[1].var0.var0.var1.var0[1]));
  objc_msgSend(v4, "setEndIndex:", LODWORD(a3[1].var0.var0.var1.var0[2]));
  objc_msgSend(v4, "setAsrConfidence:", *(double *)&a3[2].var0.var0.var0.var0.var1.var0);
  if (SHIBYTE(a3[2].var0.var0.var1.var0[0]) < 0)
    std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)a3[2].var0.var0.var0.var0.var1.var1, *((_QWORD *)&a3[2].var0.var0.var0.var0.var1 + 2));
  else
    __p = *(std::string *)((char *)&a3[2].var0.var0.var0 + 8);
  +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &__p);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneSequence:", v6);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(v4, "setRemoveSpaceAfter:", LOBYTE(a3[2].var0.var0.var1.var0[1]), *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  return v4;
}

+ (id)internalTokenfromPluginToken:(QRToken *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  std::string v9;
  std::string var1;
  std::string var0;
  std::string *v12;

  v4 = objc_alloc_init(MEMORY[0x1E0D9FA98]);
  if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
  else
    var0 = (std::string)a3->var0.var0.var0;
  +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0)
    operator delete(var0.__r_.__value_.__l.__data_);
  if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0)
    std::string::__init_copy_ctor_external(&var1, (const std::string::value_type *)a3->var0.var0.var1.var0[0], a3->var0.var0.var1.var0[1]);
  else
    var1 = (std::string)a3->var0.var0.var1;
  +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCleanValue:", v6);

  if (SHIBYTE(var1.__r_.__value_.__r.__words[2]) < 0)
    operator delete(var1.__r_.__value_.__l.__data_);
  memset(&v9, 0, sizeof(v9));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v9, (__int128 *)a3[1].var0.var0.var0.var0.var1.var0, (__int128 *)a3[1].var0.var0.var0.var0.var1.var1, 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(a3[1].var0.var0.var0.var0.var1.var1 - (unint64_t)a3[1].var0.var0.var0.var0.var1.var0) >> 3));
  +[MarrsSiriNLUTypesConverter StdVectorStdString2NSMutableArrayNSString:](MarrsSiriNLUTypesConverter, "StdVectorStdString2NSMutableArrayNSString:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNormalizedValues:", v7);

  v12 = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  objc_msgSend(v4, "setIsSignificant:", LOBYTE(a3[1].var0.var0.var1.var0[0]));
  objc_msgSend(v4, "setIsWhitespace:", BYTE1(a3[1].var0.var0.var1.var0[0]));
  return v4;
}

+ (QRUtterance)toPluginUtterance:(QRUtterance *__return_ptr)retstr
{
  void *v1;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  unint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  QRUtterance *result;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void **v35;
  unint64_t v36;
  unint64_t v37;
  void *v38[2];
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  __int128 __p;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void **v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v56 = 0;
  v57 = 0;
  v30 = v1;
  objc_msgSend(v30, "nluInternalTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<marrs::qr::orchestration::QRToken>::reserve(&v55, objc_msgSend(v3, "count"));

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v30, "nluInternalTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v52 != v6)
          objc_enumerationMutation(v4);
        +[MarrsSiriNLUTypesConverter internalTokentoPluginToken:](MarrsSiriNLUTypesConverter, "internalTokentoPluginToken:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        v8 = v56;
        if (v56 >= v57)
        {
          v56 = std::vector<marrs::qr::orchestration::QRToken>::__emplace_back_slow_path<marrs::qr::orchestration::QRToken>(&v55, (__int128 *)v38);
          if (SHIBYTE(v50) < 0)
            operator delete((void *)__p);
        }
        else
        {
          v9 = *(_OWORD *)v38;
          *(_QWORD *)(v56 + 16) = v39;
          *(_OWORD *)v8 = v9;
          v38[1] = 0;
          v39 = 0;
          v38[0] = 0;
          v10 = v41;
          *(_OWORD *)(v8 + 24) = v40;
          *(_QWORD *)(v8 + 40) = v10;
          *(_QWORD *)(v8 + 48) = 0;
          v41 = 0;
          v40 = 0uLL;
          *(_QWORD *)(v8 + 56) = 0;
          *(_QWORD *)(v8 + 64) = 0;
          *(_OWORD *)(v8 + 48) = v42;
          *(_QWORD *)(v8 + 64) = v43;
          v42 = 0uLL;
          v43 = 0;
          v11 = v44;
          *(_OWORD *)(v8 + 88) = v45;
          *(_OWORD *)(v8 + 72) = v11;
          v12 = v46;
          *(_QWORD *)(v8 + 120) = v47;
          *(_OWORD *)(v8 + 104) = v12;
          v47 = 0;
          v46 = 0uLL;
          *(_BYTE *)(v8 + 128) = v48;
          v13 = __p;
          *(_QWORD *)(v8 + 152) = v50;
          *(_OWORD *)(v8 + 136) = v13;
          v50 = 0;
          __p = 0uLL;
          v56 = v8 + 160;
        }
        if (SHIBYTE(v47) < 0)
          operator delete((void *)v46);
        v35 = (void **)&v42;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v35);
        if (SHIBYTE(v41) < 0)
          operator delete((void *)v40);
        if (SHIBYTE(v39) < 0)
          operator delete(v38[0]);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v5);
  }

  v35 = 0;
  v36 = 0;
  v37 = 0;
  objc_msgSend(v30, "asrUtteranceTokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<marrs::qr::orchestration::QRToken>::reserve((uint64_t *)&v35, objc_msgSend(v14, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v30, "asrUtteranceTokens");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v59, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v15);
        +[MarrsSiriNLUTypesConverter toPluginToken:](MarrsSiriNLUTypesConverter, "toPluginToken:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
        v19 = v36;
        if (v36 >= v37)
        {
          v36 = std::vector<marrs::qr::orchestration::QRToken>::__emplace_back_slow_path<marrs::qr::orchestration::QRToken>((uint64_t *)&v35, (__int128 *)v38);
          if (SHIBYTE(v50) < 0)
            operator delete((void *)__p);
        }
        else
        {
          v20 = *(_OWORD *)v38;
          *(_QWORD *)(v36 + 16) = v39;
          *(_OWORD *)v19 = v20;
          v38[1] = 0;
          v39 = 0;
          v38[0] = 0;
          v21 = v41;
          *(_OWORD *)(v19 + 24) = v40;
          *(_QWORD *)(v19 + 40) = v21;
          *(_QWORD *)(v19 + 48) = 0;
          v41 = 0;
          v40 = 0uLL;
          *(_QWORD *)(v19 + 56) = 0;
          *(_QWORD *)(v19 + 64) = 0;
          *(_OWORD *)(v19 + 48) = v42;
          *(_QWORD *)(v19 + 64) = v43;
          v42 = 0uLL;
          v43 = 0;
          v22 = v44;
          *(_OWORD *)(v19 + 88) = v45;
          *(_OWORD *)(v19 + 72) = v22;
          v23 = v46;
          *(_QWORD *)(v19 + 120) = v47;
          *(_OWORD *)(v19 + 104) = v23;
          v47 = 0;
          v46 = 0uLL;
          *(_BYTE *)(v19 + 128) = v48;
          v24 = __p;
          *(_QWORD *)(v19 + 152) = v50;
          *(_OWORD *)(v19 + 136) = v24;
          v50 = 0;
          __p = 0uLL;
          v36 = v19 + 160;
        }
        if (SHIBYTE(v47) < 0)
          operator delete((void *)v46);
        v58 = (void **)&v42;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v58);
        if (SHIBYTE(v41) < 0)
          operator delete((void *)v40);
        if (SHIBYTE(v39) < 0)
          operator delete(v38[0]);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v59, 16);
    }
    while (v16);
  }

  objc_msgSend(v30, "asrId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var0.var0 = +[MarrsSiriNLUTypesConverter toPluginUuid:](MarrsSiriNLUTypesConverter, "toPluginUuid:", v25);
  retstr->var0.var1 = v26;
  objc_msgSend(v30, "utterance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v27);
  retstr->var1.var0.var1.var0[0] = 0;
  retstr->var1.var0.var1.var0[1] = 0;
  retstr->var1.var0.var1.var0[2] = 0;
  std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(retstr->var1.var0.var1.var0, v55, v56, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v56 - v55) >> 5));
  retstr[1].var0.var0 = 0;
  retstr[1].var0.var1 = 0;
  retstr[1].var1.var0.var0.var0.var1.var0 = 0;
  std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&retstr[1].var0.var0, (uint64_t)v35, v36, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v36 - (_QWORD)v35) >> 5));
  objc_msgSend(v30, "confidence");
  retstr[1].var1.var0.var0.var0.var1.var1 = v28;

  v38[0] = &v35;
  std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
  v38[0] = &v55;
  std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);

  return result;
}

+ (id)fromPluginUtterance:(QRUtterance *)a3
{
  void *v4;
  const marrs::qr::orchestration::QRToken *v5;
  unint64_t i;
  void *v7;
  void *v8;
  const marrs::qr::orchestration::QRToken *var0;
  unint64_t j;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __rep v16;
  std::string v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  std::string v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *__p;
  char v32;
  std::string v33;
  void *v34;
  char v35;
  _BYTE v36[56];
  void *v37;
  char v38;
  void *v39;
  char v40;
  void **v41;

  v4 = (void *)objc_opt_new();
  v5 = (const marrs::qr::orchestration::QRToken *)a3->var1.var0.var1.var0[0];
  for (i = a3->var1.var0.var1.var0[1];
        v5 != (const marrs::qr::orchestration::QRToken *)i;
        v5 = (const marrs::qr::orchestration::QRToken *)((char *)v5 + 160))
  {
    marrs::qr::orchestration::QRToken::QRToken(&v33, v5);
    marrs::qr::orchestration::QRToken::QRToken(&v25, (const marrs::qr::orchestration::QRToken *)&v33);
    +[MarrsSiriNLUTypesConverter internalTokenfromPluginToken:](MarrsSiriNLUTypesConverter, "internalTokenfromPluginToken:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    if (v32 < 0)
      operator delete(__p);
    if (v30 < 0)
      operator delete(v29);
    v41 = (void **)&v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v27 < 0)
      operator delete(v26);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    if (v40 < 0)
      operator delete(v39);
    if (v38 < 0)
      operator delete(v37);
    v41 = (void **)v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v35 < 0)
      operator delete(v34);
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
  }
  v8 = (void *)objc_opt_new();
  var0 = (const marrs::qr::orchestration::QRToken *)a3[1].var0.var0;
  for (j = a3[1].var0.var1;
        var0 != (const marrs::qr::orchestration::QRToken *)j;
        var0 = (const marrs::qr::orchestration::QRToken *)((char *)var0 + 160))
  {
    marrs::qr::orchestration::QRToken::QRToken(&v33, var0);
    marrs::qr::orchestration::QRToken::QRToken(&v17, (const marrs::qr::orchestration::QRToken *)&v33);
    +[MarrsSiriNLUTypesConverter fromPluginToken:](MarrsSiriNLUTypesConverter, "fromPluginToken:", &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    if (v24 < 0)
      operator delete(v23);
    if (v22 < 0)
      operator delete(v21);
    v41 = (void **)&v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v19 < 0)
      operator delete(v18);
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v17.__r_.__value_.__l.__data_);
    if (v40 < 0)
      operator delete(v39);
    if (v38 < 0)
      operator delete(v37);
    v41 = (void **)v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
    if (v35 < 0)
      operator delete(v34);
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0D9FA38]);
  +[MarrsSiriNLUTypesConverter fromPluginUuid:](MarrsSiriNLUTypesConverter, "fromPluginUuid:", a3->var0.var0, a3->var0.var1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAsrId:", v13);

  if (*((char *)&a3->var1.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external((std::string *)&v16, a3->var1.var0.var0.var0.var1.var0, a3->var1.var0.var0.var0.var1.var1);
  else
    v16 = a3->var1.var0.var0;
  +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUtterance:", v14);

  if (*((char *)&v16.var0.var1 + 23) < 0)
    operator delete(v16.var0.var1.var0);
  objc_msgSend(v12, "setNluInternalTokens:", v4, *(_OWORD *)v16.var0.var0.var0, *((_QWORD *)&v16.var0.var1 + 2));
  objc_msgSend(v12, "setAsrUtteranceTokens:", v8);
  objc_msgSend(v12, "setConfidence:", *(double *)&a3[1].var1.var0.var0.var0.var1.var1);

  return v12;
}

+ (QRInteraction)toPluginInteraction:(QRInteraction *__return_ptr)retstr
{
  void *v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char *v10;
  __int128 v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void **v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  unint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  QRInteraction *result;
  QRInteraction *v33;
  id v34;
  void *v35[2];
  void *__p[3];
  _BYTE v37[24];
  _BYTE v38[24];
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char *v53;
  char *v54;
  unint64_t v55;
  void **v56;
  void **v57;
  unint64_t v58;
  unint64_t v59;
  void **v60;
  unint64_t *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v34 = v1;
  objc_msgSend(v34, "originalUtterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 > 0x2AAAAAAAAAAAAAALL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    __p[2] = &v55;
    v35[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRUtterance>>(v4);
    v35[1] = (char *)v35[0] + (unint64_t)v54;
    __p[0] = (char *)v35[0] + (unint64_t)v54;
    __p[1] = (char *)v35[0] + 96 * v5;
    std::vector<marrs::qr::orchestration::QRUtterance>::__swap_out_circular_buffer((uint64_t *)&v53, v35);
    std::__split_buffer<marrs::qr::orchestration::QRUtterance>::~__split_buffer((uint64_t)v35);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v34, "originalUtterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = retstr;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v6);
        +[MarrsSiriNLUTypesConverter toPluginUtterance:](MarrsSiriNLUTypesConverter, "toPluginUtterance:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        v10 = v54;
        if ((unint64_t)v54 >= v55)
        {
          v13 = 0xAAAAAAAAAAAAAAABLL * ((v54 - v53) >> 5);
          v14 = v13 + 1;
          if (v13 + 1 > 0x2AAAAAAAAAAAAAALL)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v55 - (_QWORD)v53) >> 5) > v14)
            v14 = 0x5555555555555556 * ((uint64_t)(v55 - (_QWORD)v53) >> 5);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (_QWORD)v53) >> 5) >= 0x155555555555555)
            v15 = 0x2AAAAAAAAAAAAAALL;
          else
            v15 = v14;
          v61 = &v55;
          v16 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRUtterance>>(v15);
          v17 = (unint64_t)&v16[12 * v13];
          v57 = v16;
          v58 = v17;
          v60 = &v16[12 * v18];
          *(_OWORD *)v17 = *(_OWORD *)v35;
          v19 = *(_OWORD *)__p;
          *(void **)(v17 + 32) = __p[2];
          *(_OWORD *)(v17 + 16) = v19;
          memset(__p, 0, sizeof(__p));
          *(_QWORD *)(v17 + 40) = 0;
          *(_QWORD *)(v17 + 48) = 0;
          *(_QWORD *)(v17 + 56) = 0;
          *(_OWORD *)(v17 + 40) = *(_OWORD *)v37;
          *(_QWORD *)(v17 + 56) = *(_QWORD *)&v37[16];
          memset(v37, 0, sizeof(v37));
          *(_QWORD *)(v17 + 64) = 0;
          *(_QWORD *)(v17 + 72) = 0;
          *(_QWORD *)(v17 + 80) = 0;
          *(_OWORD *)(v17 + 64) = *(_OWORD *)v38;
          *(_QWORD *)(v17 + 80) = *(_QWORD *)&v38[16];
          memset(v38, 0, sizeof(v38));
          *(_QWORD *)(v17 + 88) = v39;
          v59 = v17 + 96;
          std::vector<marrs::qr::orchestration::QRUtterance>::__swap_out_circular_buffer((uint64_t *)&v53, &v57);
          v12 = v54;
          std::__split_buffer<marrs::qr::orchestration::QRUtterance>::~__split_buffer((uint64_t)&v57);
        }
        else
        {
          *(_OWORD *)v54 = *(_OWORD *)v35;
          v11 = *(_OWORD *)__p;
          *((void **)v10 + 4) = __p[2];
          *((_QWORD *)v10 + 5) = 0;
          *((_OWORD *)v10 + 1) = v11;
          memset(__p, 0, sizeof(__p));
          *((_QWORD *)v10 + 6) = 0;
          *((_QWORD *)v10 + 7) = 0;
          *(_OWORD *)(v10 + 40) = *(_OWORD *)v37;
          *(_OWORD *)v37 = 0uLL;
          *((_QWORD *)v10 + 7) = *(_QWORD *)&v37[16];
          *((_QWORD *)v10 + 8) = 0;
          *(_QWORD *)&v37[16] = 0;
          *((_QWORD *)v10 + 9) = 0;
          *((_QWORD *)v10 + 10) = 0;
          *((_OWORD *)v10 + 4) = *(_OWORD *)v38;
          *((_QWORD *)v10 + 10) = *(_QWORD *)&v38[16];
          memset(v38, 0, sizeof(v38));
          *((_QWORD *)v10 + 11) = v39;
          v12 = v10 + 96;
        }
        v54 = v12;
        v57 = (void **)v38;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](&v57);
        v57 = (void **)v37;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](&v57);
        if (SHIBYTE(__p[2]) < 0)
          operator delete(__p[0]);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v7);
  }

  v57 = 0;
  v58 = 0;
  v59 = 0;
  objc_msgSend(v34, "siriResponses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<marrs::qr::orchestration::QRToken>::reserve((uint64_t *)&v57, objc_msgSend(v20, "count"));

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v34, "siriResponses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v21);
        +[MarrsSiriNLUTypesConverter internalTokentoPluginToken:](MarrsSiriNLUTypesConverter, "internalTokentoPluginToken:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
        v25 = v58;
        if (v58 >= v59)
        {
          v58 = std::vector<marrs::qr::orchestration::QRToken>::__emplace_back_slow_path<marrs::qr::orchestration::QRToken>((uint64_t *)&v57, (__int128 *)v35);
          if (SHIBYTE(v44) < 0)
            operator delete((void *)v43);
        }
        else
        {
          v26 = *(_OWORD *)v35;
          *(void **)(v58 + 16) = __p[0];
          *(_OWORD *)v25 = v26;
          v35[1] = 0;
          __p[0] = 0;
          v35[0] = 0;
          v27 = *(_QWORD *)v37;
          *(_OWORD *)(v25 + 24) = *(_OWORD *)&__p[1];
          *(_QWORD *)(v25 + 40) = v27;
          *(_QWORD *)(v25 + 48) = 0;
          __p[2] = 0;
          *(_QWORD *)v37 = 0;
          __p[1] = 0;
          *(_QWORD *)(v25 + 56) = 0;
          *(_QWORD *)(v25 + 64) = 0;
          *(_OWORD *)(v25 + 48) = *(_OWORD *)&v37[8];
          *(_QWORD *)(v25 + 64) = *(_QWORD *)v38;
          *(_QWORD *)&v37[8] = 0;
          *(_QWORD *)&v37[16] = 0;
          *(_QWORD *)v38 = 0;
          v28 = *(_OWORD *)&v38[8];
          *(_OWORD *)(v25 + 88) = v39;
          *(_OWORD *)(v25 + 72) = v28;
          v29 = v40;
          *(_QWORD *)(v25 + 120) = v41;
          *(_OWORD *)(v25 + 104) = v29;
          v41 = 0;
          v40 = 0uLL;
          *(_BYTE *)(v25 + 128) = v42;
          v30 = v43;
          *(_QWORD *)(v25 + 152) = v44;
          *(_OWORD *)(v25 + 136) = v30;
          v44 = 0;
          v43 = 0uLL;
          v58 = v25 + 160;
        }
        if (SHIBYTE(v41) < 0)
          operator delete((void *)v40);
        v56 = (void **)&v37[8];
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v56);
        if ((v37[7] & 0x80000000) != 0)
          operator delete(__p[1]);
        if (SHIBYTE(__p[0]) < 0)
          operator delete(v35[0]);
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    }
    while (v22);
  }

  v33->var0.var0 = 0;
  v33->var0.var1 = 0;
  v33->var0.var2.var0 = 0;
  std::vector<marrs::qr::orchestration::QRUtterance>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRUtterance*,marrs::qr::orchestration::QRUtterance*>(v33, v53, v54, 0xAAAAAAAAAAAAAAABLL * ((v54 - v53) >> 5));
  *(_OWORD *)&v33->var1.var0 = 0u;
  *(_OWORD *)&v33->var1.var2.var0 = 0u;
  *(_OWORD *)&v33->var2.var1 = 0u;
  std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&v33->var2.var0, (uint64_t)v57, v58, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v58 - (_QWORD)v57) >> 5));
  objc_msgSend(v34, "locale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v31);
  LOBYTE(v33->var3.var0.var1.var0[0]) = objc_msgSend(v34, "tap2edit");
  v33->var3.var0.var1.var0[1] = objc_msgSend(v34, "startTimestamp");

  v35[0] = &v57;
  std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);
  v35[0] = &v53;
  std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);

  return result;
}

+ (id)fromPluginInteraction:(QRInteraction *)a3
{
  uint64_t v4;
  unint64_t v5;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_var1;
  __int128 v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  QRInteraction *v13;
  QRToken *i;
  const marrs::qr::orchestration::QRToken *var0;
  void *v16;
  id v17;
  void *v18;
  QRInteraction *v20;
  QRUtterance *var1;
  void *v22;
  std::string v23;
  std::string v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  __int128 v32;
  std::string v33;
  uint64_t v34;
  uint64_t v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  __int128 v44;
  std::string v45;
  _QWORD v46[3];
  _QWORD v47[4];
  void **v48[2];

  v4 = objc_opt_new();
  v20 = a3;
  v5 = 0x1EF785000uLL;
  var1 = a3->var0.var1;
  v22 = (void *)v4;
  if (a3->var0.var0 != var1)
  {
    p_var1 = &a3->var0.var0->var1;
    do
    {
      v32 = *(_OWORD *)&p_var1[-1].var0.var1.var0[1];
      if (*((char *)&p_var1->var0.var0.var0.var1 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v33, p_var1->var0.var0.var0.var1.var0, p_var1->var0.var0.var0.var1.var1);
      }
      else
      {
        v7 = *(_OWORD *)p_var1->var0.var0.var0.var0.var0;
        v33.__r_.__value_.__r.__words[2] = *((_QWORD *)&p_var1->var0.var0.var0.var1 + 2);
        *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v7;
      }
      v8 = &p_var1[-1].var0.var1.var0[1];
      v34 = 0;
      v35[0] = 0;
      v35[1] = 0;
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&v34, p_var1->var0.var1.var0[0], p_var1->var0.var1.var0[1], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(p_var1->var0.var1.var0[1] - p_var1->var0.var1.var0[0]) >> 5));
      v36 = 0;
      v37 = 0;
      v38 = 0;
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(&v36, (uint64_t)p_var1[1].var0.var0.var0.var1.var0, p_var1[1].var0.var0.var0.var1.var1, 0xCCCCCCCCCCCCCCCDLL* ((uint64_t)(p_var1[1].var0.var0.var0.var1.var1 - (unint64_t)p_var1[1].var0.var0.var0.var1.var0) >> 5));
      v39 = p_var1[1].var0.var1.var0[0];
      v9 = v5;
      v10 = (void *)(v5 + 3632);
      v44 = v32;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v45, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
      else
        v45 = v33;
      memset(v46, 0, sizeof(v46));
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(v46, v34, v35[0], 0xCCCCCCCCCCCCCCCDLL * ((v35[0] - v34) >> 5));
      memset(v47, 0, 24);
      std::vector<marrs::qr::orchestration::QRToken>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRToken*,marrs::qr::orchestration::QRToken*>(v47, v36, v37, 0xCCCCCCCCCCCCCCCDLL * ((v37 - v36) >> 5));
      v47[3] = v39;
      objc_msgSend(v10, "fromPluginUtterance:", &v44);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v11);

      v48[0] = (void **)v47;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      v48[0] = (void **)v46;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
      v48[0] = (void **)&v36;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      v48[0] = (void **)&v34;
      std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v48);
      v5 = v9;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v33.__r_.__value_.__l.__data_);
      p_var1 += 2;
    }
    while (v8 + 12 != (unint64_t *)var1);
  }
  v12 = (void *)objc_opt_new();
  v13 = v20;
  var0 = (const marrs::qr::orchestration::QRToken *)v20->var2.var0;
  for (i = v20->var2.var1;
        var0 != (const marrs::qr::orchestration::QRToken *)i;
        var0 = (const marrs::qr::orchestration::QRToken *)((char *)var0 + 160))
  {
    marrs::qr::orchestration::QRToken::QRToken((std::string *)&v32, var0);
    marrs::qr::orchestration::QRToken::QRToken(&v24, (const marrs::qr::orchestration::QRToken *)&v32);
    objc_msgSend((id)(v5 + 3632), "fromPluginToken:", &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

    if (v31 < 0)
      operator delete(v30);
    if (v29 < 0)
      operator delete(v28);
    v48[0] = (void **)&v27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v48);
    if (v26 < 0)
      operator delete(v25);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
    if (v43 < 0)
      operator delete(v42);
    if (v41 < 0)
      operator delete(v40);
    v48[0] = (void **)v35;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v48);
    if (SHIBYTE(v34) < 0)
      operator delete((void *)v33.__r_.__value_.__l.__size_);
    if (v33.__r_.__value_.__s.__data_[7] < 0)
      operator delete((void *)v32);
  }
  v17 = objc_alloc_init(MEMORY[0x1E0D9FA28]);
  objc_msgSend(v17, "setOriginalUtterances:", v22);
  objc_msgSend(v17, "setSiriResponses:", v12);
  if (*((char *)&v20->var3.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v23, v20->var3.var0.var0.var0.var1.var0, v20->var3.var0.var0.var0.var1.var1);
  else
    v23 = (std::string)v20->var3.var0.var0;
  objc_msgSend((id)(v5 + 3632), "stdString2NSString:", &v23, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLocale:", v18);

  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  objc_msgSend(v17, "setTap2edit:", LOBYTE(v13->var3.var0.var1.var0[0]));
  objc_msgSend(v17, "setStartTimestamp:", v13->var3.var0.var1.var0[1]);

  return v17;
}

+ (id)fromPluginHypothesis:(QRHypothesis *)a3
{
  id v4;
  void *v5;
  void *v6;
  __rep __p;

  v4 = objc_alloc_init(MEMORY[0x1E0D9FA20]);
  +[MarrsSiriNLUTypesConverter fromPluginUuid:](MarrsSiriNLUTypesConverter, "fromPluginUuid:", a3->var0.var0, a3->var0.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsrId:", v5);

  if (*((char *)&a3->var1.var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external((std::string *)&__p, a3->var1.var0.var0.var0.var1.var0, a3->var1.var0.var0.var0.var1.var1);
  else
    __p = a3->var1.var0.var0;
  +[MarrsSiriNLUTypesConverter stdString2NSString:](MarrsSiriNLUTypesConverter, "stdString2NSString:", &__p);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUtterance:", v6);

  if (*((char *)&__p.var0.var1 + 23) < 0)
    operator delete(__p.var0.var1.var0);
  objc_msgSend(v4, "setConfidence:", *(double *)a3->var1.var0.var1.var0, *(_OWORD *)__p.var0.var0.var0, *((_QWORD *)&__p.var0.var1 + 2));
  objc_msgSend(v4, "setRewriteType:", +[MarrsSiriNLUTypesConverter fromPluginRewriteType:](MarrsSiriNLUTypesConverter, "fromPluginRewriteType:", LODWORD(a3->var1.var0.var1.var0[1])));
  return v4;
}

+ (int)toPluginRequester:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (unique_ptr<marrs::qr::orchestration::QRRequest,)toPluginRequestPtr:(id)a3
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  void *v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  unique_ptr<marrs::qr::orchestration::QRRequest, std::default_delete<marrs::qr::orchestration::QRRequest>> v35;
  id v36;
  id obj;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 __p;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void **v54[5];
  _BYTE v55[128];
  uint64_t v56;

  v4 = v3;
  v56 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v5 = operator new();
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *v4 = v5;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  objc_msgSend(v36, "originalInteractions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<marrs::qr::orchestration::QRInteraction>::reserve(&v51, objc_msgSend(v6, "count"));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v36, "originalInteractions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(obj);
        +[MarrsSiriNLUTypesConverter toPluginInteraction:](MarrsSiriNLUTypesConverter, "toPluginInteraction:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
        v10 = v52;
        if (v52 >= v53)
        {
          v12 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v52 - v51) >> 4);
          v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) > 0x249249249249249)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v53 - v51) >> 4) > v13)
            v13 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v53 - v51) >> 4);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v51) >> 4)) >= 0x124924924924924)
            v14 = 0x249249249249249;
          else
            v14 = v13;
          v54[4] = (void **)&v53;
          if (v14)
            v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>>(v14);
          else
            v15 = 0;
          v16 = v14 + 112 * v12;
          v54[0] = (void **)v14;
          v54[1] = (void **)v16;
          v54[3] = (void **)(v14 + 112 * v15);
          *(_QWORD *)v16 = 0;
          *(_QWORD *)(v16 + 8) = 0;
          *(_QWORD *)(v16 + 16) = 0;
          *(_OWORD *)v16 = v38;
          *(_QWORD *)(v16 + 16) = v39;
          v38 = 0uLL;
          v39 = 0;
          *(_QWORD *)(v16 + 24) = 0;
          *(_QWORD *)(v16 + 32) = 0;
          *(_QWORD *)(v16 + 40) = 0;
          *(_OWORD *)(v16 + 24) = v40;
          *(_QWORD *)(v16 + 40) = v41;
          v40 = 0uLL;
          v41 = 0;
          *(_QWORD *)(v16 + 48) = 0;
          *(_QWORD *)(v16 + 56) = 0;
          *(_QWORD *)(v16 + 64) = 0;
          *(_OWORD *)(v16 + 48) = v42;
          *(_QWORD *)(v16 + 64) = v43;
          v42 = 0uLL;
          v43 = 0;
          v17 = __p;
          *(_QWORD *)(v16 + 88) = v45;
          *(_OWORD *)(v16 + 72) = v17;
          v45 = 0;
          __p = 0uLL;
          *(_OWORD *)(v16 + 96) = v46;
          v54[2] = (void **)(v16 + 112);
          std::vector<marrs::qr::orchestration::QRInteraction>::__swap_out_circular_buffer(&v51, v54);
          v18 = v52;
          std::__split_buffer<marrs::qr::orchestration::QRInteraction>::~__split_buffer((uint64_t)v54);
          v52 = v18;
          if (SHIBYTE(v45) < 0)
            operator delete((void *)__p);
        }
        else
        {
          *(_QWORD *)(v52 + 16) = 0;
          *(_QWORD *)(v10 + 24) = 0;
          *(_QWORD *)v10 = 0;
          *(_QWORD *)(v10 + 8) = 0;
          *(_OWORD *)v10 = v38;
          *(_QWORD *)(v10 + 16) = v39;
          v38 = 0uLL;
          v39 = 0;
          *(_QWORD *)(v10 + 32) = 0;
          *(_QWORD *)(v10 + 40) = 0;
          *(_OWORD *)(v10 + 24) = v40;
          v40 = 0uLL;
          *(_QWORD *)(v10 + 40) = v41;
          *(_QWORD *)(v10 + 48) = 0;
          v41 = 0;
          *(_QWORD *)(v10 + 56) = 0;
          *(_QWORD *)(v10 + 64) = 0;
          *(_OWORD *)(v10 + 48) = v42;
          *(_QWORD *)(v10 + 64) = v43;
          v42 = 0uLL;
          v43 = 0;
          v11 = __p;
          *(_QWORD *)(v10 + 88) = v45;
          *(_OWORD *)(v10 + 72) = v11;
          v45 = 0;
          __p = 0uLL;
          *(_OWORD *)(v10 + 96) = v46;
          v52 = v10 + 112;
        }
        v54[0] = (void **)&v42;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v54);
        v54[0] = (void **)&v40;
        std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100](v54);
        v54[0] = (void **)&v38;
        std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100](v54);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v7);
  }

  objc_msgSend(v36, "cdmRequestId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v5 = +[MarrsSiriNLUTypesConverter toPluginRequester:](MarrsSiriNLUTypesConverter, "toPluginRequester:", objc_msgSend(v19, "requester"));

  v20 = (void **)(v5 + 8);
  v21 = *(_QWORD *)(v5 + 8);
  v23 = v51;
  v22 = v52;
  v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v52 - v51) >> 4);
  v25 = *(_QWORD *)(v5 + 24);
  if (0x6DB6DB6DB6DB6DB7 * ((v25 - v21) >> 4) < v24)
  {
    if (v21)
    {
      v26 = *(_QWORD *)(v5 + 16);
      v27 = *(void **)(v5 + 8);
      if (v26 != v21)
      {
        do
        {
          v26 -= 112;
          std::allocator<marrs::qr::orchestration::QRInteraction>::destroy[abi:ne180100](v26);
        }
        while (v26 != v21);
        v27 = *v20;
      }
      *(_QWORD *)(v5 + 16) = v21;
      operator delete(v27);
      v25 = 0;
      *v20 = 0;
      *(_QWORD *)(v5 + 16) = 0;
      *(_QWORD *)(v5 + 24) = 0;
    }
    if (v24 > 0x249249249249249)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v28 = 0x6DB6DB6DB6DB6DB7 * (v25 >> 4);
    v29 = 2 * v28;
    if (2 * v28 <= v24)
      v29 = v24;
    if (v28 >= 0x124924924924924)
      v30 = 0x249249249249249;
    else
      v30 = v29;
    std::vector<marrs::qr::orchestration::QRInteraction>::__vallocate[abi:ne180100]((_QWORD *)(v5 + 8), v30);
    v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*>(v5 + 24, v23, v22, *(_QWORD *)(v5 + 16));
    goto LABEL_36;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(v5 + 16) - v21) >> 4) < v24)
  {
    v32 = v51 + 16 * ((*(_QWORD *)(v5 + 16) - v21) >> 4);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<marrs::qr::orchestration::QRInteraction *,marrs::qr::orchestration::QRInteraction *,marrs::qr::orchestration::QRInteraction *>(v51, v32, *(_QWORD *)(v5 + 8));
    v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*>(v5 + 24, v32, v22, *(_QWORD *)(v5 + 16));
LABEL_36:
    *(_QWORD *)(v5 + 16) = v31;
    goto LABEL_41;
  }
  v33 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<marrs::qr::orchestration::QRInteraction *,marrs::qr::orchestration::QRInteraction *,marrs::qr::orchestration::QRInteraction *>(v51, v52, *(_QWORD *)(v5 + 8));
  for (j = *(_QWORD *)(v5 + 16);
        j != v33;
        std::allocator<marrs::qr::orchestration::QRInteraction>::destroy[abi:ne180100](j))
  {
    j -= 112;
  }
  *(_QWORD *)(v5 + 16) = v33;
LABEL_41:
  *(_QWORD *)&v38 = &v51;
  std::vector<marrs::qr::orchestration::QRInteraction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);

  return v35;
}

+ (QRRequest)toPluginRequestObj:(SEL)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __int128 v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  QRRequest *result;
  id v24;
  id obj;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 __p;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void **v42[5];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v24 = a4;
  objc_msgSend(v24, "originalInteractions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<marrs::qr::orchestration::QRInteraction>::reserve(&v39, objc_msgSend(v5, "count"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v24, "originalInteractions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  v7 = 0x1EF785000uLL;
  if (v6)
  {
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend((id)(v7 + 3632), "toPluginInteraction:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v10 = v40;
        if (v40 >= v41)
        {
          v12 = v7;
          v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v40 - v39) >> 4);
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) > 0x249249249249249)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v41 - v39) >> 4) > v14)
            v14 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v41 - v39) >> 4);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v41 - v39) >> 4)) >= 0x124924924924924)
            v15 = 0x249249249249249;
          else
            v15 = v14;
          v42[4] = (void **)&v41;
          if (v15)
            v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>>(v15);
          else
            v16 = 0;
          v17 = v15 + 112 * v13;
          v42[0] = (void **)v15;
          v42[1] = (void **)v17;
          v42[3] = (void **)(v15 + 112 * v16);
          *(_QWORD *)v17 = 0;
          *(_QWORD *)(v17 + 8) = 0;
          *(_QWORD *)(v17 + 16) = 0;
          *(_OWORD *)v17 = v26;
          *(_QWORD *)(v17 + 16) = v27;
          v26 = 0uLL;
          v27 = 0;
          *(_QWORD *)(v17 + 24) = 0;
          *(_QWORD *)(v17 + 32) = 0;
          *(_QWORD *)(v17 + 40) = 0;
          *(_OWORD *)(v17 + 24) = v28;
          *(_QWORD *)(v17 + 40) = v29;
          v28 = 0uLL;
          v29 = 0;
          *(_QWORD *)(v17 + 48) = 0;
          *(_QWORD *)(v17 + 56) = 0;
          *(_QWORD *)(v17 + 64) = 0;
          *(_OWORD *)(v17 + 48) = v30;
          *(_QWORD *)(v17 + 64) = v31;
          v30 = 0uLL;
          v31 = 0;
          v18 = __p;
          *(_QWORD *)(v17 + 88) = v33;
          *(_OWORD *)(v17 + 72) = v18;
          v33 = 0;
          __p = 0uLL;
          *(_OWORD *)(v17 + 96) = v34;
          v42[2] = (void **)(v17 + 112);
          std::vector<marrs::qr::orchestration::QRInteraction>::__swap_out_circular_buffer(&v39, v42);
          v19 = v40;
          std::__split_buffer<marrs::qr::orchestration::QRInteraction>::~__split_buffer((uint64_t)v42);
          v40 = v19;
          v7 = v12;
          if (SHIBYTE(v33) < 0)
            operator delete((void *)__p);
        }
        else
        {
          *(_QWORD *)(v40 + 16) = 0;
          *(_QWORD *)(v10 + 24) = 0;
          *(_QWORD *)v10 = 0;
          *(_QWORD *)(v10 + 8) = 0;
          *(_OWORD *)v10 = v26;
          *(_QWORD *)(v10 + 16) = v27;
          v26 = 0uLL;
          v27 = 0;
          *(_QWORD *)(v10 + 32) = 0;
          *(_QWORD *)(v10 + 40) = 0;
          *(_OWORD *)(v10 + 24) = v28;
          v28 = 0uLL;
          *(_QWORD *)(v10 + 40) = v29;
          *(_QWORD *)(v10 + 48) = 0;
          v29 = 0;
          *(_QWORD *)(v10 + 56) = 0;
          *(_QWORD *)(v10 + 64) = 0;
          *(_OWORD *)(v10 + 48) = v30;
          *(_QWORD *)(v10 + 64) = v31;
          v30 = 0uLL;
          v31 = 0;
          v11 = __p;
          *(_QWORD *)(v10 + 88) = v33;
          *(_OWORD *)(v10 + 72) = v11;
          v33 = 0;
          __p = 0uLL;
          *(_OWORD *)(v10 + 96) = v34;
          v40 = v10 + 112;
        }
        v42[0] = (void **)&v30;
        std::vector<marrs::qr::orchestration::QRToken>::__destroy_vector::operator()[abi:ne180100](v42);
        v42[0] = (void **)&v28;
        std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100](v42);
        v42[0] = (void **)&v26;
        std::vector<marrs::qr::orchestration::QRUtterance>::__destroy_vector::operator()[abi:ne180100](v42);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v6);
  }

  objc_msgSend(v24, "cdmRequestId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var0 = objc_msgSend((id)(v7 + 3632), "toPluginRequester:", objc_msgSend(v20, "requester"));
  retstr->var1.var0 = 0;
  retstr->var1.var1 = 0;
  retstr->var1.var2.var0 = 0;
  v21 = v39;
  v22 = v40;
  *(_QWORD *)&v26 = &retstr->var1;
  BYTE8(v26) = 0;
  if (v40 != v39)
  {
    std::vector<marrs::qr::orchestration::QRInteraction>::__vallocate[abi:ne180100](&retstr->var1.var0, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v40 - v39) >> 4));
    retstr->var1.var1 = (QRInteraction *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<marrs::qr::orchestration::QRInteraction>,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*,marrs::qr::orchestration::QRInteraction*>((uint64_t)&retstr->var1.var2, v21, v22, (uint64_t)retstr->var1.var1);
  }

  *(_QWORD *)&v26 = &v39;
  std::vector<marrs::qr::orchestration::QRInteraction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);

  return result;
}

+ (id)fromPluginResponsePtr:(const void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  const void *v13;
  __int128 v14;
  std::string __p;
  uint64_t v16;
  int v17;
  __int128 v18;
  std::string v19;
  uint64_t v20;
  int v21;

  v4 = (void *)objc_opt_new();
  v13 = a3;
  v5 = **(_QWORD **)a3;
  v6 = *(_QWORD *)(*(_QWORD *)a3 + 8);
  if (v5 != v6)
  {
    v7 = v5 + 16;
    do
    {
      v18 = *(_OWORD *)(v7 - 16);
      if (*(char *)(v7 + 23) < 0)
        std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v7, *(_QWORD *)(v7 + 8));
      else
        v19 = *(std::string *)v7;
      v8 = v7 - 16;
      v20 = *(_QWORD *)(v7 + 24);
      v21 = *(_DWORD *)(v7 + 32);
      v14 = v18;
      v9 = SHIBYTE(v19.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
      else
        __p = v19;
      v16 = v20;
      v17 = v21;
      +[MarrsSiriNLUTypesConverter fromPluginHypothesis:](MarrsSiriNLUTypesConverter, "fromPluginHypothesis:", &v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v9 < 0)
LABEL_14:
          operator delete(v19.__r_.__value_.__l.__data_);
      }
      else if (v9 < 0)
      {
        goto LABEL_14;
      }
      v7 += 56;
    }
    while (v8 + 56 != v6);
  }
  v11 = objc_alloc_init(MEMORY[0x1E0D9FA18]);
  objc_msgSend(v11, "setRewriteHypotheses:", v4);
  objc_msgSend(v11, "setRepetitionType:", +[MarrsSiriNLUTypesConverter fromPluginRepetitionType:](MarrsSiriNLUTypesConverter, "fromPluginRepetitionType:", *(unsigned int *)(*(_QWORD *)v13 + 24)));

  return v11;
}

+ (id)fromPluginResponseObj:(const void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;
  unsigned int *v12;
  __int128 v13;
  std::string __p;
  uint64_t v15;
  int v16;
  __int128 v17;
  std::string v18;
  uint64_t v19;
  int v20;

  v4 = (void *)objc_opt_new();
  v5 = *((_QWORD *)a3 + 1);
  v12 = (unsigned int *)a3;
  if (*(_QWORD *)a3 != v5)
  {
    v6 = *(_QWORD *)a3 + 16;
    do
    {
      v17 = *(_OWORD *)(v6 - 16);
      if (*(char *)(v6 + 23) < 0)
        std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v6, *(_QWORD *)(v6 + 8));
      else
        v18 = *(std::string *)v6;
      v7 = v6 - 16;
      v19 = *(_QWORD *)(v6 + 24);
      v20 = *(_DWORD *)(v6 + 32);
      v13 = v17;
      v8 = SHIBYTE(v18.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
      else
        __p = v18;
      v15 = v19;
      v16 = v20;
      +[MarrsSiriNLUTypesConverter fromPluginHypothesis:](MarrsSiriNLUTypesConverter, "fromPluginHypothesis:", &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v8 < 0)
LABEL_14:
          operator delete(v18.__r_.__value_.__l.__data_);
      }
      else if (v8 < 0)
      {
        goto LABEL_14;
      }
      v6 += 56;
    }
    while (v7 + 56 != v5);
  }
  v10 = objc_alloc_init(MEMORY[0x1E0D9FA18]);
  objc_msgSend(v10, "setRewriteHypotheses:", v4);
  objc_msgSend(v10, "setRepetitionType:", +[MarrsSiriNLUTypesConverter fromPluginRepetitionType:](MarrsSiriNLUTypesConverter, "fromPluginRepetitionType:", v12[6]));

  return v10;
}

@end
