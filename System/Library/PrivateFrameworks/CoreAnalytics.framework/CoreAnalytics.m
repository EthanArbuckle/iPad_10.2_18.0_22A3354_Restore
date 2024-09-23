uint64_t AnalyticsSendEventLazy(void *a1, void *a2)
{
  return AnalyticsSendEventInternal(a1, a2, 0, 0, 0);
}

void applesauce::xpc::dict::object_proxy::operator=(uint64_t a1@<X0>, id *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v6;
  const char *v7;
  id v8;
  xpc_object_t v9;
  id v10;

  applesauce::xpc::dict::operator*(*(id **)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(const char **)(a1 + 8);
  v8 = *a2;
  xpc_dictionary_set_value(v6, v7, v8);

  *a3 = *a2;
  v9 = xpc_null_create();
  v10 = *a2;
  *a2 = v9;

}

{
  void *v6;
  const char *v7;
  void *v8;
  xpc_object_t v9;
  id v10;

  applesauce::xpc::dict::operator*(*(id **)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(const char **)(a1 + 8);
  applesauce::xpc::dict::operator*(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(v6, v7, v8);

  *a3 = *a2;
  v9 = xpc_null_create();
  v10 = *a2;
  *a2 = v9;

}

id applesauce::xpc::dict::operator*(id *a1)
{
  return *a1;
}

void ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t **v7;
  uint64_t v8;
  uint64_t *v9;
  char *v10[2];

  v10[1] = *(char **)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10[0] = (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    if (!v10[0])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid non-UTF8 character(s) in dictionary key"));
    v7 = *(uint64_t ***)(a1 + 32);
    makeJsonFromNSObjectWithDepthCount(&v8, v6, *(_BYTE *)(a1 + 40) + 1);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v7, v10, (uint64_t)&v8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v9, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid (non-string) key in JSON dictionary"));
  }

}

void sub_1A4CF5EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
  void *v9;
  void *v10;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a9);

  _Unwind_Resume(a1);
}

void makeJsonFromNSObjectWithDepthCount(double *__return_ptr a1@<X8>, NSObject *a2@<X0>, unsigned int a3@<W1>)
{
  NSObject *v5;
  NSObject *v6;
  CFTypeID v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  float v11;
  float v12;
  std::string *v13;
  NSObject *v14;
  uint64_t v15;
  char v16;
  void *v17;
  char *v18;
  double v19;
  uint64_t v20;
  _QWORD v21[5];
  char v22;
  _QWORD v23[5];
  char v24;
  std::string __p;
  void **v26[2];

  v26[1] = *(void ***)MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3 >= 0xB)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Object exceeded the max depth"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __p.__r_.__value_.__r.__words[0] = -[NSObject UTF8String](objc_retainAutorelease(v5), "UTF8String");
    if (!__p.__r_.__value_.__r.__words[0])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid non-UTF8 character(s) in string value"));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)a1, &__p.__r_.__value_.__l.__data_);
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = CFGetTypeID(v6);
    if (v7 == CFBooleanGetTypeID())
    {
      v8 = -[NSObject BOOLValue](v6, "BOOLValue");
      *(_BYTE *)a1 = 4;
      *((_QWORD *)a1 + 1) = v8;
LABEL_40:
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);

      goto LABEL_41;
    }
    v9 = objc_retainAutorelease(v6);
    v10 = *(char *)-[NSObject objCType](v9, "objCType");
    if (v10 <= 80)
    {
      if (v10 > 72)
      {
        if (v10 == 73 || v10 == 76)
          goto LABEL_38;
        goto LABEL_42;
      }
      if (v10 != 66)
      {
        if (v10 == 67)
        {
LABEL_38:
          v15 = -[NSObject unsignedLongLongValue](v9, "unsignedLongLongValue");
          v16 = 6;
          goto LABEL_39;
        }
LABEL_42:
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = (char *)-[NSObject objCType](objc_retainAutorelease(v9), "objCType");
        objc_msgSend(v17, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid number type in JSON write (%c)"), *v18);
        *(_BYTE *)a1 = 0;
        a1[1] = 0.0;
        goto LABEL_40;
      }
    }
    else
    {
      if ((v10 - 99) > 0x10)
        goto LABEL_36;
      if (((1 << (v10 - 99)) & 0x14241) == 0)
      {
        if (v10 == 100)
        {
          -[NSObject doubleValue](v9, "doubleValue");
          v20 = *(_QWORD *)&v19;
          if (fabs(v19) == INFINITY)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid number value (infinite) in JSON write"));
          *(_BYTE *)a1 = 7;
          *((_QWORD *)a1 + 1) = v20;
          goto LABEL_40;
        }
        if (v10 == 102)
        {
          -[NSObject floatValue](v9, "floatValue");
          v12 = v11;
          if (fabsf(v11) == INFINITY)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid number value (infinite) in JSON conversion"));
          *(_BYTE *)a1 = 7;
          a1[1] = v12;
          goto LABEL_40;
        }
LABEL_36:
        if (v10 == 81 || v10 == 83)
          goto LABEL_38;
        goto LABEL_42;
      }
    }
    v15 = -[NSObject longLongValue](v9, "longLongValue");
    v16 = 5;
LABEL_39:
    *(_BYTE *)a1 = v16;
    *((_QWORD *)a1 + 1) = v15;
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke;
    v23[3] = &__block_descriptor_41_e15_v32__0_8_16_B24l;
    v23[4] = &__p;
    v24 = a3;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v23);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)a1, &__p);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)&__p, (char *)__p.__r_.__value_.__l.__size_);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(&__p, 0, sizeof(__p));
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve((uint64_t *)&__p, -[NSObject count](v5, "count"));
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke_2;
      v21[3] = &__block_descriptor_41_e15_v32__0_8Q16_B24l;
      v21[4] = &__p;
      v22 = a3;
      -[NSObject enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v21);
      a1[1] = 0.0;
      *(_BYTE *)a1 = 2;
      v13 = (std::string *)operator new(0x18uLL);
      *v13 = __p;
      memset(&__p, 0, sizeof(__p));
      *((_QWORD *)a1 + 1) = v13;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      v26[0] = (void **)&__p;
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](v26);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_retainAutorelease(v5);
        hex((unsigned __int8 *)-[NSObject bytes](v14, "bytes"), -[NSObject length](v14, "length"), &__p);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)a1, (uint64_t)&__p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid type in JSON write (%@)"), objc_opt_class());
        *(_BYTE *)a1 = 0;
        a1[1] = 0.0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      }
    }
  }
LABEL_41:

}

void sub_1A4CF6498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(uint64_t **a1, int a2)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v3 = a2 - 1;
  if (a2 == 1)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v23, (*a1)[2]);
    v5 = (uint64_t)(*a1 + 1);
    v6 = (_QWORD *)**a1;
    v4 = v24;
    if (v6 != (_QWORD *)v5)
    {
      do
      {
        if (v4 >= v25)
        {
          v4 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v23, (uint64_t)(v6 + 7));
        }
        else
        {
          *(_BYTE *)v4 = *((_BYTE *)v6 + 56);
          *(_QWORD *)(v4 + 8) = v6[8];
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v6 + 7));
          *((_BYTE *)v6 + 56) = 0;
          v6[8] = 0;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
          v4 += 16;
        }
        v24 = v4;
        v7 = (_QWORD *)v6[1];
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = (_QWORD *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (_QWORD *)v6[2];
            v9 = *v8 == (_QWORD)v6;
            v6 = v8;
          }
          while (!v9);
        }
        v6 = v8;
      }
      while (v8 != (_QWORD *)v5);
    }
  }
  else
  {
    v4 = 0;
    if (a2 == 2)
    {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v23, ((*a1)[1] - **a1) >> 4);
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v21, **a1, (*a1)[1], &v23);
      v4 = v24;
    }
  }
  if (v23 != v4)
  {
    do
    {
      v21 = (void **)0xAAAAAAAAAAAAAAAALL;
      v22 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      v11 = *(_BYTE *)(v4 - 16);
      v10 = v4 - 16;
      LOBYTE(v21) = v11;
      v22 = *(uint64_t **)(v10 + 8);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
      *(_BYTE *)v10 = 0;
      *(_QWORD *)(v10 + 8) = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v21);
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v23, v24 - 16);
      if (v21 == 1)
      {
        v12 = v22;
        v13 = v22 + 1;
        v14 = (_QWORD *)*v22;
        if ((uint64_t *)*v22 != v22 + 1)
        {
          v15 = v24;
          do
          {
            if (v15 >= v25)
            {
              v15 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v23, (uint64_t)(v14 + 7));
            }
            else
            {
              *(_BYTE *)v15 = *((_BYTE *)v14 + 56);
              *(_QWORD *)(v15 + 8) = v14[8];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v14 + 7));
              *((_BYTE *)v14 + 56) = 0;
              v14[8] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v15);
              v15 += 16;
            }
            v24 = v15;
            v16 = (_QWORD *)v14[1];
            if (v16)
            {
              do
              {
                v17 = v16;
                v16 = (_QWORD *)*v16;
              }
              while (v16);
            }
            else
            {
              do
              {
                v17 = (_QWORD *)v14[2];
                v9 = *v17 == (_QWORD)v14;
                v14 = v17;
              }
              while (!v9);
            }
            v14 = v17;
          }
          while (v17 != v13);
          v12 = v22;
        }
        std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)v12, (char *)v12[1]);
        *v12 = (uint64_t)(v12 + 1);
        v12[2] = 0;
        v12[1] = 0;
      }
      else if (v21 == 2)
      {
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v26, *v22, v22[1], &v23);
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](v22);
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v21);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v22, v21);
      v4 = v24;
    }
    while (v23 != v24);
  }
  switch(v3)
  {
    case 0:
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)*a1, (char *)(*a1)[1]);
      goto LABEL_40;
    case 1:
      v21 = (void **)*a1;
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v21);
      goto LABEL_40;
    case 2:
      v18 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0)
        goto LABEL_41;
      v19 = (void *)*v18;
      break;
    case 7:
      v18 = *a1;
      v20 = (void *)**a1;
      if (!v20)
        goto LABEL_41;
      v18[1] = (uint64_t)v20;
      v19 = v20;
      break;
    default:
      goto LABEL_42;
  }
  operator delete(v19);
LABEL_40:
  v18 = *a1;
LABEL_41:
  operator delete(v18);
LABEL_42:
  v21 = (void **)&v23;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v21);
}

void sub_1A4CF6874(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(uint64_t result)
{
  const char *v1;
  int v2;

  switch(*(_BYTE *)result)
  {
    case 1:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::object or m_value.object != nullptr";
      v2 = 1220;
      break;
    case 2:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::array or m_value.array != nullptr";
      v2 = 1221;
      break;
    case 3:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::string or m_value.string != nullptr";
      v2 = 1222;
      break;
    case 8:
      if (*(_QWORD *)(result + 8))
        return result;
      v1 = "m_type != value_t::binary or m_value.binary != nullptr";
      v2 = 1223;
      break;
    default:
      return result;
  }
  __assert_rtn("assert_invariant", "json.hpp", v2, v1);
}

void std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(a1, *((_QWORD *)a2 + 1));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(a2 + 56));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(a2 + 64, a2[56]);
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, a3, (const void **)(v4 + 32)))break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *CoreAnalytics::Client::get(CoreAnalytics::Client *this)
{
  unsigned __int8 v1;

  {
    CoreAnalytics::Client::Client((CoreAnalytics::Client *)CoreAnalytics::Client::get(void)::client);
  }
  if (CoreAnalytics::Client::get(void)::sonce != -1)
    dispatch_once(&CoreAnalytics::Client::get(void)::sonce, &__block_literal_global_3);
  return CoreAnalytics::Client::get(void)::client;
}

uint64_t CoreAnalytics::Client::isEventUsed(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t isEventUsed;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  std::atomic_load[abi:ne180100]<FrameworkConfiguration const>((_QWORD *)(a1 + 80), &v11);
  if (v11 && !*(_BYTE *)(a1 + 62))
    isEventUsed = FrameworkConfiguration::isEventUsed(v11, a2, a3);
  else
    isEventUsed = 1;
  v7 = (std::__shared_weak_count *)v12;
  if (v12)
  {
    v8 = (unint64_t *)(v12 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return isEventUsed;
}

void CASPIEnter(void)
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  const void *v4;
  size_t v5;

  if (_dispatch_is_fork_of_multithreaded_parent())
  {
    v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v0)
      CASPIEnter(v0, v1, v2);
    v3 = (uint64_t *)abort_with_reason();
    FrameworkConfiguration::isEventUsed(v3, v4, v5);
  }
  else if (CASPIEnter(void)::sonce != -1)
  {
    dispatch_once(&CASPIEnter(void)::sonce, &__block_literal_global_0);
  }
}

uint64_t FrameworkConfiguration::isEventUsed(uint64_t *a1, const void *a2, size_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  int v10;
  size_t v11;
  void **v12;
  size_t v13;
  int v14;
  _BOOL4 v15;
  uint64_t v17;
  uint64_t v19;
  __int128 v21;
  int64_t v22;
  void *__p[2];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  if (*a1 == -1)
    v3 = 0;
  v19 = v3;
  v4 = *(_DWORD *)(a1[2] + 8);
  __p[0] = 0;
  __p[1] = 0;
  v24 = 0;
  if (!v4)
    return 0;
  v7 = 1;
  while (1)
  {
    v8 = (v7 + v4) >> 1;
    std::string::basic_string[abi:ne180100]<0>(&v21, (char *)(v19 + *(unsigned int *)(a1[2] + 4 * (v8 - 1) + 24)));
    if (SHIBYTE(v24) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v21;
    v9 = (void *)v21;
    v24 = v22;
    v10 = SHIBYTE(v22);
    v11 = v22 >= 0 ? HIBYTE(v22) : *((_QWORD *)&v21 + 1);
    v12 = v22 >= 0 ? __p : (void **)v21;
    if (a3 == v11 && !memcmp(a2, v12, a3))
      break;
    if (v11 >= a3)
      v13 = a3;
    else
      v13 = v11;
    v14 = memcmp(a2, v12, v13);
    v15 = a3 < v11;
    if (a3 == v11 || v14 != 0)
      v15 = v14 < 0;
    if (v15)
      v4 = v8 - 1;
    else
      v7 = v8 + 1;
    if (v7 > v4)
    {
      v17 = 0;
      if ((v10 & 0x80000000) == 0)
        return v17;
      goto LABEL_31;
    }
  }
  v17 = 1;
  if ((v10 & 0x80000000) == 0)
    return v17;
LABEL_31:
  operator delete(v9);
  return v17;
}

void sub_1A4CF6D90(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, char **a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t v7;
  uint64_t *v8[4];

  v8[3] = *(uint64_t **)MEMORY[0x1E0C80C00];
  memset(v8, 170, 24);
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a2, a3, v8);
  v7 = 0xAAAAAAAAAAAAAAAALL;
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v7, (const void **)v8[0] + 4);
  v5 = *v4;
  if (!*v4)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v7, v4, v8[0]);
    v5 = v8[0];
    v8[0] = 0;
  }
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v8, 0);
  return v5;
}

void sub_1A4CF6E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, char **a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  v7 = a1 + 8;
  memset(a4, 170, 24);
  v8 = operator new(0x48uLL);
  *a4 = v8;
  a4[1] = v7;
  *((_BYTE *)a4 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(v8 + 4, a2, a3);
  *((_BYTE *)a4 + 16) = 1;
  return result;
}

void sub_1A4CF6F30(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>(uint64_t a1, char **a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const* const&>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const* const&>(char **a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, *a1);
  return v2;
}

void sub_1A4CF6FC4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<nlohmann::detail::output_string_adapter<char,std::string>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16))(a1 + 24);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, _QWORD *a6@<X8>)
{
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  void (***__b[81])(void);

  __b[80] = *(void (****)(void))MEMORY[0x1E0C80C00];
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  memset(__b, 170, 0x280uLL);
  v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)off_1E4DEB978;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBB50;
  v12[1].__shared_owners_ = (uint64_t)a6;
  v21 = v12;
  v22 = &v12[1].__vftable;
  v23 = v12;
  do
    v14 = __ldxr(p_shared_owners);
  while (__stxr(v14 + 1, p_shared_owners));
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer((uint64_t)__b, (uint64_t)&v22, a3, a5);
  v15 = v23;
  if (v23)
  {
    v16 = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v21)
  {
    v18 = (unint64_t *)&v21->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(__b, a1, a2 >= 0, a4, a2 & ~(a2 >> 31), 0);
  return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer((uint64_t)__b);
}

void sub_1A4CF7174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer((uint64_t)va);
  if (*(char *)(v6 + 23) < 0)
    operator delete(*(void **)v6);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(void (****a1)(void), uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v11)(void);
  void (**v12)(void);
  unsigned int v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(void);
  unsigned int v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD **v29;
  uint64_t *v30;
  _QWORD **v31;
  uint64_t (*v32)(void);
  void (*v34)(void);
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t (***v38)(void);
  _QWORD **v39;
  unsigned __int8 **v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  BOOL v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  unsigned __int8 **v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  unsigned int v62;
  _QWORD **v63;
  uint64_t v64;
  void (*v65)(void);
  unint64_t v66;
  _QWORD **v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD **v74;

  switch(*(_BYTE *)a2)
  {
    case 0:
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    case 1:
      v12 = **a1;
      if (!*(_QWORD *)(*(_QWORD *)(a2 + 8) + 16))
      {
        v11 = (uint64_t (*)(void))v12[1];
        return v11();
      }
      if (a3)
      {
        v12[1]();
        v13 = a6 + a5;
        v14 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          v15 = (unint64_t)a1[77];
          if (v15 >= v13)
            goto LABEL_7;
        }
        else
        {
          v15 = *((unsigned __int8 *)a1 + 631);
          if (v13 <= v15)
          {
LABEL_7:
            v16 = *(_QWORD **)(a2 + 8);
            v17 = (_QWORD *)*v16;
            if (v16[2] == 1)
            {
              v18 = (_QWORD *)*v16;
            }
            else
            {
              v66 = 0;
              do
              {
                v67 = a1 + 76;
                if (*((char *)a1 + 631) < 0)
                  v67 = (_QWORD **)*v14;
                ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v67, (a6 + a5));
                ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v17 + 4, a4);
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v17 + 7, 1, a4, a5, (a6 + a5));
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v68 = (_QWORD *)v17[1];
                if (v68)
                {
                  do
                  {
                    v18 = v68;
                    v68 = (_QWORD *)*v68;
                  }
                  while (v68);
                }
                else
                {
                  do
                  {
                    v18 = (_QWORD *)v17[2];
                    v50 = *v18 == (_QWORD)v17;
                    v17 = v18;
                  }
                  while (!v50);
                }
                ++v66;
                v16 = *(_QWORD **)(a2 + 8);
                v17 = v18;
              }
              while (v66 < v16[2] - 1);
            }
            v69 = v16 + 1;
            if (v18 == v69)
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            v70 = (_QWORD *)v18[1];
            if (v70)
            {
              do
              {
                v71 = v70;
                v70 = (_QWORD *)*v70;
              }
              while (v70);
            }
            else
            {
              v73 = v18;
              do
              {
                v71 = (_QWORD *)v73[2];
                v50 = *v71 == (_QWORD)v73;
                v73 = v71;
              }
              while (!v50);
            }
            if (v71 != v69)
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            v74 = a1 + 76;
            if (*((char *)a1 + 631) < 0)
              v74 = (_QWORD **)*v14;
            ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v74, (a6 + a5));
            ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v18 + 4, a4);
            ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v18 + 7, 1, a4, a5, (a6 + a5));
            ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 10);
            v65 = (**a1)[1];
            goto LABEL_108;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v15, 32);
        goto LABEL_7;
      }
      (*v12)();
      v45 = *(_QWORD *)(a2 + 8);
      v46 = *(_QWORD **)v45;
      if (*(_QWORD *)(v45 + 16) != 1)
      {
        v47 = 0;
        do
        {
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v46 + 4, a4);
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v46 + 7, 0, a4, a5, a6);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 44);
          v48 = (_QWORD *)v46[1];
          v49 = v46;
          if (v48)
          {
            do
            {
              v46 = v48;
              v48 = (_QWORD *)*v48;
            }
            while (v48);
          }
          else
          {
            do
            {
              v46 = (_QWORD *)v49[2];
              v50 = *v46 == (_QWORD)v49;
              v49 = v46;
            }
            while (!v50);
          }
          ++v47;
          v45 = *(_QWORD *)(a2 + 8);
        }
        while (v47 < *(_QWORD *)(v45 + 16) - 1);
      }
      v51 = (_QWORD *)(v45 + 8);
      if (v46 == v51)
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      v52 = (_QWORD *)v46[1];
      if (v52)
      {
        do
        {
          v53 = v52;
          v52 = (_QWORD *)*v52;
        }
        while (v52);
      }
      else
      {
        v72 = v46;
        do
        {
          v53 = (_QWORD *)v72[2];
          v50 = *v53 == (_QWORD)v72;
          v72 = v53;
        }
        while (!v50);
      }
      if (v53 != v51)
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 34);
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v46 + 4, a4);
      ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v46 + 7, 0, a4, a5, a6);
LABEL_109:
      v32 = (uint64_t (*)(void))***a1;
      return v32();
    case 2:
      v19 = *(uint64_t **)(a2 + 8);
      v20 = *v19;
      v21 = v19[1];
      v22 = **a1;
      if (v20 == v21)
      {
        v11 = (uint64_t (*)(void))v22[1];
        return v11();
      }
      if (a3)
      {
        v22[1]();
        v23 = a6 + a5;
        v24 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          v25 = (unint64_t)a1[77];
          if (v25 >= v23)
            goto LABEL_13;
        }
        else
        {
          v25 = *((unsigned __int8 *)a1 + 631);
          if (v23 <= v25)
          {
LABEL_13:
            v26 = *(uint64_t **)(a2 + 8);
            v28 = *v26;
            v27 = v26[1];
            if (v28 != v27 - 16)
            {
              do
              {
                v29 = a1 + 76;
                if (*((char *)a1 + 631) < 0)
                  v29 = (_QWORD **)*v24;
                ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v29, (a6 + a5));
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v28, 1, a4, a5, (a6 + a5));
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v28 += 16;
                v30 = *(uint64_t **)(a2 + 8);
                v27 = v30[1];
              }
              while (v28 != v27 - 16);
              v28 = *v30;
            }
            if (v28 == v27)
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            v31 = a1 + 76;
            if (*((char *)a1 + 631) < 0)
              v31 = (_QWORD **)*v24;
            ((void (*)(void (***)(void), _QWORD **, _QWORD))(**a1)[1])(*a1, v31, (a6 + a5));
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 10);
            if (*((char *)a1 + 631) < 0)
              v24 = (_QWORD *)*v24;
            ((void (*)(void (***)(void), _QWORD *, _QWORD))(**a1)[1])(*a1, v24, a6);
            goto LABEL_95;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v25, 32);
        goto LABEL_13;
      }
      (*v22)();
      v54 = *(uint64_t **)(a2 + 8);
      v56 = *v54;
      v55 = v54[1];
      if (v56 == v55 - 16)
      {
        v57 = v56;
      }
      else
      {
        v57 = v56;
        do
        {
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v57, 0, a4, a5, a6);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 44);
          v57 += 16;
          v58 = *(uint64_t **)(a2 + 8);
          v55 = v58[1];
        }
        while (v57 != v55 - 16);
        v56 = *v58;
      }
      if (v56 == v55)
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v57, 0, a4, a5, a6);
LABEL_95:
      v32 = (uint64_t (*)(void))***a1;
      return v32();
    case 3:
      (***a1)();
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, *(uint64_t **)(a2 + 8), a4);
      v32 = (uint64_t (*)(void))***a1;
      return v32();
    case 4:
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    case 5:
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(a1, *(_QWORD *)(a2 + 8));
    case 6:
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(a1, *(_QWORD *)(a2 + 8));
    case 7:
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float((char *)a1, *(double *)(a2 + 8));
    case 8:
      v34 = (**a1)[1];
      if (a3)
      {
        v34();
        v35 = (a6 + a5);
        v36 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          v37 = (unint64_t)a1[77];
          if (v37 >= v35)
          {
            v38 = (uint64_t (***)(void))*a1;
            goto LABEL_62;
          }
        }
        else
        {
          v37 = *((unsigned __int8 *)a1 + 631);
          if (v35 <= v37)
          {
            v38 = (uint64_t (***)(void))*a1;
            v39 = a1 + 76;
            goto LABEL_63;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v37, 32);
        v38 = (uint64_t (***)(void))*a1;
        v39 = a1 + 76;
        if ((*((char *)a1 + 631) & 0x80000000) == 0)
        {
LABEL_63:
          ((void (*)(uint64_t (***)(void), _QWORD **, uint64_t))(*v38)[1])(v38, v39, v35);
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\"bytes\": [", 10);
          v59 = *(unsigned __int8 ***)(a2 + 8);
          v61 = *v59;
          v60 = v59[1];
          if (v61 != v60)
          {
            if (v61 != v60 - 1)
            {
              do
              {
                v62 = *v61++;
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, v62);
                ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, ", ", 2);
              }
              while (v61 != (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 1));
            }
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *v61);
          }
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "],\n", 3);
          v63 = a1 + 76;
          if (*((char *)a1 + 631) < 0)
            v63 = (_QWORD **)*v36;
          ((void (*)(void (***)(void), _QWORD **, uint64_t))(**a1)[1])(*a1, v63, v35);
          ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "\"subtype\": ", 11);
          v64 = *(_QWORD *)(a2 + 8);
          if (*(_BYTE *)(v64 + 25))
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *(unsigned __int8 *)(v64 + 24));
          else
            ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "null", 4);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 10);
          v65 = (**a1)[1];
LABEL_108:
          v65();
          goto LABEL_109;
        }
LABEL_62:
        v39 = (_QWORD **)*v36;
        goto LABEL_63;
      }
      v34();
      v40 = *(unsigned __int8 ***)(a2 + 8);
      v42 = *v40;
      v41 = v40[1];
      if (v42 != v41)
      {
        while (v42 != v41 - 1)
        {
          v43 = *v42++;
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, v43);
          ((void (*)(void (***)(void), uint64_t))***a1)(*a1, 44);
          v41 = *(unsigned __int8 **)(*(_QWORD *)(a2 + 8) + 8);
        }
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *v42);
      }
      ((void (*)(void (***)(void), const char *, uint64_t))(**a1)[1])(*a1, "],\"subtype\":", 12);
      v44 = *(_QWORD *)(a2 + 8);
      if (*(_BYTE *)(v44 + 25))
      {
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(a1, *(unsigned __int8 *)(v44 + 24));
        goto LABEL_109;
      }
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    case 9:
      v11 = (uint64_t (*)(void))(**a1)[1];
      return v11();
    default:
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
  }
}

void nlohmann::detail::output_string_adapter<char,std::string>::write_character(uint64_t a1, std::string::value_type a2)
{
  std::string::push_back(*(std::string **)(a1 + 8), a2);
}

std::string *nlohmann::detail::output_string_adapter<char,std::string>::write_characters(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 8), a2, a3);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped(uint64_t result, uint64_t *a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  uint64_t *v21;
  int v22;
  unint64_t v23;
  char *v24;
  int v25;
  nlohmann::detail::exception *exception;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  __int128 v30;
  char *v31;
  std::string::size_type v32;
  std::string *v33;
  __int128 v34;
  uint64_t *v35;
  nlohmann::detail::exception *v36;
  std::string v37;
  std::string v38;
  std::string v39;
  __int128 v40;
  std::string::size_type v41;
  char __str[8];
  unint64_t v43;
  uint64_t v44;
  char v45;
  unsigned int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = a2[1];
  if (v4)
  {
    v7 = (_QWORD *)result;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v46 = -1431655766;
    v12 = result + 90;
    while (1)
    {
      if ((v3 & 1) != 0)
        v13 = (uint64_t *)*a2;
      else
        v13 = a2;
      v14 = *((unsigned __int8 *)v13 + v8);
      result = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(&v45, &v46, v14);
      if ((_DWORD)result == 1)
      {
        v16 = *((_DWORD *)v7 + 158);
        if ((v16 - 1) >= 2)
        {
          if (!v16)
          {
            v43 = 0xAAAAAAAAAAAAAAAALL;
            v44 = 0x3AAAAAAAAAAAAAALL;
            *(_QWORD *)__str = 0xAAAAAAAA00000000;
            snprintf(__str, 3uLL, "%.2X", v14);
            exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
            std::to_string(&v37, v8);
            v27 = std::string::insert(&v37, 0, "invalid UTF-8 byte at index ");
            v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
            v38.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v28;
            v27->__r_.__value_.__l.__size_ = 0;
            v27->__r_.__value_.__r.__words[2] = 0;
            v27->__r_.__value_.__r.__words[0] = 0;
            v29 = std::string::append(&v38, ": 0x");
            v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
            v39.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v30;
            v29->__r_.__value_.__l.__size_ = 0;
            v29->__r_.__value_.__r.__words[2] = 0;
            v29->__r_.__value_.__r.__words[0] = 0;
            if (v44 >= 0)
              v31 = __str;
            else
              v31 = *(char **)__str;
            if (v44 >= 0)
              v32 = HIBYTE(v44);
            else
              v32 = v43;
            v33 = std::string::append(&v39, v31, v32);
            v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
            v41 = v33->__r_.__value_.__r.__words[2];
            v40 = v34;
            v33->__r_.__value_.__l.__size_ = 0;
            v33->__r_.__value_.__r.__words[2] = 0;
            v33->__r_.__value_.__r.__words[0] = 0;
            nlohmann::detail::type_error::create(316, (uint64_t)&v40, exception);
          }
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
        }
        v17 = v9 != 0;
        if (v16 == 1)
        {
          v18 = v12 + v10;
          if (a3)
          {
            *(_DWORD *)v18 = 1717990748;
            *(_WORD *)(v18 + 4) = 25702;
            v10 += 6;
          }
          else
          {
            v10 += 3;
            *(_WORD *)v18 = -16401;
            *(_BYTE *)(v18 + 2) = -67;
          }
          if ((unint64_t)(v10 - 500) <= 0xC)
          {
            result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v10);
            v10 = 0;
          }
        }
        v9 = 0;
        v8 -= v17;
        v45 = 0;
        v11 = v10;
      }
      else if ((_DWORD)result)
      {
        if ((a3 & 1) == 0)
        {
          if (*((char *)a2 + 23) >= 0)
            v19 = a2;
          else
            v19 = (uint64_t *)*a2;
          *(_BYTE *)(v12 + v11++) = *((_BYTE *)v19 + v8);
        }
        ++v9;
      }
      else
      {
        switch(v46)
        {
          case 8u:
            v15 = 25180;
            goto LABEL_43;
          case 9u:
            v15 = 29788;
            goto LABEL_43;
          case 0xAu:
            v15 = 28252;
            goto LABEL_43;
          case 0xBu:
            goto LABEL_29;
          case 0xCu:
            v15 = 26204;
            goto LABEL_43;
          case 0xDu:
            v15 = 29276;
            goto LABEL_43;
          default:
            if (v46 == 34)
            {
              v15 = 8796;
              goto LABEL_43;
            }
            if (v46 == 92)
            {
              v15 = 23644;
LABEL_43:
              *(_WORD *)(v12 + v11) = v15;
              v11 += 2;
              goto LABEL_44;
            }
LABEL_29:
            if (v46 > 0x7E)
              v20 = a3;
            else
              v20 = 0;
            if (v46 < 0x20 || v20)
            {
              v24 = (char *)(v12 + v11);
              if (HIWORD(v46))
              {
                result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v46 >> 10) - 10304), v46 & 0x3FF | 0xDC00);
                v11 += 12;
              }
              else
              {
                result = snprintf(v24, 7uLL, "\\u%04x", v46);
                v11 += 6;
              }
            }
            else
            {
              if (*((char *)a2 + 23) >= 0)
                v21 = a2;
              else
                v21 = (uint64_t *)*a2;
              *(_BYTE *)(v12 + v11++) = *((_BYTE *)v21 + v8);
            }
LABEL_44:
            if ((unint64_t)(v11 - 500) > 0xC)
            {
              v9 = 0;
              v10 = v11;
            }
            else
            {
              result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v11);
              v11 = 0;
              v10 = 0;
              v9 = 0;
            }
            break;
        }
      }
      ++v8;
      v22 = *((char *)a2 + 23);
      v3 = v22 >> 31;
      v23 = a2[1];
      if (v22 >= 0)
        v23 = *((unsigned __int8 *)a2 + 23);
      if (v8 >= v23)
      {
        if (v45)
        {
          v25 = *((_DWORD *)v7 + 158);
          switch(v25)
          {
            case 1:
              (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v10);
              return (*(uint64_t (**)(void))(*(_QWORD *)*v7 + 8))();
            case 2:
              return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v10);
            case 0:
              v43 = 0xAAAAAAAAAAAAAAAALL;
              v44 = 0x3AAAAAAAAAAAAAALL;
              *(_QWORD *)__str = 0xAAAAAAAA00000000;
              v35 = (uint64_t *)*a2;
              if (v22 >= 0)
                v35 = a2;
              snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v35 + v23 - 1));
              v36 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
              std::operator+<char>();
              nlohmann::detail::type_error::create(316, (uint64_t)&v40, v36);
            default:
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
          }
        }
        else if (v11)
        {
          return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v12, v11);
        }
        return result;
      }
    }
  }
  return result;
}

void sub_1A4CF81CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;
  int v40;
  uint64_t v41;

  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 105) < 0)
        operator delete(*(void **)(v41 - 128));
      _Unwind_Resume(a1);
    }
  }
  else if (!v40)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v39);
  goto LABEL_6;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(_BYTE *a1, unsigned int *a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;

  v3 = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char &,unsigned int &,unsigned char)::utf8d[a3];
  if (*a1)
    v4 = a3 & 0x3F | (*a2 << 6);
  else
    v4 = (0xFFu >> v3) & a3;
  *a2 = v4;
  v5 = 16 * *a1 + v3 + 256;
  if (v5 >= 0x190)
    __assert_rtn("decode", "serializer.hpp", 892, "index < 400");
  v6 = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char &,unsigned int &,unsigned char)::utf8d[v5];
  *a1 = v6;
  return v6;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  _BYTE *v3;
  char *v4;
  int v6;
  unsigned int v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  v2 = a2;
  v3 = a1 + 2;
  if ((v2 & 0x8000000000000000) != 0)
  {
    *v3 = 45;
    v2 = -(uint64_t)v2;
    if (v2 >= 0xA)
    {
      v6 = 4;
      v10 = v2;
      while (1)
      {
        if (v10 <= 0x63)
        {
          v6 -= 2;
          goto LABEL_24;
        }
        if (v10 <= 0x3E7)
          break;
        if (v10 >> 4 < 0x271)
          goto LABEL_24;
        v6 += 4;
        v9 = v10 >= 0x186A0;
        v10 /= 0x2710uLL;
        if (!v9)
        {
          v6 -= 3;
          goto LABEL_24;
        }
      }
      --v6;
    }
    else
    {
      v6 = 1;
    }
LABEL_24:
    v7 = v6 + 1;
  }
  else
  {
    if (v2 < 0xA)
    {
      v4 = (char *)a1 + 17;
LABEL_33:
      *(v4 - 1) = v2 + 48;
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
    }
    v7 = 4;
    v8 = v2;
    while (1)
    {
      if (v8 <= 0x63)
      {
        v7 -= 2;
        goto LABEL_25;
      }
      if (v8 <= 0x3E7)
        break;
      if (v8 >> 4 < 0x271)
        goto LABEL_25;
      v7 += 4;
      v9 = v8 >= 0x186A0;
      v8 /= 0x2710uLL;
      if (!v9)
      {
        v7 -= 3;
        goto LABEL_25;
      }
    }
    --v7;
  }
LABEL_25:
  if (v7 >= 0x3F)
    nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>();
  v4 = &v3[v7];
  if (v2 < 0x64)
  {
    v11 = v2;
  }
  else
  {
    do
    {
      v11 = v2 / 0x64;
      *((_WORD *)v4 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(long long)::digits_to_99[v2 % 0x64];
      v4 -= 2;
      v12 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v12 > 0x270);
  }
  if (v11 < 0xA)
  {
    LOBYTE(v2) = v11;
    goto LABEL_33;
  }
  *((_WORD *)v4 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(long long)::digits_to_99[v11];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0)
    operator delete(*(void **)(a1 + 608));
  return std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  lconv *v7;
  char *thousands_sep;
  char *decimal_point;
  int8x16_t *v10;
  int8x16_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v7 = localeconv();
  *(_QWORD *)(a1 + 80) = v7;
  thousands_sep = v7->thousands_sep;
  if (thousands_sep)
    LOBYTE(thousands_sep) = *thousands_sep;
  *(_BYTE *)(a1 + 88) = (_BYTE)thousands_sep;
  decimal_point = v7->decimal_point;
  if (v7->decimal_point)
    LOBYTE(decimal_point) = *decimal_point;
  *(_OWORD *)(a1 + 90) = 0u;
  *(_BYTE *)(a1 + 89) = (_BYTE)decimal_point;
  *(_OWORD *)(a1 + 106) = 0u;
  *(_OWORD *)(a1 + 122) = 0u;
  *(_OWORD *)(a1 + 138) = 0u;
  *(_OWORD *)(a1 + 154) = 0u;
  *(_OWORD *)(a1 + 170) = 0u;
  *(_OWORD *)(a1 + 186) = 0u;
  *(_OWORD *)(a1 + 202) = 0u;
  *(_OWORD *)(a1 + 218) = 0u;
  *(_OWORD *)(a1 + 234) = 0u;
  *(_OWORD *)(a1 + 250) = 0u;
  *(_OWORD *)(a1 + 266) = 0u;
  *(_OWORD *)(a1 + 282) = 0u;
  *(_OWORD *)(a1 + 298) = 0u;
  *(_OWORD *)(a1 + 314) = 0u;
  *(_OWORD *)(a1 + 330) = 0u;
  *(_OWORD *)(a1 + 346) = 0u;
  *(_OWORD *)(a1 + 362) = 0u;
  *(_OWORD *)(a1 + 378) = 0u;
  *(_OWORD *)(a1 + 394) = 0u;
  *(_OWORD *)(a1 + 410) = 0u;
  *(_OWORD *)(a1 + 426) = 0u;
  *(_OWORD *)(a1 + 442) = 0u;
  *(_OWORD *)(a1 + 458) = 0u;
  *(_OWORD *)(a1 + 474) = 0u;
  *(_OWORD *)(a1 + 490) = 0u;
  *(_OWORD *)(a1 + 506) = 0u;
  *(_OWORD *)(a1 + 522) = 0u;
  *(_OWORD *)(a1 + 538) = 0u;
  *(_OWORD *)(a1 + 554) = 0u;
  *(_OWORD *)(a1 + 570) = 0u;
  *(_OWORD *)(a1 + 586) = 0u;
  *(_BYTE *)(a1 + 602) = a3;
  v10 = (int8x16_t *)operator new(0x208uLL);
  *(_QWORD *)(a1 + 608) = v10;
  *(_QWORD *)(a1 + 624) = 0x8000000000000208;
  v11 = vdupq_n_s8(a3);
  *(_QWORD *)(a1 + 616) = 512;
  *v10 = v11;
  v10[1] = v11;
  v10[2] = v11;
  v10[3] = v11;
  v10[4] = v11;
  v10[5] = v11;
  v10[6] = v11;
  v10[7] = v11;
  v10[8] = v11;
  v10[9] = v11;
  v10[10] = v11;
  v10[11] = v11;
  v10[12] = v11;
  v10[13] = v11;
  v10[14] = v11;
  v10[15] = v11;
  v10[16] = v11;
  v10[17] = v11;
  v10[18] = v11;
  v10[19] = v11;
  v10[20] = v11;
  v10[21] = v11;
  v10[22] = v11;
  v10[23] = v11;
  v10[24] = v11;
  v10[25] = v11;
  v10[26] = v11;
  v10[27] = v11;
  v10[28] = v11;
  v10[29] = v11;
  v10[30] = v11;
  v10[31] = v11;
  v10[32].i8[0] = 0;
  *(_DWORD *)(a1 + 632) = a4;
  return a1;
}

void sub_1A4CF8658(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_1A4CF8718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void applesauce::xpc::dict::create(xpc_object_t *a1@<X8>)
{
  xpc_object_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  v6 = v3;
  if (!v3)
    v3 = xpc_null_create();

  v4 = v3;
  v5 = v4;
  *a1 = v4;
  if (!v4 || MEMORY[0x1A85A7704](v4) != MEMORY[0x1E0C812F8])
  {
    *a1 = xpc_null_create();

  }
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1, _QWORD *a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(_QWORD *a1)
{
  _QWORD *result;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  result = operator new(0x18uLL);
  v3 = a1 + 1;
  v4 = a1[1];
  *result = *a1;
  result[1] = v4;
  v5 = result + 1;
  v6 = a1[2];
  result[2] = v6;
  if (v6)
  {
    *(_QWORD *)(v4 + 16) = v5;
    *a1 = v3;
    *v3 = 0;
    a1[2] = 0;
  }
  else
  {
    *result = v5;
  }
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

CoreAnalytics::Client *CoreAnalytics::Client::Client(CoreAnalytics::Client *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;

  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  *(_QWORD *)this = dispatch_queue_create("com.apple.CoreAnalytics::Client", v2);
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  *((_QWORD *)this + 1) = dispatch_queue_create("com.apple.CoreAnalytics::Client XPC Send", v3);
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  *((_QWORD *)this + 2) = dispatch_queue_create("com.apple.CoreAnalytics::Client XPC Reply", v4);
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  *((_QWORD *)this + 3) = dispatch_queue_create("com.apple.CoreAnalytics::Client XPC Retry", v5);
  *((_QWORD *)this + 4) = dispatch_semaphore_create(1000);
  *((_BYTE *)this + 40) = 0;
  *((_QWORD *)this + 6) = xpc_null_create();
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 18) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_DWORD *)this + 14) = 0;
  *(_DWORD *)((char *)this + 59) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  return this;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  v2 = a2;
  if (a2 < 0xA)
  {
    v3 = (uint64_t)a1 + 17;
LABEL_21:
    *(_BYTE *)(v3 - 1) = v2 + 48;
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  }
  v5 = 4;
  v6 = a2;
  while (1)
  {
    if (v6 <= 0x63)
    {
      v5 -= 2;
      goto LABEL_13;
    }
    if (v6 <= 0x3E7)
      break;
    if (v6 >> 4 < 0x271)
      goto LABEL_13;
    v7 = v6 >> 5;
    v6 /= 0x2710uLL;
    v5 += 4;
    if (v7 <= 0xC34)
    {
      v5 -= 3;
      goto LABEL_13;
    }
  }
  --v5;
LABEL_13:
  if (v5 >= 0x3F)
    nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>();
  v3 = (uint64_t)a1 + v5 + 16;
  if (a2 < 0x64)
  {
    v8 = a2;
  }
  else
  {
    do
    {
      v8 = v2 / 0x64;
      *(_WORD *)(v3 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(unsigned long long)::digits_to_99[v2 % 0x64];
      v3 -= 2;
      v9 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v9 > 0x270);
  }
  if (v8 < 0xA)
  {
    LOBYTE(v2) = v8;
    goto LABEL_21;
  }
  *(_WORD *)(v3 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(unsigned long long)::digits_to_99[v8];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

void __destroy_helper_block_e8_40c27_ZTSN10applesauce3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

xpc_object_t __copy_helper_block_e8_40c27_ZTSN10applesauce3xpc4dictE(uint64_t a1, uint64_t a2)
{
  void *v3;
  xpc_object_t result;

  v3 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    return xpc_retain(v3);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

xpc_object_t __copy_helper_block_e8_48c27_ZTSN10applesauce3xpc4dictE(uint64_t a1, uint64_t a2)
{
  void *v3;
  xpc_object_t result;

  v3 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v3;
  if (v3)
    return xpc_retain(v3);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

uint64_t ___ZN13CoreAnalytics6Client22acquireSendTransactionEv_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 72);
  if (!v2)
  {
    result = os_transaction_create();
    *(_QWORD *)(v1 + 64) = result;
    v2 = *(_DWORD *)(v1 + 72);
  }
  *(_DWORD *)(v1 + 72) = v2 + 1;
  return result;
}

void __destroy_helper_block_e8_48c27_ZTSN10applesauce3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(_QWORD *)(a1 + 48) = 0;
}

void AnalyticsSendEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3321888768;
  v5[2] = __AnalyticsSendEvent_block_invoke;
  v5[3] = &__block_descriptor_40_ea8_32c31_ZTSKZ18AnalyticsSendEventE3__0_e19___NSDictionary_8__0l;
  v6 = v3;
  v4 = v3;
  AnalyticsSendEventInternal(a1, v5, 0, 0, 0);

}

void sub_1A4CF8DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  BOOL v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 72);
  v3 = __OFSUB__(v2--, 1);
  *(_DWORD *)(v1 + 72) = v2;
  if ((v2 < 0) ^ v3 | (v2 == 0))
  {
    os_release(*(void **)(v1 + 64));
    *(_DWORD *)(v1 + 72) = 0;
    *(_QWORD *)(v1 + 64) = 0;
  }
}

void ___ZN10applesauce8dispatch2v19sync_implIZZN13CoreAnalytics6Client3getEvEUb_E3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke()
{
  CoreAnalytics::Client::init((CoreAnalytics::Client *)CoreAnalytics::Client::get(void)::client);
}

uint64_t AnalyticsIsEventUsed(void *a1)
{
  id v1;
  void *v2;
  id v3;
  CoreAnalytics::Client *v4;
  uint64_t *v5;
  void **v6;
  size_t v7;
  uint64_t isEventUsed;
  void *__p[4];

  __p[3] = *(void **)MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1A85A7380]();
  CASPIEnter();
  memset(__p, 170, 24);
  v3 = objc_retainAutorelease(v1);
  v4 = (CoreAnalytics::Client *)std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
  v5 = CoreAnalytics::Client::get(v4);
  if (SHIBYTE(__p[2]) >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if (SHIBYTE(__p[2]) >= 0)
    v7 = HIBYTE(__p[2]);
  else
    v7 = (size_t)__p[1];
  isEventUsed = CoreAnalytics::Client::isEventUsed((uint64_t)v5, v6, v7);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  objc_autoreleasePoolPop(v2);

  return isEventUsed;
}

void sub_1A4CF8EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t analytics_send_event_lazy(char *a1, void *a2)
{
  return analytics_send_event_internal(a1, a2, 0, 0, 0);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float(char *a1, double a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, const char *, uint64_t);
  uint64_t v5;
  const char *v6;

  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    v5 = *(_QWORD *)a1;
    v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(_QWORD **)a1 + 8);
    v6 = "null";
    v3 = 4;
  }
  else
  {
    v3 = nlohmann::detail::to_chars<double>(a1 + 16, (uint64_t)(a1 + 80), a2) - (a1 + 16);
    v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(_QWORD **)a1 + 8);
    v5 = *(_QWORD *)a1;
    v6 = a1 + 16;
  }
  return v4(v5, v6, v3);
}

char *nlohmann::detail::to_chars<double>(char *a1, uint64_t a2, double a3)
{
  char *v3;
  char *result;
  unint64_t v5;
  char *v6[2];

  v6[1] = *(char **)MEMORY[0x1E0C80C00];
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    nlohmann::detail::to_chars<double>();
  v3 = a1;
  if ((*(_QWORD *)&a3 & 0x8000000000000000) != 0)
  {
    a3 = -a3;
    *a1 = 45;
    v3 = a1 + 1;
  }
  if (a3 == 0.0)
  {
    *(_WORD *)v3 = 11824;
    result = v3 + 3;
    v3[2] = 48;
  }
  else
  {
    v5 = a2 - (_QWORD)v3;
    if (a2 - (uint64_t)v3 <= 16)
      nlohmann::detail::to_chars<double>();
    v6[0] = 0;
    nlohmann::detail::dtoa_impl::grisu2<double>((uint64_t)v3, (unsigned int *)v6 + 1, v6, a3);
    if (SHIDWORD(v6[0]) >= 18)
      nlohmann::detail::to_chars<double>();
    if (v5 <= 0x15)
      nlohmann::detail::to_chars<double>();
    if (v5 == 22)
      nlohmann::detail::to_chars<double>();
    return nlohmann::detail::dtoa_impl::format_buffer((nlohmann::detail::dtoa_impl *)v3, (char *)HIDWORD(v6[0]), (int)v6[0], -4, 15);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2<double>(uint64_t a1, unsigned int *a2, _DWORD *a3, double a4)
{
  __int128 v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    nlohmann::detail::dtoa_impl::grisu2<double>();
  if (a4 <= 0.0)
    nlohmann::detail::dtoa_impl::grisu2<double>();
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11 = v7;
  v12 = v7;
  v10 = v7;
  nlohmann::detail::dtoa_impl::compute_boundaries<double>((uint64_t)&v10, a4);
  return nlohmann::detail::dtoa_impl::grisu2(a1, a2, a3, v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v8, v12, *((nlohmann::detail::dtoa_impl **)&v12 + 1));
}

uint64_t nlohmann::detail::dtoa_impl::grisu2(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, nlohmann::detail::dtoa_impl *a10)
{
  uint64_t cached_power_for_binary_exponent;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  int v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v32[0] = a4;
  v32[1] = a5;
  v31[0] = a6;
  v31[1] = a7;
  v30[0] = a9;
  v30[1] = a10;
  if ((_DWORD)a10 != (_DWORD)a5)
    nlohmann::detail::dtoa_impl::grisu2();
  if ((_DWORD)a10 != (_DWORD)a7)
    nlohmann::detail::dtoa_impl::grisu2();
  cached_power_for_binary_exponent = nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(a10);
  v15 = v14;
  v27 = cached_power_for_binary_exponent;
  v29 = -1431655766;
  v28 = v16;
  v17 = nlohmann::detail::dtoa_impl::diyfp::mul(v31, &v27);
  v19 = v18;
  v20 = nlohmann::detail::dtoa_impl::diyfp::mul(v32, &v27);
  v22 = v21;
  v23 = nlohmann::detail::dtoa_impl::diyfp::mul(v30, &v27);
  *a3 = -v15;
  return nlohmann::detail::dtoa_impl::grisu2_digit_gen(a1, a2, a3, v20 + 1, v22 | 0xAAAAAAAA00000000, v17, v19, v25, v23 - 1, v24 | 0xAAAAAAAA00000000);
}

unint64_t nlohmann::detail::dtoa_impl::diyfp::mul(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = HIDWORD(*a1);
  v3 = HIDWORD(*a2);
  v4 = v3 * (unint64_t)*a1;
  v5 = *a2 * (unint64_t)v2;
  return HIDWORD(v5)
       + v3 * (unint64_t)v2
       + HIDWORD(v4)
       + ((((*a2 * (unint64_t)*a1) >> 32)
         + v4
         + v5
         + 0x80000000) >> 32);
}

uint64_t nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(nlohmann::detail::dtoa_impl *this)
{
  int v1;
  unsigned int v2;
  _QWORD *v3;
  int v4;

  if ((int)this <= -1501)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  if ((int)this >= 1501)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  v1 = 78913 * (-61 - (int)this) / 0x40000;
  if ((int)this < -61)
    ++v1;
  if (v1 <= -315)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  v2 = (int)((v1 + 307 + (((__int16)(v1 + 307) >> 28) & 7)) << 16) >> 19;
  if (v2 >= 0x4F)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  v3 = (_QWORD *)((char *)&nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(int)::kCachedPowers
                + 16 * (unsigned __int16)v2);
  v4 = v3[1] + (_DWORD)this;
  if (v4 <= -125)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  if (v4 >= -95)
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  return *v3;
}

uint64_t nlohmann::detail::dtoa_impl::compute_boundaries<double>@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  if (a2 <= 0.0)
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  v3 = (*(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL) == 0;
  if (*(_QWORD *)&a2 >> 52)
    v4 = ((*(_QWORD *)&a2 >> 52) - 1075) | 0xAAAAAAAA00000000;
  else
    v4 = 0xAAAAAAAAFFFFFBCELL;
  if (*(_QWORD *)&a2 >> 52)
    v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  else
    v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = *(_QWORD *)&a2 >> 53 != 0;
  v7 = !v6 || !v3;
  if (v6 && v3)
    v8 = 4 * v5;
  else
    v8 = 2 * v5;
  if (v7)
    v9 = v4 - 1;
  else
    v9 = v4 - 2;
  v18 = v8 - 1;
  v20 = -1431655766;
  v19 = v9;
  v10 = nlohmann::detail::dtoa_impl::diyfp::normalize((2 * v5) | 1, (v4 - 1) | 0xAAAAAAAA00000000);
  v12 = v11;
  v13 = nlohmann::detail::dtoa_impl::diyfp::normalize_to(&v18, v11);
  v15 = v14;
  result = nlohmann::detail::dtoa_impl::diyfp::normalize(v5, v4);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v17;
  *(_QWORD *)(a1 + 16) = v13;
  *(_DWORD *)(a1 + 24) = v15;
  *(_QWORD *)(a1 + 32) = v10;
  *(_DWORD *)(a1 + 40) = v12;
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::diyfp::normalize(uint64_t result, unint64_t a2)
{
  if (!result)
    __assert_rtn("normalize", "to_chars.hpp", 143, "x.f != 0");
  for (; (result & 0x8000000000000000) == 0; a2 = (a2 - 1) | a2 & 0xFFFFFFFF00000000)
    result *= 2;
  return result;
}

unint64_t nlohmann::detail::dtoa_impl::diyfp::normalize_to(uint64_t *a1, int a2)
{
  int v2;
  uint64_t v3;
  unint64_t result;
  const char *v5;
  int v6;

  v2 = *((_DWORD *)a1 + 2) - a2;
  if (v2 < 0)
  {
    v5 = "delta >= 0";
    v6 = 162;
    goto LABEL_6;
  }
  v3 = *a1;
  result = *a1 << v2;
  if (result >> v2 != v3)
  {
    v5 = "((x.f << delta) >> delta) == x.f";
    v6 = 163;
LABEL_6:
    __assert_rtn("normalize_to", "to_chars.hpp", v6, v5);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2_digit_gen(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v47[0] = a4;
  v47[1] = a5;
  v46[0] = a6;
  v46[1] = a7;
  v44 = a9;
  v45 = a10;
  if ((int)a10 <= -61)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  if ((int)a10 >= -31)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  v13 = nlohmann::detail::dtoa_impl::diyfp::sub((uint64_t)&v44, (uint64_t)v47);
  v14 = nlohmann::detail::dtoa_impl::diyfp::sub((uint64_t)&v44, (uint64_t)v46);
  v15 = -(int)v45;
  v16 = v44 >> -(char)v45;
  if (!(_DWORD)v16)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  v17 = v14;
  v18 = 1 << v15;
  v19 = (1 << v15) - 1;
  v20 = v19 & v44;
  if (v16 <= 0x3B9AC9FF)
  {
    if (v16 <= 0x5F5E0FF)
    {
      if (v16 <= 0x98967F)
      {
        if (v16 <= 0xF423F)
        {
          v23 = v16 >> 5;
          v24 = v16 >> 4;
          if (v16 <= 9)
            v25 = 1;
          else
            v25 = 10;
          if (v16 <= 9)
            v26 = 1;
          else
            v26 = 2;
          if (v16 <= 0x63)
            v27 = v26;
          else
            v27 = 3;
          if (v16 <= 0x63)
            v28 = v25;
          else
            v28 = 100;
          if (v16 <= 0x3E7)
            v29 = v27;
          else
            v29 = 4;
          if (v16 <= 0x3E7)
            v30 = v28;
          else
            v30 = 1000;
          if (v24 <= 0x270)
            v31 = v29;
          else
            v31 = 5;
          if (v24 <= 0x270)
            v32 = v30;
          else
            v32 = 10000;
          if (v23 <= 0xC34)
            v22 = v31;
          else
            v22 = 6;
          if (v23 > 0xC34)
            v21 = 100000;
          else
            v21 = v32;
        }
        else
        {
          v21 = 1000000;
          v22 = 7;
        }
      }
      else
      {
        v21 = 10000000;
        v22 = 8;
      }
    }
    else
    {
      v21 = 100000000;
      v22 = 9;
    }
  }
  else
  {
    v21 = 1000000000;
    v22 = 10;
  }
  v33 = v22 + 1;
  do
  {
    v34 = v16 / v21;
    if (v16 / v21 >= 0xA)
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    v16 = v16 % v21;
    v35 = (int)*a2;
    *a2 = v35 + 1;
    *(_BYTE *)(a1 + v35) = v34 + 48;
    if ((v16 << v15) + v20 <= v13)
    {
      *a3 = *a3 + v33 - 2;
      v18 = (unint64_t)v21 << v15;
      v40 = (char *)*a2;
      v41 = a1;
      v42 = v13;
      v20 += v16 << v15;
      return nlohmann::detail::dtoa_impl::grisu2_round(v41, v40, v17, v42, v20, v18);
    }
    v21 /= 0xAu;
    --v33;
  }
  while (v33 > 1);
  if (v20 <= v13)
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  v36 = 0;
  do
  {
    if (v20 >= 0x199999999999999ALL)
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    v37 = (10 * v20) >> v15;
    if (v37 >= 0xA)
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    v38 = (int)*a2;
    *a2 = v38 + 1;
    *(_BYTE *)(a1 + v38) = v37 + 48;
    v39 = 5 * v13;
    v20 = (10 * v20) & v19;
    v13 *= 10;
    v17 *= 10;
    --v36;
  }
  while (v20 > 2 * v39);
  *a3 += v36;
  v40 = (char *)*a2;
  v41 = a1;
  v42 = v13;
  return nlohmann::detail::dtoa_impl::grisu2_round(v41, v40, v17, v42, v20, v18);
}

uint64_t nlohmann::detail::dtoa_impl::diyfp::sub(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t result;
  const char *v4;
  int v5;

  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8))
  {
    v4 = "x.e == y.e";
    v5 = 66;
LABEL_6:
    __assert_rtn("sub", "to_chars.hpp", v5, v4);
  }
  v2 = *(_QWORD *)a1 >= *(_QWORD *)a2;
  result = *(_QWORD *)a1 - *(_QWORD *)a2;
  if (!v2)
  {
    v4 = "x.f >= y.f";
    v5 = 67;
    goto LABEL_6;
  }
  return result;
}

char *nlohmann::detail::dtoa_impl::format_buffer(nlohmann::detail::dtoa_impl *this, char *a2, int a3, int a4, int a5)
{
  int v5;
  uint64_t v7;
  char *result;
  _BYTE *v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  unsigned int v14;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;

  if ((a4 & 0x80000000) == 0)
    nlohmann::detail::dtoa_impl::format_buffer();
  if (a5 <= 0)
    nlohmann::detail::dtoa_impl::format_buffer();
  v5 = (int)a2;
  v7 = a3 + (uint64_t)(int)a2;
  if ((a3 & 0x80000000) == 0 && (int)v7 <= a5)
  {
    memset((char *)this + (int)a2, 48, a3);
    *((_BYTE *)this + v7) = 46;
    result = (char *)this + v7 + 2;
    *((_BYTE *)this + (int)v7 + 1) = 48;
    return result;
  }
  if ((int)v7 < 1 || (int)v7 > a5)
  {
    if ((int)v7 > a4 && (int)v7 <= 0)
    {
      v10 = -(int)v7;
      memmove((char *)this + v10 + 2, this, (int)a2);
      *(_WORD *)this = 11824;
      memset((char *)this + 2, 48, v10);
      return (char *)this + v10 + v5 + 2;
    }
    if ((_DWORD)a2 == 1)
    {
      v11 = 1;
    }
    else
    {
      memmove((char *)this + 2, (char *)this + 1, (int)a2 - 1);
      *((_BYTE *)this + 1) = 46;
      v11 = v5 + 1;
    }
    v12 = (char *)this + v11;
    *v12 = 101;
    if ((int)v7 <= -999)
      nlohmann::detail::dtoa_impl::format_buffer();
    if ((int)v7 >= 1001)
      nlohmann::detail::dtoa_impl::format_buffer();
    if ((int)v7 >= 1)
      v13 = 43;
    else
      v13 = 45;
    if ((int)v7 - 1 >= 0)
      v14 = v7 - 1;
    else
      v14 = 1 - v7;
    v12[1] = v13;
    if (v14 > 9)
    {
      if (v14 > 0x63)
      {
        v12[2] = (unsigned __int16)v14 / 0x64u + 48;
        v17 = (unsigned __int16)v14 % 0x64u;
        v12[3] = (v17 / 0xAu) | 0x30;
        v12[4] = (v17 % 0xAu) | 0x30;
        v16 = 2;
        return &v12[v16 + 3];
      }
      v12[2] = v14 / 0xAu + 48;
      v15 = (v14 % 0xAu) | 0x30;
    }
    else
    {
      v12[2] = 48;
      v15 = v14 + 48;
    }
    v12[3] = v15;
    v16 = 1;
    return &v12[v16 + 3];
  }
  if ((a3 & 0x80000000) == 0)
    nlohmann::detail::dtoa_impl::format_buffer();
  v9 = (char *)this + v7;
  memmove(v9 + 1, v9, (int)a2 - (unint64_t)v7);
  *v9 = 46;
  return (char *)this + v5 + 1;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2_round(uint64_t this, char *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;

  if ((int)a2 <= 0)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (a3 > a4)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (a4 < a5)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (!a6)
    nlohmann::detail::dtoa_impl::grisu2_round();
  if (a5 < a3 && a4 - a5 >= a6)
  {
    v6 = ((_DWORD)a2 - 1);
    v7 = -(uint64_t)a5;
    v8 = a6 + a5;
    do
    {
      if (v8 >= a3 && a3 + v7 <= v8 - a3)
        break;
      v9 = *(unsigned __int8 *)(this + v6);
      if (v9 == 48)
        nlohmann::detail::dtoa_impl::grisu2_round();
      *(_BYTE *)(this + v6) = v9 - 1;
      if (v8 >= a3)
        break;
      v10 = a4 - a6 + v7;
      v7 -= a6;
      v8 += a6;
    }
    while (v10 >= a6);
  }
  return this;
}

void makeJsonFromNSObject(NSObject *a1@<X0>, double *a2@<X8>)
{
  makeJsonFromNSObjectWithDepthCount(a2, a1, 0);
}

void CoreAnalytics::Client::retryXpcMessage_sync(uint64_t a1, xpc_object_t *a2, char a3, char a4)
{
  xpc_object_t v7;
  void *v8[2];

  v8[1] = *(void **)MEMORY[0x1E0C80C00];
  v7 = *a2;
  v8[0] = v7;
  if (v7)
  {
    xpc_retain(v7);
  }
  else
  {
    v7 = xpc_null_create();
    v8[0] = v7;
  }
  CoreAnalytics::Client::retryXpcMessageHelper_sync(a1, v8, a3, a4, 0, 100);
  xpc_release(v7);
}

void sub_1A4CF9C68(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CoreAnalytics::Client::retryXpcMessageHelper_sync(uint64_t a1, void **a2, char a3, char a4, unsigned int a5, uint64_t a6)
{
  NSObject *v8;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  xpc_object_t object;
  char v16;
  char v17;
  char v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  if (a5 < 5)
  {
    v10 = *(_xpc_connection_s **)(a1 + 48);
    v11 = *a2;
    v12 = *(NSObject **)(a1 + 16);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 1174405120;
    v14[2] = ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke;
    v14[3] = &__block_descriptor_tmp_29;
    v16 = a4;
    v17 = a5;
    v14[4] = a1;
    v14[5] = a6;
    object = v11;
    if (v11)
      xpc_retain(v11);
    else
      object = xpc_null_create();
    v18 = a3;
    xpc_connection_send_message_with_reply(v10, v11, v12, v14);
    xpc_release(object);
  }
  else
  {
    {
      v13 = *a2;
      v19 = v13;
      if (v13)
        xpc_retain(v13);
      else
        v19 = xpc_null_create();
      try_xpc_to_json(&v19, &v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v20, -1, 0x20u, 0, 1, block);
      CoreAnalytics::Client::retryXpcMessageHelper_sync();
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20);
      xpc_release(v19);
    }
    v8 = *(NSObject **)a1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke;
    block[3] = &__block_descriptor_tmp_32;
    block[4] = a1;
    dispatch_sync(v8, block);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_1A4CF9E48(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

os_log_t ___Z10CASPIEnterv_block_invoke()
{
  sSetupFrameworkLogDomains();
  return sSetupSharedLogDomains();
}

os_log_t sSetupFrameworkLogDomains(void)
{
  os_log_t result;

  qword_1ECD3AF60 = (uint64_t)os_log_create("com.apple.CoreAnalytics.event", "send");
  qword_1ECD3AF68 = (uint64_t)os_log_create("com.apple.CoreAnalytics.event", "send-diagnostics");
  result = os_log_create("com.apple.CoreAnalytics.event", "mgmt-send");
  qword_1ECD3AF70 = (uint64_t)result;
  return result;
}

void analytics_send_event(char *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __analytics_send_event_block_invoke;
  v5[3] = &unk_1E4DEBCF8;
  v6 = v3;
  v4 = v3;
  analytics_send_event_internal(a1, v5, 0, 0, 0);

}

void sub_1A4CF9FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t ___Z11xpc_to_jsonRKN10applesauce3xpc6objectE_block_invoke(uint64_t a1, char *a2, xpc_object_t a3)
{
  uint64_t *v5;
  char v6;
  uint64_t *v7;
  uint64_t v9;
  uint64_t *v10;
  xpc_object_t v11;
  uint64_t *v12;
  void *__p;
  char v14;
  char *v15[2];

  v15[1] = *(char **)MEMORY[0x1E0C80C00];
  v15[0] = a2;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)&v11, v15);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v11, -1, 0x20u, 0, 0, &__p);
  if (v14 < 0)
    operator delete(__p);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v12, v11);
  v11 = a3;
  if (a3)
  {
    xpc_retain(a3);
  }
  else
  {
    a3 = xpc_null_create();
    v11 = a3;
  }
  xpc_to_json(&v9, (const applesauce::xpc::object *)&v11);
  v5 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(*(unsigned __int8 **)(a1 + 32), v15[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v9);
  v6 = *(_BYTE *)v5;
  *(_BYTE *)v5 = v9;
  LOBYTE(v9) = v6;
  v7 = (uint64_t *)v5[1];
  v5[1] = (uint64_t)v10;
  v10 = v7;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9);
  xpc_release(a3);
  return 1;
}

void sub_1A4CFA114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void xpc_to_json(uint64_t *__return_ptr a1@<X8>, xpc_object_t *a2@<X0>)
{
  const _xpc_type_s *v4;
  __int128 v5;
  const unsigned __int8 *bytes;
  uint64_t **v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  xpc_object_t v11;
  uint64_t v12;
  char v13;
  uint64_t *v14;
  void *v15;
  int64_t value;
  uint64_t *v17;
  unsigned __int8 v18;
  uint64_t v19;
  int v20;
  size_t count;
  size_t i;
  xpc_object_t v23;
  xpc_object_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unsigned __int8 v28;
  uint64_t *v29;
  unsigned __int8 *bytes_ptr;
  size_t length;
  char v32;
  uint64_t *v33;
  _BOOL4 v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  char *name;
  std::logic_error *exception;
  std::string *v42;
  __int128 v43;
  std::string v44;
  std::string v45;
  _BYTE v46[16];
  _BYTE v47[16];
  _BYTE v48[8];
  uint64_t v49;
  unsigned __int8 v50[8];
  uint64_t v51;
  unsigned __int8 v52[8];
  uint64_t v53;
  _BYTE v54[8];
  uint64_t *v55;
  unsigned __int8 v56[8];
  uint64_t *v57;
  unsigned __int8 v58[8];
  uint64_t v59;
  void *__p;
  char v61;
  _BYTE v62[8];
  uint64_t *v63;
  _QWORD applier[5];
  _BYTE v65[8];
  uint64_t *v66;
  uuid_string_t out;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0;
  *(_BYTE *)a1 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  v4 = (const _xpc_type_s *)MEMORY[0x1A85A7704](*a2);
  if (v4 == (const _xpc_type_s *)MEMORY[0x1E0C812F8])
  {
    v8 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v65, 0, 0, 0, 1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
    v9 = *(_BYTE *)a1;
    *(_BYTE *)a1 = v65[0];
    v65[0] = v9;
    v10 = (uint64_t *)a1[1];
    a1[1] = (uint64_t)v66;
    v66 = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v65);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v66, v65[0]);
    v11 = *a2;
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 0x40000000;
    applier[2] = ___Z11xpc_to_jsonRKN10applesauce3xpc6objectE_block_invoke;
    applier[3] = &__block_descriptor_tmp_0;
    applier[4] = a1;
    xpc_dictionary_apply(v11, applier);
    return;
  }
  if (v4 == (const _xpc_type_s *)MEMORY[0x1E0C81390])
  {
    *(_QWORD *)out = xpc_string_get_string_ptr(*a2);
    v12 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)v62, (char **)out);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
    v13 = *(_BYTE *)a1;
    *(_BYTE *)a1 = v62[0];
    v62[0] = v13;
    v14 = (uint64_t *)a1[1];
    a1[1] = (uint64_t)v63;
    v63 = v14;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v62);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v63, v62[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)a1, -1, 0x20u, 0, 0, &__p);
    if ((v61 & 0x80000000) == 0)
      return;
    v15 = __p;
    goto LABEL_15;
  }
  if (v4 == (const _xpc_type_s *)MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(*a2);
    v17 = &v59;
    v58[0] = 5;
    v59 = value;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    v18 = *(_BYTE *)a1;
    *(_BYTE *)a1 = v58[0];
    v58[0] = v18;
    v19 = a1[1];
    a1[1] = v59;
    v59 = v19;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    v20 = v58[0];
    goto LABEL_17;
  }
  if (v4 != (const _xpc_type_s *)MEMORY[0x1E0C812C8])
  {
    if (v4 != (const _xpc_type_s *)MEMORY[0x1E0C812E8])
    {
      if (v4 == (const _xpc_type_s *)MEMORY[0x1E0C812D0])
      {
        v34 = xpc_BOOL_get_value(*a2);
        v17 = &v53;
        v52[0] = 4;
        v53 = v34;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        v35 = *(_BYTE *)a1;
        *(_BYTE *)a1 = v52[0];
        v52[0] = v35;
        v36 = a1[1];
        a1[1] = v53;
        v53 = v36;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        v20 = v52[0];
      }
      else
      {
        if (v4 != (const _xpc_type_s *)MEMORY[0x1E0C81398])
        {
          if (v4 == (const _xpc_type_s *)MEMORY[0x1E0C81350])
          {
            v48[0] = 0;
            v49 = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v48);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v48);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=((uint64_t)a1, (uint64_t)v48);
            v7 = (uint64_t **)v48;
          }
          else if (v4 == (const _xpc_type_s *)MEMORY[0x1E0C81300])
          {
            *(_QWORD *)out = xpc_double_get_value(*a2);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<double,double,0>((uint64_t)v47, (uint64_t *)out);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=((uint64_t)a1, (uint64_t)v47);
            v7 = (uint64_t **)v47;
          }
          else
          {
            if (v4 != (const _xpc_type_s *)MEMORY[0x1E0C813A0])
            {
              memset(out, 170, 24);
              name = (char *)xpc_type_get_name(v4);
              std::string::basic_string[abi:ne180100]<0>(out, name);
              exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::operator+<char>();
              v42 = std::string::append(&v44, ") cannot be converted and is invalid");
              v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
              v45.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v43;
              v42->__r_.__value_.__l.__size_ = 0;
              v42->__r_.__value_.__r.__words[2] = 0;
              v42->__r_.__value_.__r.__words[0] = 0;
              std::logic_error::logic_error(exception, &v45);
              exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
              __cxa_throw(exception, (struct type_info *)off_1E4DEAED0, MEMORY[0x1E0DE4360]);
            }
            *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
            *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)out = v5;
            *(_OWORD *)&out[16] = v5;
            bytes = xpc_uuid_get_bytes(*a2);
            uuid_unparse_lower(bytes, out);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char (&)[37],char [37],0>((uint64_t)v46, out);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=((uint64_t)a1, (uint64_t)v46);
            v7 = (uint64_t **)v46;
          }
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v7);
          return;
        }
        v37 = xpc_uint64_get_value(*a2);
        v17 = &v51;
        v50[0] = 6;
        v51 = v37;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        v38 = *(_BYTE *)a1;
        *(_BYTE *)a1 = v50[0];
        v50[0] = v38;
        v39 = a1[1];
        a1[1] = v51;
        v51 = v39;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        v20 = v50[0];
      }
LABEL_17:
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)v17, v20);
      return;
    }
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(*a2);
    length = xpc_data_get_length(*a2);
    hex(bytes_ptr, length, (std::string *)out);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v54, (uint64_t)out);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v54);
    v32 = *(_BYTE *)a1;
    *(_BYTE *)a1 = v54[0];
    v54[0] = v32;
    v33 = (uint64_t *)a1[1];
    a1[1] = (uint64_t)v55;
    v55 = v33;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v54);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v55, v54[0]);
    if ((out[23] & 0x80000000) == 0)
      return;
    v15 = *(void **)out;
LABEL_15:
    operator delete(v15);
    return;
  }
  memset(out, 170, 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v45, 0, 0, 0, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)&v45, out);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45.__r_.__value_.__l.__size_, v45.__r_.__value_.__s.__data_[0]);
  count = xpc_array_get_count(*a2);
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve((uint64_t *)out, count);
  if (count)
  {
    for (i = 0; i != count; ++i)
    {
      v23 = xpc_array_get_value(*a2, i);
      v24 = v23;
      v44.__r_.__value_.__r.__words[0] = (std::string::size_type)v23;
      if (v23)
      {
        xpc_retain(v23);
      }
      else
      {
        v24 = xpc_null_create();
        v44.__r_.__value_.__r.__words[0] = (std::string::size_type)v24;
      }
      xpc_to_json((uint64_t *)&v45, (const applesauce::xpc::object *)&v44);
      v25 = *(_QWORD *)&out[8];
      if (*(_QWORD *)&out[8] >= *(_QWORD *)&out[16])
      {
        v26 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t *)out, (uint64_t)&v45);
      }
      else
      {
        **(_BYTE **)&out[8] = v45.__r_.__value_.__s.__data_[0];
        *(_QWORD *)(v25 + 8) = v45.__r_.__value_.__l.__size_;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45);
        v45.__r_.__value_.__s.__data_[0] = 0;
        v45.__r_.__value_.__l.__size_ = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v25);
        v26 = v25 + 16;
      }
      *(_QWORD *)&out[8] = v26;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45.__r_.__value_.__l.__size_, v45.__r_.__value_.__s.__data_[0]);
      xpc_release(v24);
    }
  }
  v56[0] = 2;
  v27 = (uint64_t *)operator new(0x18uLL);
  *(_OWORD *)v27 = *(_OWORD *)out;
  v27[2] = *(_QWORD *)&out[16];
  memset(out, 0, 24);
  v57 = v27;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  v28 = *(_BYTE *)a1;
  *(_BYTE *)a1 = v56[0];
  v56[0] = v28;
  v29 = (uint64_t *)a1[1];
  a1[1] = (uint64_t)v57;
  v57 = v29;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v57, v56[0]);
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)out;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
}

void sub_1A4CFA8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t **v21;
  void *v22;
  int v23;
  uint64_t v24;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v23 & 1) == 0)
    {
LABEL_8:
      if (*(char *)(v24 - 105) < 0)
        operator delete(*(void **)(v24 - 128));
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v21);
      _Unwind_Resume(a1);
    }
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(unsigned __int8 *a1, char *__s)
{
  int v4;
  _QWORD *v5;
  uint64_t **v6;
  uint64_t *v7;
  nlohmann::detail::exception *exception;
  char *v10;
  std::string *v11;
  __int128 v12;
  std::string v13;
  void *__p[2];
  std::string::size_type v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (!*a1)
  {
    *a1 = 1;
    v5 = operator new(0x18uLL);
    v5[2] = 0;
    v5[1] = 0;
    *v5 = v5 + 1;
    *((_QWORD *)a1 + 1) = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    v4 = *a1;
  }
  if (v4 != 1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v10 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v13, v10);
    v11 = std::string::insert(&v13, 0, "cannot use operator[] with a string argument with ");
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v15 = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(305, (uint64_t)__p, exception);
  }
  v6 = (uint64_t **)*((_QWORD *)a1 + 1);
  std::string::basic_string[abi:ne180100]<0>(__p, __s);
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
  v7 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v6, (const void **)__p, (uint64_t)&std::piecewise_construct, &v13);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  return v7 + 7;
}

void sub_1A4CFAB28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t v8;
  uint64_t *v9[4];

  v9[3] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v8 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  result = *v6;
  if (!*v6)
  {
    memset(v9, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)a1, a4, v9);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v6, v9[0]);
    return v9[0];
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, _OWORD **a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v5 = a1 + 8;
  memset(a3, 170, 24);
  v6 = operator new(0x48uLL);
  *a3 = v6;
  a3[1] = v5;
  v7 = *a2;
  v8 = *((_QWORD *)*a2 + 2);
  v6[2] = **a2;
  *((_QWORD *)v6 + 6) = v8;
  *v7 = 0;
  v7[1] = 0;
  v7[2] = 0;
  *((_QWORD *)v6 + 8) = 0;
  *((_BYTE *)v6 + 56) = 0;
  v9 = (uint64_t)v6 + 56;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v6 + 56);
  result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  *((_BYTE *)a3 + 16) = 1;
  return result;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  uint64_t v10;
  _BYTE **v11;
  _BYTE *v12;
  int v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  nlohmann::detail::exception *exception;
  uint64_t v19;
  uint64_t v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (!a3)
  {
LABEL_7:
    v13 = 1;
    if ((a4 & 1) != 0)
      goto LABEL_17;
    goto LABEL_10;
  }
  v10 = 32 * a3;
  v11 = (_BYTE **)(a2 + 16);
  while (1)
  {
    v12 = *v11;
    if (**v11 != 2
      || *(_QWORD *)(*((_QWORD *)v12 + 1) + 8) - **((_QWORD **)v12 + 1) != 32
      || *(_BYTE *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]((uint64_t)v12, 0) != 3)
    {
      break;
    }
    v11 += 4;
    v10 -= 32;
    if (!v10)
      goto LABEL_7;
  }
  v13 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_10:
    if (a5 == 2)
      v14 = 0;
    else
      v14 = v13;
    if (a5 != 1)
      LOBYTE(v13) = 1;
    if ((v13 & 1) == 0)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v20, "cannot create object from initializer list");
      nlohmann::detail::type_error::create(301, (uint64_t)v20, exception);
    }
    v13 = v14;
  }
LABEL_17:
  v15 = a2 + 32 * a3;
  if (v13)
  {
    *(_BYTE *)a1 = 1;
    v16 = operator new(0x18uLL);
    v16[2] = 0;
    v16[1] = 0;
    *v16 = v16 + 1;
    *(_QWORD *)(a1 + 8) = v16;
    std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(a2, v15, a1);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v19 = v15;
    v20[0] = a2;
    *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v20, &v19);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void sub_1A4CFAEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  v4 = operator new(0x18uLL);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  v4[2] = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a1 + 8) = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void hex(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  char *v6;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a3, 2 * a2);
  if (a2 >= 1)
  {
    v6 = (char *)&a1[a2];
    do
    {
    }
    while (a1 < (unsigned __int8 *)v6);
  }
}

void sub_1A4CFAFD8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

id __analytics_send_event_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  v4 = *(_BYTE *)a1;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)a2 = v4;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v5;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

uint64_t **nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(uint64_t **a1)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(a1 + 1, *(unsigned __int8 *)a1);
  return a1;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<double,double,0>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 8) = 0;
  v3 = *a2;
  *(_BYTE *)a1 = 7;
  *(_QWORD *)(a1 + 8) = v3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject **v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;
  const char *string;
  NSObject *v15;
  void **v16;
  int v17;
  dispatch_time_t v18;
  void *v19;
  dispatch_qos_class_t v20;
  dispatch_block_t v21;
  _QWORD v22[5];
  xpc_object_t v23;
  uint64_t v24;
  char v25;
  __int16 v26;
  xpc_object_t object;
  uint64_t v28;
  uint64_t *v29;
  void *__p[2];
  char v31;
  _BYTE block[32];
  NSObject **v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = *(NSObject ***)(a1 + 32);
  v5 = MEMORY[0x1A85A7704](a2);
  v6 = MEMORY[0x1E0C81258];
  if (v5 == MEMORY[0x1E0C81310])
  {
    if (a2 == MEMORY[0x1E0C81258])
    {
        ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_cold_1();
    }
    else if (a2 == MEMORY[0x1E0C81260])
    {
      string = xpc_dictionary_get_string(MEMORY[0x1E0C81260], (const char *)*MEMORY[0x1E0C81270]);
      {
        *(_DWORD *)block = 136446210;
        *(_QWORD *)&block[4] = string;
        _os_log_impl(&dword_1A4CF5000, v15, OS_LOG_TYPE_DEFAULT, "XPC message reply connection invalidated (client likely exiting): %{public}s", block, 0xCu);
      }
    }
  }
  if (a2 != v6 || *(_BYTE *)(a1 + 56) == 0)
  {
    v8 = *v4;
    *(_QWORD *)block = MEMORY[0x1E0C809B0];
    *(_QWORD *)&block[8] = 0x40000000;
    *(_QWORD *)&block[16] = ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke;
    *(_QWORD *)&block[24] = &__block_descriptor_tmp_32;
    v33 = v4;
    dispatch_sync(v8, block);
    dispatch_semaphore_signal(v4[4]);
  }
  else
  {
    {
      v11 = *(unsigned __int8 *)(a1 + 57);
      v13 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(a1 + 48);
      object = v12;
      if (v12)
        xpc_retain(v12);
      else
        object = xpc_null_create();
      try_xpc_to_json(&object, &v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v28, -1, 0x20u, 0, 1, __p);
      if (v31 >= 0)
        v16 = __p;
      else
        v16 = (void **)__p[0];
      *(_DWORD *)block = 67109634;
      *(_DWORD *)&block[4] = v11 + 1;
      *(_WORD *)&block[8] = 2048;
      *(_QWORD *)&block[10] = v13;
      *(_WORD *)&block[18] = 2080;
      *(_QWORD *)&block[20] = v16;
      _os_log_impl(&dword_1A4CF5000, v9, OS_LOG_TYPE_DEFAULT, "Queueing retry %d with delay (ms) %llu for message: %s", block, 0x1Cu);
      if (v31 < 0)
        operator delete(__p[0]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28);
      xpc_release(object);
    }
    v17 = *(unsigned __int8 *)(a1 + 58);
    v18 = dispatch_time(0, 1000000 * *(_QWORD *)(a1 + 40));
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 1174405120;
    v22[2] = ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_27;
    v22[3] = &__block_descriptor_tmp_28;
    v19 = *(void **)(a1 + 48);
    v22[4] = v4;
    v23 = v19;
    if (v19)
      xpc_retain(v19);
    else
      v23 = xpc_null_create();
    v25 = *(_BYTE *)(a1 + 58);
    v26 = *(_WORD *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 40);
    if (v17 == 1)
      v20 = QOS_CLASS_UTILITY;
    else
      v20 = QOS_CLASS_BACKGROUND;
    v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, v22);
    dispatch_after(v18, v4[3], v21);
    _Block_release(v21);
    xpc_release(v23);
  }
}

void sub_1A4CFB41C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t a14, uint64_t a15, uint64_t a16, xpc_object_t object, char a18)
{
  _Unwind_Resume(exception_object);
}

os_log_t sSetupSharedLogDomains(void)
{
  os_log_t result;

  qword_1ECD3AF80 = (uint64_t)os_log_create("com.apple.CoreAnalytics.Shared.critical", "evaluator");
  result = os_log_create("com.apple.CoreAnalytics.Shared.critical", "utils");
  qword_1ECD3AF88 = (uint64_t)result;
  return result;
}

void ___ZN13CoreAnalytics6Client3getEv_block_invoke()
{
  char v0;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZZN13CoreAnalytics6Client3getEvEUb_E3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_123;
  block[4] = &v0;
  dispatch_sync((dispatch_queue_t)CoreAnalytics::Client::get(void)::client[0], block);
}

void ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke(uint64_t a1, xpc_object_t object)
{
  NSObject **v2;
  xpc_object_t v3;
  NSObject *v4;
  _QWORD *v5;
  xpc_object_t v6;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject ***)(a1 + 32);
  if (object)
  {
    v3 = object;
    xpc_retain(object);
  }
  else
  {
    v3 = xpc_null_create();
  }
  v4 = *v2;
  v5 = (_QWORD *)operator new();
  *v5 = v2;
  v5[1] = v3;
  v6 = xpc_null_create();
  v7[0] = 0;
  dispatch_async_f(v4, v5, (dispatch_function_t)_ZZN10applesauce8dispatch2v15asyncIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5EEvP16dispatch_queue_sOT_ENUlPvE_8__invokeESA_);
  _ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(v7);
  xpc_release(v6);
}

void sub_1A4CFB634(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t *_ZZN10applesauce8dispatch2v15asyncIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5EEvP16dispatch_queue_sOT_ENUlPvE_8__invokeESA_(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  char *string;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  uint64_t v10;
  uint8_t buf[8];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v2 = *(_QWORD *)a1;
  v3 = *(void **)(a1 + 8);
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4CF5000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated (daemon unloaded/disabled)", buf, 2u);
    }
    *(_WORD *)(v2 + 60) = 0;
    if (*(_QWORD *)(v2 + 168))
    {
      string = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 8), (const char *)*MEMORY[0x1E0C81270]);
      std::string::basic_string[abi:ne180100]<0>(buf, string);
      v6 = *(_QWORD *)(v2 + 168);
      if (!v6)
        std::__throw_bad_function_call[abi:ne180100]();
      goto LABEL_15;
    }
  }
  else
  {
    if (v3 != (void *)MEMORY[0x1E0C81258])
    {
      if (v3)
      {
        *(_QWORD *)buf = *(_QWORD *)(a1 + 8);
        if (MEMORY[0x1A85A7704](v3) == MEMORY[0x1E0C812F8])
          xpc_retain(v3);
        else
          *(_QWORD *)buf = xpc_null_create();
        CoreAnalytics::Client::handleServerMessage_sync((CoreAnalytics::Client *)v2, (const applesauce::xpc::dict *)buf);
        xpc_release(*(xpc_object_t *)buf);
      }
      return _ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(&v10);
    }
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4CF5000, v7, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted (daemon probably exited)", buf, 2u);
    }
    *(_WORD *)(v2 + 60) = 0;
    if (*(_QWORD *)(v2 + 168))
    {
      v8 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 8), (const char *)*MEMORY[0x1E0C81270]);
      std::string::basic_string[abi:ne180100]<0>(buf, v8);
      v6 = *(_QWORD *)(v2 + 168);
      if (!v6)
        std::__throw_bad_function_call[abi:ne180100]();
LABEL_15:
      (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v6 + 48))(v6, buf);
      if (v12 < 0)
        operator delete(*(void **)buf);
    }
  }
  return _ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(&v10);
}

void sub_1A4CFB864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, xpc_object_t object, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CoreAnalytics::Client::handleServerMessage_sync(CoreAnalytics::Client *this, const applesauce::xpc::dict *a2)
{
  BOOL v4;
  BOOL v6;
  void **v8;
  void *v9;
  int v10;
  xpc_object_t object;
  uint64_t *v13[2];
  void *v14[3];
  void *__p[2];
  uint64_t v16;
  xpc_object_t v17[4];

  v17[3] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  v13[0] = (uint64_t *)a2;
  v13[1] = (uint64_t *)"notification";
  memset(v14, 170, sizeof(v14));
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, v17);
  __p[0] = 0;
  __p[1] = 0;
  v16 = 0;
  applesauce::xpc::dyn_cast_or_default();
  if (SHIBYTE(v16) < 0)
    operator delete(__p[0]);
  xpc_release(v17[0]);
  if ((HIBYTE(v14[2]) & 0x80) == 0)
  {
    if (HIBYTE(v14[2]) != 12)
    {
      if (HIBYTE(v14[2]) != 20)
        goto LABEL_31;
      v4 = v14[0] == (void *)0x72756769666E6F63 && v14[1] == (void *)0x68632D6E6F697461;
      if (!v4 || LODWORD(v14[2]) != 1701277281)
        goto LABEL_31;
LABEL_34:
      CoreAnalytics::Client::handleConfigurationChange_sync(this, a2);
      goto LABEL_35;
    }
    v8 = v14;
LABEL_27:
    v9 = *v8;
    v10 = *((_DWORD *)v8 + 2);
    if (v9 == (void *)0x2D6567617373656DLL && v10 == 1953066341)
    {
      CoreAnalytics::Client::handleSinkMessageEmit_sync(this, (xpc_object_t *)a2);
      goto LABEL_35;
    }
    goto LABEL_31;
  }
  if (v14[1] == (void *)12)
  {
    v8 = (void **)v14[0];
    goto LABEL_27;
  }
  if (v14[1] == (void *)20)
  {
    v6 = *(_QWORD *)v14[0] == 0x72756769666E6F63 && *((_QWORD *)v14[0] + 1) == 0x68632D6E6F697461;
    if (v6 && *((_DWORD *)v14[0] + 4) == 1701277281)
      goto LABEL_34;
  }
LABEL_31:
  {
    applesauce::xpc::object::object(&object, (void **)a2);
    try_xpc_to_json(&object, (uint64_t *)v13);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v13, -1, 0x20u, 0, 1, __p);
    CoreAnalytics::Client::handleServerMessage_sync();
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v13);
    xpc_release(object);
  }
LABEL_35:
  if (SHIBYTE(v14[2]) < 0)
    operator delete(v14[0]);
}

void sub_1A4CFBAFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CoreAnalytics::Client::handleConfigurationChange_sync(CoreAnalytics::Client *this, const applesauce::xpc::dict *a2)
{
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  __n128 v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  _QWORD *v17;
  _QWORD *i;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27[3];
  __int128 v28;
  xpc_object_t object[2];
  void *v30;
  __int128 v31;
  xpc_object_t v32;
  uint8_t buf[8];
  std::__shared_weak_count *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)((char *)this + 80);
  v5 = *((_QWORD *)this + 10);
  v32 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v31 = a2;
  *((_QWORD *)&v31 + 1) = "configuration";
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v31, &v32);
  if (MEMORY[0x1A85A7704](v32) == MEMORY[0x1E0C81350])
  {
      CoreAnalytics::Client::handleConfigurationChange_sync();
  }
  else
  {
    *(_QWORD *)&v31 = a2;
    *((_QWORD *)&v31 + 1) = "configuration-size";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v31, (xpc_object_t *)buf);
    v6 = (void *)MEMORY[0x1A85A6F78](buf, 0);
    xpc_release(*(xpc_object_t *)buf);
    v30 = v6;
    if (v6)
    {
      *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      std::pair<applesauce::xpc::object,unsigned long>::pair[abi:ne180100]<applesauce::xpc::object&,unsigned long &,0>(object, &v32, &v30);
      FrameworkConfiguration::create(object, (std::__shared_weak_count **)&v31);
      xpc_release(object[0]);
      object[0] = 0;
      *(_OWORD *)v27 = v31;
      v31 = 0uLL;
      v7 = std::atomic_exchange[abi:ne180100]<FrameworkConfiguration const>(v4, v27, &v28);
      v8 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
      if (*((_QWORD *)&v28 + 1))
      {
        v9 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v8->__on_zero_shared)(v8, v7);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      v11 = (std::__shared_weak_count *)v27[1];
      if (v27[1])
      {
        v12 = (unint64_t *)(v27[1] + 8);
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v11->__on_zero_shared)(v11, v7);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (!*v4)
      {
          CoreAnalytics::Client::handleConfigurationChange_sync();
        goto LABEL_36;
      }
      if (v5)
      {
        if (!v15)
          goto LABEL_26;
        *(_WORD *)buf = 0;
        v16 = "Received configuration update from daemon (change)";
      }
      else
      {
        if (!v15)
          goto LABEL_26;
        *(_WORD *)buf = 0;
        v16 = "Received configuration update from daemon (initial)";
      }
      _os_log_impl(&dword_1A4CF5000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
LABEL_26:
      v17 = (_QWORD *)*((_QWORD *)this + 12);
      for (i = (_QWORD *)*((_QWORD *)this + 13); v17 != i; v17 += 2)
      {
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        v19 = (std::__shared_weak_count *)v17[1];
        if (v19)
        {
          v20 = std::__shared_weak_count::lock(v19);
          v34 = v20;
          if (v20)
          {
            v21 = v20;
            *(_QWORD *)buf = *v17;
            if (*(_QWORD *)buf)
              (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)buf + 16))(*(_QWORD *)buf, *v4);
            p_shared_owners = (unint64_t *)&v21->__shared_owners_;
            do
              v23 = __ldaxr(p_shared_owners);
            while (__stlxr(v23 - 1, p_shared_owners));
            if (!v23)
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
          }
        }
      }
LABEL_36:
      v24 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
      if (*((_QWORD *)&v31 + 1))
      {
        v25 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      goto LABEL_41;
    }
      CoreAnalytics::Client::handleConfigurationChange_sync();
  }
LABEL_41:
  xpc_release(v32);
}

void sub_1A4CFBEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, xpc_object_t object)
{
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(uint64_t a1@<X0>, xpc_object_t *a2@<X8>)
{
  id v3;
  id v4;

  applesauce::xpc::dict::object_proxy::operator*(a1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *a2 = v3;
  v4 = v3;
  if (!v3)
    *a2 = xpc_null_create();

}

id applesauce::xpc::dict::object_proxy::operator*(uint64_t a1)
{
  void *v2;
  void *v3;

  applesauce::xpc::dict::operator*(*(id **)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v2, *(const char **)(a1 + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A4CFC00C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void FrameworkConfiguration::create(_QWORD *a1@<X0>, std::__shared_weak_count **a2@<X8>)
{
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v7;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1A85A7704](*a1) == MEMORY[0x1E0C81388])
  {
    v5 = (std::__shared_weak_count *)operator new(0x38uLL);
    v5->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    v5->__shared_weak_owners_ = 0;
    v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBAA8;
    v7 = v5 + 1;
    MemoryMappedBuffer::fromXpcShmem(a1, (uint64_t *)&v5[1]);
    v5[2].__vftable = 0;
    if (!FrameworkConfiguration::init((FrameworkConfiguration *)&v5[1]))
    {
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
      v7 = 0;
      v5 = 0;
    }
    *a2 = v7;
    a2[1] = v5;
  }
  else
  {
    {
      v9 = 0;
      _os_log_impl(&dword_1A4CF5000, v4, OS_LOG_TYPE_DEFAULT, "[FrameworkConfiguration] #Error: Received configuration update from daemon but was wrong type.", (uint8_t *)&v9, 2u);
    }
    *a2 = 0;
    a2[1] = 0;
  }
}

BOOL FrameworkConfiguration::init(FrameworkConfiguration *this)
{
  unsigned int *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  _BOOL8 result;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(unsigned int **)this;
  if (*(_QWORD *)this == -1)
  {
    if (!result)
      return result;
    FrameworkConfiguration::init(v7);
    return 0;
  }
  *((_QWORD *)this + 2) = v1;
  v2 = *v1;
  if ((_DWORD)v2 != -258926936)
  {
    if (!result)
      return result;
    FrameworkConfiguration::init(v2, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  if (v1[1] != 1)
  {
    if (!result)
      return result;
    FrameworkConfiguration::init(v15, v16, v17, v18, v19, v20, v21, v22);
    return 0;
  }
  v3 = v1[5];
  v4 = *((_QWORD *)this + 1);
  if (v4 < v3)
  {
    if (!result)
      return result;
    FrameworkConfiguration::init(v3, v4, v5);
    return 0;
  }
  *((_QWORD *)this + 3) = (char *)v1 + v3 + 1;
  return 1;
}

size_t MemoryMappedBuffer::fromXpcShmem@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  size_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7[2];

  v7[1] = *(void **)MEMORY[0x1E0C80C00];
  result = MEMORY[0x1A85A7704](*a1);
  if (result != MEMORY[0x1E0C81350] && (result = MEMORY[0x1A85A7704](*a1), result == MEMORY[0x1E0C81388]))
  {
    v7[0] = 0;
    result = xpc_shmem_map((xpc_object_t)*a1, v7);
    v5 = (uint64_t)v7[0];
    if (v7[0] != 0 && result != 0)
    {
      v6 = a1[1];
    }
    else
    {
      v5 = -1;
      v6 = 0;
    }
    *a2 = v5;
    a2[1] = v6;
  }
  else
  {
    *a2 = -1;
    a2[1] = 0;
  }
  return result;
}

void sub_1A4CFC35C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void CoreAnalytics::Client::init(CoreAnalytics::Client *this)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    CoreAnalytics::Client::init(void)::exitQueue = (uint64_t)dispatch_queue_create("com.apple.CoreAnalytics::Client Exit Queue", v5);
  }
  {
    CoreAnalytics::Client::init(void)::signalSource = (uint64_t)dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, (dispatch_queue_t)CoreAnalytics::Client::init(void)::exitQueue);
  }
  dispatch_source_set_event_handler((dispatch_source_t)CoreAnalytics::Client::init(void)::signalSource, &__block_literal_global_17);
  dispatch_activate((dispatch_object_t)CoreAnalytics::Client::init(void)::signalSource);
  CoreAnalytics::Client::initConnection(this);
  v4 = *(NSObject **)this;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = ___ZN13CoreAnalytics6Client4initEv_block_invoke_2;
  v6[3] = &__block_descriptor_tmp_19;
  v6[4] = this;
  notify_register_dispatch("com.apple.analyticsd.running", (int *)this + 14, v4, v6);
  CoreAnalytics::Client::updateDaemonState(this);
}

void CoreAnalytics::Client::updateDaemonState(CoreAnalytics::Client *this)
{
  int v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t state64;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(*((_DWORD *)this + 14), &state64);
  v2 = *((unsigned __int8 *)this + 60);
  v3 = state64;
  v4 = state64 != 0;
  *((_BYTE *)this + 60) = v4;
  if (v2 == v4)
  {
      CoreAnalytics::Client::updateDaemonState(v3 != 0, v5, v6, v7, v8, v9, v10, v11);
  }
  {
    *(_DWORD *)buf = 67109376;
    v14 = v2;
    v15 = 1024;
    v16 = v3 != 0;
    _os_log_impl(&dword_1A4CF5000, v5, OS_LOG_TYPE_INFO, "Daemon status changed from %d to %d", buf, 0xEu);
  }
  if (!*((_BYTE *)this + 60))
    *((_BYTE *)this + 61) = 0;
}

void CoreAnalytics::Client::initConnection(CoreAnalytics::Client *this)
{
  void *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  int foreground_uid;
  NSObject *v9;
  _QWORD v10[5];
  int v11;
  int out_token[2];
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  mach_service = xpc_connection_create_mach_service("com.apple.analyticsd", *((dispatch_queue_t *)this + 2), 0);
  if ((mach_service || (mach_service = xpc_null_create()) != 0)
    && MEMORY[0x1A85A7704](mach_service) == MEMORY[0x1E0C812E0])
  {
    xpc_retain(mach_service);
    v3 = mach_service;
  }
  else
  {
    v3 = xpc_null_create();
  }
  v4 = xpc_null_create();
  v5 = (void *)*((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v3;
  xpc_release(v5);
  xpc_release(v4);
  xpc_release(mach_service);
  v6 = MEMORY[0x1E0C809B0];
  v7 = (_xpc_connection_s *)*((_QWORD *)this + 6);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_22;
  handler[4] = this;
  xpc_connection_set_event_handler(v7, handler);
  if (xpc_user_sessions_enabled())
  {
    out_token[1] = 0;
    foreground_uid = xpc_user_sessions_get_foreground_uid();
    xpc_connection_set_target_user_session_uid();
    out_token[0] = 0;
    v9 = *(NSObject **)this;
    v10[0] = v6;
    v10[1] = 0x40000000;
    v10[2] = ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke_24;
    v10[3] = &__block_descriptor_tmp_25;
    v10[4] = this;
    v11 = foreground_uid;
    notify_register_dispatch("com.apple.mobile.usermanagerd.foregrounduser_changed", out_token, v9, v10);
  }
  xpc_connection_activate(*((xpc_connection_t *)this + 6));
}

void sub_1A4CFC7B8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_1A4CFCB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  void *v29;
  void *v30;
  void *v31;

  __cxa_free_exception(v31);

  _Unwind_Resume(a1);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, id *a2)
{
  id v3;
  xpc_object_t v4;
  void *v5;

  v3 = *a2;
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

{
  id v3;
  xpc_object_t v4;
  void *v5;

  applesauce::xpc::dict::operator*(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

uint64_t std::__shared_ptr_emplace<`anonymous namespace'::EventObserverImpl>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void CoreAnalytics::Client::sendManagementCommandWithReply(NSObject **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, xpc_object_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  NSObject **v22;
  uint64_t *v23;
  xpc_object_t object;
  const char *v25;
  void (*v26)(uint64_t);
  void *v27;
  xpc_connection_t *v28;
  uint64_t *v29;
  xpc_connection_t v30[4];

  v30[3] = *(xpc_connection_t *)MEMORY[0x1E0C80C00];
  v8 = MEMORY[0x1A85A7704](*a3);
  v9 = MEMORY[0x1E0C812F8];
  if (v8 != MEMORY[0x1E0C812F8])
  {
    applesauce::xpc::dict::create(&object);
    v10 = object;
    object = xpc_null_create();
    v11 = (void *)*a3;
    *a3 = v10;
    xpc_release(v11);
    xpc_release(object);
  }
  if (os_log_type_enabled((os_log_t)qword_1ECD3AF70, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)*a3;
    v21 = v12;
    if (v12)
      xpc_retain(v12);
    else
      v21 = xpc_null_create();
    try_xpc_to_json(&v21, (uint64_t *)&v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v22, -1, 0x20u, 0, 1, &object);
    CoreAnalytics::Client::sendManagementCommandWithReply();
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v23, v22);
    xpc_release(v21);
  }
  if (*(char *)(a2 + 23) >= 0)
    v13 = (const char *)a2;
  else
    v13 = *(const char **)a2;
  v19 = xpc_string_create(v13);
  if (!v19)
    v19 = xpc_null_create();
  object = a3;
  v25 = "command";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&object, &v19, &v20);
  xpc_release(v20);
  v20 = 0;
  xpc_release(v19);
  v19 = 0;
  v17 = xpc_int64_create(1);
  if (!v17)
    v17 = xpc_null_create();
  object = a3;
  v25 = "priority";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&object, &v17, &v18);
  xpc_release(v18);
  v18 = 0;
  xpc_release(v17);
  v17 = 0;
  v14 = *a1;
  v22 = a1;
  v30[0] = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  v30[0] = (xpc_connection_t)xpc_null_create();
  object = (xpc_object_t)MEMORY[0x1E0C809B0];
  v25 = (const char *)0x40000000;
  v26 = ___ZN10applesauce8dispatch2v19sync_implIZNK13CoreAnalytics6Client30sendManagementCommandWithReplyENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS_3xpc4dictEE3__0EENS5_5decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  v27 = &__block_descriptor_tmp_124;
  v28 = v30;
  v29 = (uint64_t *)&v22;
  dispatch_sync(v14, &object);
  if (MEMORY[0x1A85A7704](v30[0]) == MEMORY[0x1E0C812E0])
  {
    v15 = xpc_connection_send_message_with_reply_sync(v30[0], (xpc_object_t)*a3);
    v16 = v15;
    if (v15)
    {
      *a4 = v15;
    }
    else
    {
      v16 = xpc_null_create();
      *a4 = v16;
      if (!v16)
        goto LABEL_21;
    }
    if (MEMORY[0x1A85A7704](v16) == v9)
    {
      xpc_retain(v16);
      goto LABEL_23;
    }
LABEL_21:
    *a4 = xpc_null_create();
LABEL_23:
    xpc_release(v16);
    goto LABEL_24;
  }
  *a4 = xpc_null_create();
LABEL_24:
  xpc_release(v30[0]);
}

void sub_1A4CFCFE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, char a15)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void `anonymous namespace'::EventObserverImpl::~EventObserverImpl(id *this)
{

  objc_destroyWeak(this + 2);
  objc_destroyWeak(this + 1);
  CoreAnalytics::EventObserver::~EventObserver((CoreAnalytics::EventObserver *)this);
}

{

  objc_destroyWeak(this + 2);
  objc_destroyWeak(this + 1);
  CoreAnalytics::EventObserver::~EventObserver((CoreAnalytics::EventObserver *)this);
  JUMPOUT(0x1A85A70E0);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, const char *string)
{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  v3 = xpc_string_create(string);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

void applesauce::xpc::array::create(xpc_object_t *a1@<X8>)
{
  xpc_object_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = xpc_array_create(0, 0);
  v6 = v3;
  if (!v3)
    v3 = xpc_null_create();

  v4 = v3;
  v5 = v4;
  *a1 = v4;
  if (!v4 || MEMORY[0x1A85A7704](v4) != MEMORY[0x1E0C812C8])
  {
    *a1 = xpc_null_create();

  }
}

void analytics_tool_log_dump(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  CoreAnalytics::Client *v4;
  id v5;
  void *v6;
  uint64_t *v7;
  id v8;
  xpc_object_t v9;
  xpc_object_t v10;
  id v11;
  void *exception;
  _QWORD v13[2];
  xpc_object_t v14;
  id v15;
  void *__p[2];
  char v17;
  xpc_object_t v18;
  void *v19;
  id v20;
  id v21;
  id *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v21 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v21);
  if (*(_BYTE *)(a1 + 24))
  {
    applesauce::xpc::object::object(&v19, a1);
    v22 = &v21;
    v23 = "aggPeriod";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v19, &v20);
    v5 = v20;
    v20 = 0;

    v6 = v19;
    v19 = 0;

  }
  v18 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v7 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "log-dump");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, &v21);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v7, (uint64_t)__p, &v15, &v18);
  v8 = v15;
  v15 = 0;

  if (v17 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v18) == MEMORY[0x1E0C812F8])
  {
    v22 = &v18;
    v23 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "log-dump failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v22 = &v18;
    v23 = "log-dump";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      v13[0] = &v18;
      v13[1] = "log-dump";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, &v14);
      v22 = 0;
      v23 = 0;
      v24 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v24) < 0)
        operator delete(v22);
      v9 = v14;
      v14 = 0;

    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v18);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "unknown");
  }
  v10 = v18;
  v18 = 0;

  v11 = v21;
  v21 = 0;

}

void sub_1A4CFD570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20)
{
  uint64_t v20;
  void *v22;

  if (*(char *)(v20 - 41) < 0)
    operator delete(*(void **)(v20 - 64));

  v22 = *(void **)(v20 - 72);
  *(_QWORD *)(v20 - 72) = 0;

  _Unwind_Resume(a1);
}

void **applesauce::xpc::object::object(void **a1, uint64_t a2)
{
  const char *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;

  if (*(char *)(a2 + 23) >= 0)
    v3 = (const char *)a2;
  else
    v3 = *(const char **)a2;
  v4 = xpc_string_create(v3);
  *a1 = v4;
  if (!v4)
  {
    v5 = xpc_null_create();
    v6 = *a1;
    *a1 = v5;

  }
  return a1;
}

BOOL applesauce::xpc::dict::object_proxy::operator BOOL(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  applesauce::xpc::dict::operator*(*(id **)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v2, *(const char **)(a1 + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void sub_1A4CFD6E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void applesauce::xpc::dyn_cast<std::string>()
{
  applesauce::xpc::dyn_cast_or_default();
}

void sub_1A4CFD760(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void analytics_tool_log_transform_counts(_QWORD *a1@<X8>)
{
  CoreAnalytics::Client *v2;
  uint64_t *v3;
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  id v7;
  void *exception;
  _QWORD v9[2];
  xpc_object_t v10;
  id v11;
  void *__p[2];
  char v13;
  xpc_object_t v14;
  id v15;
  xpc_object_t *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v15 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v15);
  v14 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "log-transform-counts");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v11, &v15);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v11, &v14);
  v4 = v11;
  v11 = 0;

  if (v13 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v14) == MEMORY[0x1E0C812F8])
  {
    v16 = &v14;
    v17 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v16))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "log-transform-counts failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v16 = &v14;
    v17 = "log-transform-counts";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v16))
    {
      v9[0] = &v14;
      v9[1] = "log-transform-counts";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v9, &v10);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v18) < 0)
        operator delete(v16);
      v5 = v10;
      v10 = 0;

    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v14);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
  v6 = v14;
  v14 = 0;

  v7 = v15;
  v15 = 0;

}

void sub_1A4CFD964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,void *a21)
{
  uint64_t v21;

  if (*(char *)(v21 - 41) < 0)
    operator delete(*(void **)(v21 - 64));

  _Unwind_Resume(a1);
}

void analytics_tool_config_dump(_QWORD *a1@<X8>)
{
  CoreAnalytics::Client *v2;
  uint64_t *v3;
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  id v7;
  void *exception;
  xpc_object_t *v9;
  const char *v10;
  xpc_object_t v11;
  id v12;
  void *__p[2];
  char v14;
  xpc_object_t v15;
  id v16;
  xpc_object_t *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v16);
  v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-dump");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v12, &v16);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v12, &v15);
  v4 = v12;
  v12 = 0;

  if (v14 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v15) == MEMORY[0x1E0C812F8])
  {
    v17 = &v15;
    v18 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "config-dump failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v17 = &v15;
    v18 = "config-dump";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17))
    {
      v9 = &v15;
      v10 = "config-dump";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v9, &v11);
      v17 = 0;
      v18 = 0;
      v19 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v19) < 0)
        operator delete(v17);
    }
    else
    {
      v17 = &v15;
      v18 = "config-info";
      if (!applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17))
      {
        applesauce::xpc::object::to_string((applesauce::xpc::object *)&v15);
        goto LABEL_15;
      }
      v9 = &v15;
      v10 = "config-info";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v9, &v11);
      v17 = 0;
      v18 = 0;
      v19 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v19) < 0)
        operator delete(v17);
    }
    v5 = v11;
    v11 = 0;

  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
LABEL_15:
  v6 = v15;
  v15 = 0;

  v7 = v16;
  v16 = 0;

}

void sub_1A4CFDC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,void *a21)
{
  uint64_t v21;

  if (*(char *)(v21 - 41) < 0)
    operator delete(*(void **)(v21 - 64));

  _Unwind_Resume(a1);
}

void analytics_tool_config_list(_QWORD *a1@<X8>)
{
  CoreAnalytics::Client *v2;
  uint64_t *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *exception;
  _QWORD v8[2];
  xpc_object_t v9;
  xpc_object_t v10;
  void *__p[2];
  char v12;
  xpc_object_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-list");
  applesauce::xpc::dict::create(&v10);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v10, &v13);
  v4 = v10;
  v10 = 0;

  if (v12 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v13) == MEMORY[0x1E0C812F8])
  {
    v14 = &v13;
    v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "config-list failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v14 = &v13;
    v15 = "config-list";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      v8[0] = &v13;
      v8[1] = "config-list";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v8, &v9);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v16) < 0)
        operator delete(v14);
      v5 = v9;
      v9 = 0;

    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v13);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
  v6 = v13;
  v13 = 0;

}

void sub_1A4CFDF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void analytics_tool_config_info(_QWORD *a1@<X8>)
{
  CoreAnalytics::Client *v2;
  uint64_t *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *exception;
  _QWORD v8[2];
  xpc_object_t v9;
  xpc_object_t v10;
  void *__p[2];
  char v12;
  xpc_object_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-info");
  applesauce::xpc::dict::create(&v10);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v10, &v13);
  v4 = v10;
  v10 = 0;

  if (v12 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v13) == MEMORY[0x1E0C812F8])
  {
    v14 = &v13;
    v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "config-info failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v14 = &v13;
    v15 = "config-info";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      v8[0] = &v13;
      v8[1] = "config-info";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v8, &v9);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v16) < 0)
        operator delete(v14);
      v5 = v9;
      v9 = 0;

    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v13);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
  v6 = v13;
  v13 = 0;

}

void sub_1A4CFE180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void analytics_tool_config_reload(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  void *exception;
  _QWORD v5[2];
  xpc_object_t v6;
  void *__p[2];
  char v8;
  xpc_object_t v9[2];

  v9[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v9[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-reload");
  applesauce::xpc::dict::create(&v6);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v6, v9);
  v2 = v6;
  v6 = 0;

  if (v8 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v9[0]) == MEMORY[0x1E0C812F8])
  {
    v5[0] = v9;
    v5[1] = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)v5))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "Config-reload failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v3 = v9[0];
  v9[0] = 0;

}

void sub_1A4CFE348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);
  v20 = *(void **)(v18 - 32);
  *(_QWORD *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_config_set_tasking(uint64_t a1)
{
  id v2;
  void *v3;
  CoreAnalytics::Client *v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  void *exception;
  xpc_object_t v13;
  id v14;
  void *__p[2];
  char v16;
  xpc_object_t v17;
  id *v18;
  const char *v19;
  void *v20;
  id v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v22[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  v18 = v22;
  v19 = "string-config";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  v2 = v21;
  v21 = 0;

  v3 = v20;
  v20 = 0;

  v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "set-tasking-old");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  v6 = v14;
  v14 = 0;

  if (v16 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v17) == MEMORY[0x1E0C812F8])
  {
    v18 = &v17;
    v19 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "Config-set-tasking (old style config) failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v18 = &v17;
  v19 = "set-tasking-old";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    v18 = &v17;
    v19 = "set-tasking-old";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
    v7 = applesauce::xpc::dyn_cast_or_default();
    v8 = v13;
    v13 = 0;

  }
  else
  {
    v7 = 0;
  }
  v9 = v17;
  v17 = 0;

  v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A4CFE5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);

  v20 = *(void **)(v18 - 32);
  *(_QWORD *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_config_set_tasking_ndjson(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  CoreAnalytics::Client *v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  id v12;
  void *exception;
  xpc_object_t v15;
  id v16;
  void *__p[2];
  char v18;
  xpc_object_t v19;
  id v20;
  id v21;
  id *v22;
  const char *v23;
  id v24;
  id v25;
  id v26[2];

  v26[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v26[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v26);
  applesauce::xpc::object::object((applesauce::xpc::object *)&v24, (id *)a1);
  v22 = v26;
  v23 = "mmap-config";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v24, &v25);
  v2 = v25;
  v25 = 0;

  v3 = v24;
  v24 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v20, *(_QWORD *)(a1 + 8));
  v22 = v26;
  v23 = "mmap-config-size";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v20, &v21);
  v4 = v21;
  v21 = 0;

  v5 = v20;
  v20 = 0;

  v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v7 = CoreAnalytics::Client::get(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, "set-tasking");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v16, v26);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v7, (uint64_t)__p, &v16, &v19);
  v8 = v16;
  v16 = 0;

  if (v18 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v19) == MEMORY[0x1E0C812F8])
  {
    v22 = &v19;
    v23 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "Config-set-tasking (ndjson) failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v22 = &v19;
  v23 = "set-tasking";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
  {
    v22 = &v19;
    v23 = "set-tasking";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v22, &v15);
    v9 = applesauce::xpc::dyn_cast_or_default();
    v10 = v15;
    v15 = 0;

  }
  else
  {
    v9 = 0;
  }
  v11 = v19;
  v19 = 0;

  v12 = v26[0];
  v26[0] = 0;

  return v9;
}

void sub_1A4CFE8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);

  v20 = *(void **)(v18 - 32);
  *(_QWORD *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, int64_t value)
{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  v3 = xpc_int64_create(value);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  v3 = xpc_int64_create(value);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

void analytics_tool_config_set_reboot_clear(BOOL a1)
{
  id v2;
  id v3;
  CoreAnalytics::Client *v4;
  uint64_t *v5;
  id v6;
  xpc_object_t v7;
  id v8;
  void *exception;
  id v10;
  void *__p[2];
  char v12;
  xpc_object_t v13;
  id *v14;
  const char *v15;
  id v16;
  id v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v18[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v18);
  applesauce::xpc::object::object((applesauce::xpc::object *)&v16, a1);
  v14 = v18;
  v15 = "should-clear-config-after-reboot";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v14, &v16, &v17);
  v2 = v17;
  v17 = 0;

  v3 = v16;
  v16 = 0;

  v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "set-clear-config-after-reboot");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v10, v18);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v10, &v13);
  v6 = v10;
  v10 = 0;

  if (v12 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v13) == MEMORY[0x1E0C812F8])
  {
    v14 = &v13;
    v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "Set-clear-config-after-reboot failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v7 = v13;
  v13 = 0;

  v8 = v18[0];
  v18[0] = 0;

}

void sub_1A4CFEB68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);

  v20 = *(void **)(v18 - 32);
  *(_QWORD *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, BOOL value)
{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  v3 = xpc_BOOL_create(value);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

void analytics_tool_insert_query_state(uint64_t a1, id *a2, id *a3)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  CoreAnalytics::Client *v12;
  uint64_t *v13;
  id v14;
  xpc_object_t v15;
  id v16;
  void *exception;
  id v18;
  void *__p[2];
  char v20;
  xpc_object_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  const char *v27;
  void *v28;
  id v29;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v30[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v30);
  applesauce::xpc::object::object(&v28, a1);
  v26 = v30;
  v27 = "state-name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v28, &v29);
  v6 = v29;
  v29 = 0;

  v7 = v28;
  v28 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v24, a2);
  v26 = v30;
  v27 = "state";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v24, &v25);
  v8 = v25;
  v25 = 0;

  v9 = v24;
  v24 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v22, a3);
  v26 = v30;
  v27 = "state-parameters";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v22, &v23);
  v10 = v23;
  v23 = 0;

  v11 = v22;
  v22 = 0;

  v21 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v13 = CoreAnalytics::Client::get(v12);
  std::string::basic_string[abi:ne180100]<0>(__p, "insert-query-state");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v18, v30);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v13, (uint64_t)__p, &v18, &v21);
  v14 = v18;
  v18 = 0;

  if (v20 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v21) == MEMORY[0x1E0C812F8])
  {
    v26 = &v21;
    v27 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v26))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "insert-query-state failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v15 = v21;
  v21 = 0;

  v16 = v30[0];
  v30[0] = 0;

}

void sub_1A4CFEEAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);

  v20 = *(void **)(v18 - 48);
  *(_QWORD *)(v18 - 48) = 0;

  _Unwind_Resume(a1);
}

void analytics_tool_query_state(uint64_t a1, id *a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  CoreAnalytics::Client *v8;
  uint64_t *v9;
  id v10;
  xpc_object_t v11;
  xpc_object_t v12;
  id v13;
  void *exception;
  _QWORD v15[2];
  xpc_object_t v16;
  id v17;
  void *__p[2];
  char v19;
  xpc_object_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v25 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v25);
  applesauce::xpc::object::object(&v23, a1);
  v26 = &v25;
  v27 = "state-name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v23, &v24);
  v4 = v24;
  v24 = 0;

  v5 = v23;
  v23 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v21, a2);
  v26 = &v25;
  v27 = "state-parameters";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v21, &v22);
  v6 = v22;
  v22 = 0;

  v7 = v21;
  v21 = 0;

  v20 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v9 = CoreAnalytics::Client::get(v8);
  std::string::basic_string[abi:ne180100]<0>(__p, "query-state");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v17, &v25);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v9, (uint64_t)__p, &v17, &v20);
  v10 = v17;
  v17 = 0;

  if (v19 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v20) == MEMORY[0x1E0C812F8])
  {
    v26 = &v20;
    v27 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v26))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "query-state failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v26 = &v20;
  v27 = "query-state";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v26))
  {
    v15[0] = &v20;
    v15[1] = "query-state";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v15, &v16);
    v26 = 0;
    v27 = 0;
    v28 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v28) < 0)
      operator delete(v26);
    v11 = v16;
    v16 = 0;

  }
  else
  {
    applesauce::xpc::object::to_string((applesauce::xpc::object *)&v20);
  }
  v12 = v20;
  v20 = 0;

  v13 = v25;
  v25 = 0;

}

void sub_1A4CFF1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20)
{
  void *v20;
  uint64_t v21;
  void *v23;

  __cxa_free_exception(v20);

  v23 = *(void **)(v21 - 72);
  *(_QWORD *)(v21 - 72) = 0;

  _Unwind_Resume(a1);
}

void analytics_tool_query_clear(uint64_t a1)
{
  CoreAnalytics::Client *v2;
  id v3;
  void *v4;
  uint64_t *v5;
  id v6;
  xpc_object_t v7;
  id v8;
  void *exception;
  id v10;
  void *__p[2];
  char v12;
  xpc_object_t v13;
  id *v14;
  const char *v15;
  void *v16;
  id v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v18[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v18);
  if (*(_BYTE *)(a1 + 24))
  {
    applesauce::xpc::object::object(&v16, a1);
    v14 = v18;
    v15 = "state-name";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v14, &v16, &v17);
    v3 = v17;
    v17 = 0;

    v4 = v16;
    v16 = 0;

  }
  v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "query-clear");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v10, v18);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v10, &v13);
  v6 = v10;
  v10 = 0;

  if (v12 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v13) == MEMORY[0x1E0C812F8])
  {
    v14 = &v13;
    v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "query-clear failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v7 = v13;
  v13 = 0;

  v8 = v18[0];
  v18[0] = 0;

}

void sub_1A4CFF420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);

  v20 = *(void **)(v18 - 48);
  *(_QWORD *)(v18 - 48) = 0;

  _Unwind_Resume(a1);
}

void analytics_tool_query_list(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  id v2;
  xpc_object_t v3;
  xpc_object_t v4;
  id v5;
  void *exception;
  _QWORD v7[2];
  xpc_object_t v8;
  id v9;
  void *__p[2];
  char v11;
  xpc_object_t v12;
  id v13;
  xpc_object_t *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v13 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v13);
  v12 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "query-list");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v9, &v13);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v9, &v12);
  v2 = v9;
  v9 = 0;

  if (v11 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v12) == MEMORY[0x1E0C812F8])
  {
    v14 = &v12;
    v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "query-list failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v14 = &v12;
  v15 = "query-list";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
  {
    v7[0] = &v12;
    v7[1] = "query-list";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v7, &v8);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0)
      operator delete(v14);
    v3 = v8;
    v8 = 0;

  }
  else
  {
    applesauce::xpc::object::to_string((applesauce::xpc::object *)&v12);
  }
  v4 = v12;
  v12 = 0;

  v5 = v13;
  v13 = 0;

}

void sub_1A4CFF674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,void *a21)
{
  void *v21;

  __cxa_free_exception(v21);

  _Unwind_Resume(a1);
}

void analytics_tool_get_cache_list(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void *exception;
  _QWORD v6[2];
  xpc_object_t v7;
  xpc_object_t v8;
  void *__p[2];
  char v10;
  xpc_object_t v11;
  xpc_object_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v11 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "list-transforms-in-cache");
  applesauce::xpc::dict::create(&v8);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v8, &v11);
  v2 = v8;
  v8 = 0;

  if (v10 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v11) == MEMORY[0x1E0C812F8])
  {
    v12 = &v11;
    v13 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v12))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "list-transforms-in-cache failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
  }
  v6[0] = &v11;
  v6[1] = "transforms-in-cache";
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v6, &v7);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  applesauce::xpc::dyn_cast_or_default();
  if (SHIBYTE(v14) < 0)
    operator delete(v12);
  v3 = v7;
  v7 = 0;

  v4 = v11;
  v11 = 0;

}

void sub_1A4CFF8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19)
{
  void *v19;

  __cxa_free_exception(v19);

  _Unwind_Resume(a1);
}

void analytics_tool_save(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void *__p[2];
  char v6;
  xpc_object_t v7[2];

  v7[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v7[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "save-log");
  applesauce::xpc::dict::create(&v4);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v4, v7);
  v2 = v4;
  v4 = 0;

  if (v6 < 0)
    operator delete(__p[0]);
  v3 = v7[0];
  v7[0] = 0;

}

void sub_1A4CFFA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t analytics_tool_rollover(uint64_t a1, BOOL a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  xpc_object_t v9;
  id v11;
  id v12;
  xpc_object_t *v13;
  const char *v14;
  void *v15;
  id v16;
  xpc_object_t v17[2];

  v17[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v17[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v17);
  if (*(_BYTE *)(a1 + 24))
  {
    applesauce::xpc::object::object(&v15, a1);
    v13 = v17;
    v14 = "aggPeriod";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v13, &v15, &v16);
    v4 = v16;
    v16 = 0;

    v5 = v15;
    v15 = 0;

  }
  applesauce::xpc::object::object((applesauce::xpc::object *)&v11, a2);
  v13 = v17;
  v14 = "preserveState";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v13, &v11, &v12);
  v6 = v12;
  v12 = 0;

  v7 = v11;
  v11 = 0;

  v8 = analytics_rollover_with_options(v17[0]);
  v9 = v17[0];
  v17[0] = 0;

  return v8;
}

void sub_1A4CFFB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void analytics_tool_commit(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void *__p[2];
  char v6;
  xpc_object_t v7[2];

  v7[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v7[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "commit");
  applesauce::xpc::dict::create(&v4);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v4, v7);
  v2 = v4;
  v4 = 0;

  if (v6 < 0)
    operator delete(__p[0]);
  v3 = v7[0];
  v7[0] = 0;

}

void sub_1A4CFFC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void analytics_tool_transform_info(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  void *v5;
  CoreAnalytics::Client *v6;
  uint64_t *v7;
  id v8;
  xpc_object_t v9;
  xpc_object_t v10;
  id v11;
  void *exception;
  _QWORD v13[2];
  xpc_object_t v14;
  id v15;
  void *__p[2];
  char v17;
  xpc_object_t v18;
  void *v19;
  id v20;
  id v21;
  id *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v21 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v21);
  applesauce::xpc::object::object(&v19, a1);
  v22 = &v21;
  v23 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v19, &v20);
  v4 = v20;
  v20 = 0;

  v5 = v19;
  v19 = 0;

  v18 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v7 = CoreAnalytics::Client::get(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, "transform-info");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, &v21);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v7, (uint64_t)__p, &v15, &v18);
  v8 = v15;
  v15 = 0;

  if (v17 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v18) == MEMORY[0x1E0C812F8])
  {
    v22 = &v18;
    v23 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A85A6FC0](exception, "transform-info failed");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v22 = &v18;
    v23 = "transform-info";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      v13[0] = &v18;
      v13[1] = "transform-info";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, &v14);
      v22 = 0;
      v23 = 0;
      v24 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v24) < 0)
        operator delete(v22);
      v9 = v14;
      v14 = 0;

    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v18);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "unknown");
  }
  v10 = v18;
  v18 = 0;

  v11 = v21;
  v21 = 0;

}

void sub_1A4CFFEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20)
{
  uint64_t v20;
  void *v22;

  if (*(char *)(v20 - 41) < 0)
    operator delete(*(void **)(v20 - 64));

  v22 = *(void **)(v20 - 72);
  *(_QWORD *)(v20 - 72) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_transform_evict(uint64_t a1)
{
  id v2;
  void *v3;
  CoreAnalytics::Client *v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  void *exception;
  xpc_object_t v13;
  id v14;
  void *__p[2];
  char v16;
  xpc_object_t v17;
  id *v18;
  const char *v19;
  void *v20;
  id v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v22[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  v18 = v22;
  v19 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  v2 = v21;
  v21 = 0;

  v3 = v20;
  v20 = 0;

  v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "transform-evict");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  v6 = v14;
  v14 = 0;

  if (v16 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v17) != MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v18 = &v17;
  v19 = "error";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A85A6FC0](exception, "transform-evict failed");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v18 = &v17;
  v19 = "transform-evict";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    v18 = &v17;
    v19 = "transform-evict";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
    v7 = applesauce::xpc::dyn_cast_or_default();
    v8 = v13;
    v13 = 0;

  }
  else
  {
LABEL_7:
    v7 = 0;
  }
  v9 = v17;
  v17 = 0;

  v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A4D001B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  uint64_t v17;
  void *v19;

  v19 = *(void **)(v17 - 32);
  *(_QWORD *)(v17 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_transform_persist(uint64_t a1)
{
  id v2;
  void *v3;
  CoreAnalytics::Client *v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  void *exception;
  xpc_object_t v13;
  id v14;
  void *__p[2];
  char v16;
  xpc_object_t v17;
  id *v18;
  const char *v19;
  void *v20;
  id v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v22[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  v18 = v22;
  v19 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  v2 = v21;
  v21 = 0;

  v3 = v20;
  v20 = 0;

  v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "transform-persist");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  v6 = v14;
  v14 = 0;

  if (v16 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v17) != MEMORY[0x1E0C812F8])
    goto LABEL_7;
  v18 = &v17;
  v19 = "error";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A85A6FC0](exception, "transform-persist failed");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v18 = &v17;
  v19 = "transform-persist";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    v18 = &v17;
    v19 = "transform-persist";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
    v7 = applesauce::xpc::dyn_cast_or_default();
    v8 = v13;
    v13 = 0;

  }
  else
  {
LABEL_7:
    v7 = 0;
  }
  v9 = v17;
  v17 = 0;

  v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A4D00468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  uint64_t v17;
  void *v19;

  v19 = *(void **)(v17 - 32);
  *(_QWORD *)(v17 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_is_event_used_check_db(uint64_t a1)
{
  id v2;
  void *v3;
  CoreAnalytics::Client *v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  void *exception;
  xpc_object_t v13;
  id v14;
  void *__p[2];
  char v16;
  xpc_object_t v17;
  id *v18;
  const char *v19;
  void *v20;
  id v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  CASPIEnter();
  v22[0] = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  v18 = v22;
  v19 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  v2 = v21;
  v21 = 0;

  v3 = v20;
  v20 = 0;

  v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "event-used");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  v6 = v14;
  v14 = 0;

  if (v16 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v17) != MEMORY[0x1E0C812F8])
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A85A6FC0](exception, "event-used failed");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v18 = &v17;
  v19 = "event-used";
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
  v7 = applesauce::xpc::dyn_cast_or_default();
  v8 = v13;
  v13 = 0;

  v9 = v17;
  v17 = 0;

  v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A4D006E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  void *v17;
  uint64_t v18;
  void *v20;

  __cxa_free_exception(v17);

  v20 = *(void **)(v18 - 32);
  *(_QWORD *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

BOOL analytics_tool_has_config(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;

  CASPIEnter();
  v1 = CoreAnalytics::Client::get(v0);
  return CoreAnalytics::Client::hasConfig((CoreAnalytics::Client *)v1);
}

void report_locale_prefs_to_analyticsd()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  __report_locale_prefs_to_analyticsd_block_invoke();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v2 = *MEMORY[0x1E0C99720];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __report_locale_prefs_to_analyticsd_block_invoke_59;
  v4[3] = &unk_1E4DEBCC0;
  v5 = &__block_literal_global;
  v3 = (id)objc_msgSend(v0, "addObserverForName:object:queue:usingBlock:", v2, 0, v1, v4);

}

void sub_1A4D00888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void __report_locale_prefs_to_analyticsd_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void **v20;
  CoreAnalytics::Client *v21;
  uint64_t *v22;
  id v23;
  NSObject *v24;
  xpc_object_t v25;
  id v26;
  void **v27;
  xpc_object_t v28;
  xpc_object_t v29;
  id v30;
  void *v31[2];
  char v32;
  xpc_object_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *__p[2];
  char v39;
  void *v40;
  id v41;
  id v42;
  uint8_t v43[4];
  void **v44;
  __int128 buf;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v42);
  v0 = (void *)MEMORY[0x1A85A7380]();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizationsFromArray:forPreferences:", v3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
    applesauce::xpc::object::object(&v40, (uint64_t)__p);
    *(_QWORD *)&buf = &v42;
    *((_QWORD *)&buf + 1) = "user-interface-language";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&buf, &v40, &v41);
    v6 = v41;
    v41 = 0;

    v7 = v40;
    v40 = 0;

    if (v39 < 0)
      operator delete(__p[0]);

  }
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
    applesauce::xpc::object::object(&v36, (uint64_t)__p);
    *(_QWORD *)&buf = &v42;
    *((_QWORD *)&buf + 1) = "preferred-user-interface-language";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&buf, &v36, &v37);
    v9 = v37;
    v37 = 0;

    v10 = v36;
    v36 = 0;

    if (v39 < 0)
      operator delete(__p[0]);

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = *MEMORY[0x1E0C997B0];
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      objc_msgSend(v12, "objectForKey:", v13);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
      applesauce::xpc::object::object(&v34, (uint64_t)__p);
      *(_QWORD *)&buf = &v42;
      *((_QWORD *)&buf + 1) = "user-set-region-format";
      applesauce::xpc::dict::object_proxy::operator=((uint64_t)&buf, &v34, &v35);
      v17 = v35;
      v35 = 0;

      v18 = v34;
      v34 = 0;

      if (v39 < 0)
        operator delete(__p[0]);

    }
  }

  objc_autoreleasePoolPop(v0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    applesauce::xpc::dict::to_debug_string((applesauce::xpc::dict *)&v42, __p);
    v20 = v39 >= 0 ? __p : (void **)__p[0];
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_1A4CF5000, v19, OS_LOG_TYPE_INFO, "store-locale-info is sending %s", (uint8_t *)&buf, 0xCu);
    if (v39 < 0)
      operator delete(__p[0]);
  }

  v33 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v22 = CoreAnalytics::Client::get(v21);
  std::string::basic_string[abi:ne180100]<0>(v31, "store-locale-info");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v30, &v42);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v22, (uint64_t)v31, &v30, &v33);
  v23 = v30;
  v30 = 0;

  if (v32 < 0)
    operator delete(v31[0]);
  if (MEMORY[0x1A85A7704](v33) == MEMORY[0x1E0C812F8])
  {
    __p[0] = &v33;
    __p[1] = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)__p))
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)&buf = &v33;
        *((_QWORD *)&buf + 1) = "error";
        applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&buf, &v29);
        applesauce::xpc::dyn_cast<std::string>();
        if (v39 >= 0)
          v27 = __p;
        else
          v27 = (void **)__p[0];
        *(_DWORD *)v43 = 136315138;
        v44 = v27;
        _os_log_error_impl(&dword_1A4CF5000, v24, OS_LOG_TYPE_ERROR, "store-locale-info failed error: %s", v43, 0xCu);
        if (v39 < 0)
          operator delete(__p[0]);
        v28 = v29;
        v29 = 0;

      }
    }
  }
  v25 = v33;
  v33 = 0;

  v26 = v42;
  v42 = 0;

}

void sub_1A4D00D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  void *v27;

  _Unwind_Resume(a1);
}

void applesauce::xpc::dict::to_debug_string(applesauce::xpc::dict *this@<X0>, _QWORD *a2@<X8>)
{
  char *v3;

  v3 = (char *)MEMORY[0x1A85A7680](*(_QWORD *)this);
  memset(a2, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(a2, v3);
  free(v3);
}

uint64_t __report_locale_prefs_to_analyticsd_block_invoke_59(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4CF5000, v2, OS_LOG_TYPE_DEFAULT, "Received locale changed notification", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void *ad_addScalarForKey(uint64_t a1, uint64_t a2)
{
  void *result;

  CASPIEnter();
  if (ad_addScalarForKey::onceToken != -1)
    dispatch_once(&ad_addScalarForKey::onceToken, &__block_literal_global_61);
  result = ad_addScalarForKey::__ADClientAddValueForScalarKey;
  if (ad_addScalarForKey::__ADClientAddValueForScalarKey)
    return (void *)((uint64_t (*)(uint64_t, uint64_t))ad_addScalarForKey::__ADClientAddValueForScalarKey)(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1), a2);
  return result;
}

void *__ad_addScalarForKey_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
  if (result)
  {
    result = dlsym(result, "ADClientAddValueForScalarKey");
    ad_addScalarForKey::__ADClientAddValueForScalarKey = result;
  }
  return result;
}

void analytics_tool_app_usage_sync(void)
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void *exception;
  _QWORD v6[2];
  xpc_object_t v7;
  xpc_object_t v8;
  void *__p[2];
  char v10;
  xpc_object_t v11;
  xpc_object_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v11 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "app-usage-sync");
  applesauce::xpc::dict::create(&v8);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v8, &v11);
  v2 = v8;
  v8 = 0;

  if (v10 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v11) != MEMORY[0x1E0C812F8])
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A85A6FC0](exception, "Failed to run 'app-usage-sync'");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v12 = &v11;
  v13 = "appusage";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v12))
  {
    v6[0] = &v11;
    v6[1] = "appusage";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v6, &v7);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v14) < 0)
      operator delete(v12);
    v3 = v7;
    v7 = 0;

  }
  else
  {
    applesauce::xpc::object::to_string((applesauce::xpc::object *)&v11);
  }
  v4 = v11;
  v11 = 0;

}

void sub_1A4D011E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19)
{
  uint64_t v19;

  if (*(char *)(v19 - 25) < 0)
    operator delete(*(void **)(v19 - 48));

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4DEAEC0, MEMORY[0x1E0DE42D0]);
}

void sub_1A4D0138C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

uint64_t analytics_is_event_used(const char *a1)
{
  void *v2;
  CoreAnalytics::Client *v3;
  uint64_t *v4;
  size_t v5;
  uint64_t isEventUsed;

  v2 = (void *)MEMORY[0x1A85A7380]();
  CASPIEnter();
  v4 = CoreAnalytics::Client::get(v3);
  v5 = strlen(a1);
  isEventUsed = CoreAnalytics::Client::isEventUsed((uint64_t)v4, a1, v5);
  objc_autoreleasePoolPop(v2);
  return isEventUsed;
}

uint64_t AnalyticsSendEventInternal(void *a1, void *a2, unsigned int a3, int a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  CoreAnalytics::Client *v12;
  uint64_t *v13;
  NSObject **v14;
  id v15;
  char *v16;
  CoreAnalytics::Client *v17;
  uint64_t *v18;
  std::string *v19;
  size_t size;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  uint64_t v30;
  std::string __p;
  std::string v33;
  id v34;
  id v35;
  __int128 buf;
  id *v37;
  __int128 *p_buf;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v35 = v9;
  v34 = a2;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A85A7380]();
  CASPIEnter();
  v13 = CoreAnalytics::Client::get(v12);
  if (!v9)
  {
      AnalyticsSendEventInternal();
    goto LABEL_17;
  }
  v14 = (NSObject **)v13;
  v15 = objc_retainAutorelease(v9);
  v16 = (char *)objc_msgSend(v15, "UTF8String");
  if (!v16)
  {
      AnalyticsSendEventInternal();
LABEL_17:
    v24 = 0;
    goto LABEL_38;
  }
  memset(&v33, 170, sizeof(v33));
  v17 = (CoreAnalytics::Client *)std::string::basic_string[abi:ne180100]<0>(&v33, v16);
  v18 = CoreAnalytics::Client::get(v17);
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v33;
  else
    v19 = (std::string *)v33.__r_.__value_.__r.__words[0];
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v33.__r_.__value_.__r.__words[2]);
  else
    size = v33.__r_.__value_.__l.__size_;
  if ((CoreAnalytics::Client::isEventUsed((uint64_t)v18, v19, size) & 1) == 0)
  {
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1A4CF5000, v25, OS_LOG_TYPE_INFO, "Dropping \"%@\" as it isn't used in any transform (not in the config or budgeted?)", (uint8_t *)&buf, 0xCu);
    }
    v24 = 0;
    goto LABEL_36;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kLogPayload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = objc_msgSend(v22, "BOOLValue");
    else
      v23 = 0;

  }
  else
  {
    v23 = 0;
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
  else
    __p = v33;
  *(_QWORD *)&buf = &off_1E4DEB4D0;
  *((_QWORD *)&buf + 1) = &v35;
  v37 = &v34;
  p_buf = &buf;
  v26 = 0x10000;
  if (!v23)
    v26 = 0;
  v24 = CoreAnalytics::Client::sendEventAlways(v14, (uint64_t)&__p, (uint64_t)&buf, v26 | (a4 << 8) | a3);
  v29 = p_buf;
  if (p_buf == &buf)
  {
    v30 = 4;
    v29 = &buf;
  }
  else
  {
    if (!p_buf)
      goto LABEL_34;
    v30 = 5;
  }
  (*(void (**)(__int128 *, uint64_t, uint64_t))(*(_QWORD *)v29 + 8 * v30))(v29, v27, v28);
LABEL_34:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_36:
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
LABEL_38:
  objc_autoreleasePoolPop(v11);

  return v24;
}

void sub_1A4D0172C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,void *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  void *v26;

  if (a20 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c31_ZTSKZ18AnalyticsSendEventE3__0(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c31_ZTSKZ18AnalyticsSendEventE3__0(uint64_t a1)
{

}

void AnalyticsSendEventWithOptions(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __AnalyticsSendEventWithOptions_block_invoke;
  v7[3] = &__block_descriptor_40_ea8_32c42_ZTSKZ29AnalyticsSendEventWithOptionsE3__0_e19___NSDictionary_8__0l;
  v8 = v5;
  v6 = v5;
  AnalyticsSendEventInternal(a1, v7, 0, 0, a3);

}

void sub_1A4D018C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c42_ZTSKZ29AnalyticsSendEventWithOptionsE3__0(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c42_ZTSKZ29AnalyticsSendEventWithOptionsE3__0(uint64_t a1)
{

}

uint64_t AnalyticsSendEventLazyWithOptions(void *a1, void *a2, void *a3)
{
  return AnalyticsSendEventInternal(a1, a2, 0, 0, a3);
}

uint64_t AnalyticsSendEventLazyHighPriority(void *a1, void *a2)
{
  return AnalyticsSendEventInternal(a1, a2, 1u, 0, 0);
}

uint64_t AnalyticsSendExplodingEventLazy(void *a1, void *a2)
{
  return AnalyticsSendEventInternal(a1, a2, 0, 1, 0);
}

uint64_t analytics_send_event_internal(char *a1, void *a2, unsigned int a3, int a4, void *a5)
{
  id v9;
  void *v10;
  CoreAnalytics::Client *v11;
  uint64_t *v12;
  size_t v13;
  id v14;
  xpc_object_t v15;
  id v16;
  void *v17;
  CoreAnalytics::Client *v18;
  xpc_object_t v19;
  id v20;
  CoreAnalytics::Client *v21;
  void **v22;
  void **v23;
  int v24;
  xpc_object_t v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t *v29;
  __int128 *v30;
  uint64_t v31;
  id v32;
  void *v34[2];
  char v35;
  xpc_object_t v36;
  void *v37[3];
  id v38;
  void *__p;
  char v40;
  id v41;
  char *__s;
  __int128 buf;
  id *v44;
  __int128 *p_buf;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  __s = a1;
  v41 = a2;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A85A7380]();
  CASPIEnter();
  if (!a1)
  {
      AnalyticsSendEventInternal();
    goto LABEL_23;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)&buf, &__s);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&buf, -1, 0x20u, 0, 0, &__p);
  if (v40 < 0)
    operator delete(__p);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&buf);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&buf + 1, buf);
  v12 = CoreAnalytics::Client::get(v11);
  v13 = strlen(__s);
  if ((CoreAnalytics::Client::isEventUsed((uint64_t)v12, __s, v13) & 1) == 0)
  {
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = __s;
      _os_log_impl(&dword_1A4CF5000, v27, OS_LOG_TYPE_INFO, "Dropping \"%s\" as it isn't used in any transform (not in the config or budgeted?)", (uint8_t *)&buf, 0xCu);
    }
LABEL_23:
    v28 = 0;
    goto LABEL_35;
  }
  v38 = (id)0xAAAAAAAAAAAAAAAALL;
  v14 = v9;
  v15 = v14;
  if (!v14)
    v15 = xpc_null_create();

  v16 = v15;
  v17 = v16;
  v38 = v16;
  v18 = (CoreAnalytics::Client *)MEMORY[0x1E0C812F8];
  if (!v16 || (CoreAnalytics::Client *)MEMORY[0x1A85A7704](v16) != v18)
  {
    v19 = xpc_null_create();
    v20 = v38;
    v38 = v19;

  }
  memset(v37, 170, sizeof(v37));
  std::string::basic_string[abi:ne180100]<0>(v37, "kLogPayload");
  v21 = (CoreAnalytics::Client *)MEMORY[0x1A85A7704](v38);
  if (v21 != v18)
    goto LABEL_24;
  v22 = v37;
  if (SHIBYTE(v37[2]) < 0)
    v22 = (void **)v37[0];
  *(_QWORD *)&buf = &v38;
  *((_QWORD *)&buf + 1) = v22;
  v21 = (CoreAnalytics::Client *)applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&buf);
  if ((_DWORD)v21)
  {
    v23 = v37;
    if (SHIBYTE(v37[2]) < 0)
      v23 = (void **)v37[0];
    *(_QWORD *)&buf = &v38;
    *((_QWORD *)&buf + 1) = v23;
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&buf, &v36);
    v24 = applesauce::xpc::dyn_cast_or_default();
    v25 = v36;
    v36 = 0;

    if (v24)
      v26 = 0x10000;
    else
      v26 = 0;
  }
  else
  {
LABEL_24:
    v26 = 0;
  }
  v29 = CoreAnalytics::Client::get(v21);
  std::string::basic_string[abi:ne180100]<0>(v34, __s);
  *(_QWORD *)&buf = &off_1E4DEB528;
  *((_QWORD *)&buf + 1) = &__s;
  v44 = &v41;
  p_buf = &buf;
  v28 = CoreAnalytics::Client::sendEventAlways((NSObject **)v29, (uint64_t)v34, (uint64_t)&buf, v26 | (a4 << 8) | a3);
  v30 = p_buf;
  if (p_buf == &buf)
  {
    v31 = 4;
    v30 = &buf;
    goto LABEL_29;
  }
  if (p_buf)
  {
    v31 = 5;
LABEL_29:
    (*(void (**)(void))(*(_QWORD *)v30 + 8 * v31))();
  }
  if (v35 < 0)
    operator delete(v34[0]);
  if (SHIBYTE(v37[2]) < 0)
    operator delete(v37[0]);
  v32 = v38;
  v38 = 0;

LABEL_35:
  objc_autoreleasePoolPop(v10);

  return v28;
}

void sub_1A4D01CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  void *v32;

  if (a22 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void analytics_send_event_with_options(char *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __analytics_send_event_with_options_block_invoke;
  v7[3] = &unk_1E4DEBCF8;
  v8 = v5;
  v6 = v5;
  analytics_send_event_internal(a1, v7, 0, 0, a3);

}

void sub_1A4D01EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

id __analytics_send_event_with_options_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t analytics_send_event_lazy_with_options(char *a1, void *a2, void *a3)
{
  return analytics_send_event_internal(a1, a2, 0, 0, a3);
}

uint64_t analytics_send_event_lazy_high_priority(char *a1, void *a2)
{
  return analytics_send_event_internal(a1, a2, 1u, 0, 0);
}

uint64_t analytics_send_exploding_event_lazy(char *a1, void *a2)
{
  return analytics_send_event_internal(a1, a2, 0, 1, 0);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::~__func()
{
  JUMPOUT(0x1A85A70E0);
}

__n128 std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E4DEB4D0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E4DEB4D0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::operator()(uint64_t a1@<X0>, double *a2@<X8>)
{
  NSObject *v3;
  NSObject *v4;

  (*(void (**)(void))(**(_QWORD **)(a1 + 16) + 16))();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    makeJsonFromNSObject(v3, a2);
  else
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)a2, 0, 0, 0, 1);

}

void sub_1A4D02080(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::target_type()
{
}

void nlohmann::detail::exception::name(int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *p_p;
  std::string::size_type size;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  std::string __p;
  std::string v12;
  std::string v13;
  std::string v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::operator+<char>();
  v4 = std::string::append(&v12, ".");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v14, "] ");
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_1A4D02424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (*(char *)(v26 - 41) < 0)
    operator delete(*(void **)(v26 - 64));
  if (a14 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

nlohmann::detail::exception *nlohmann::detail::exception::exception(nlohmann::detail::exception *this, int a2, const char *a3)
{
  *(_QWORD *)this = &off_1E4DEB9A8;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x1A85A6FC0]((char *)this + 16, a3);
  return this;
}

void sub_1A4D024CC(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

const char *nlohmann::detail::exception::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this + 1);
}

void nlohmann::detail::exception::~exception(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

void nlohmann::detail::type_error::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(&__p, "type_error");
  nlohmann::detail::exception::name(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(_QWORD *)a3 = &off_1E4DEB8B0;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_1A4D02670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::type_error::~type_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

uint64_t std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v7;
  uint64_t *v8[2];

  v8[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      v7 = 0xAAAAAAAAAAAAAAAALL;
      v8[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(v5, (uint64_t)&v7);
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a3 + 8), *(const void ***)(*v8[0] + 8), *(_QWORD *)(*v8[0] + 8), *v8[0] + 16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v7);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v8, v7);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_1A4D027BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  uint64_t **v10;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&a10);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v10, a10);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(uint64_t *a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = operator new(0x18uLL);
  v5 = *a1;
  v6 = *a2;
  v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v4, v5, v6, v7);
  return v4;
}

void sub_1A4D02838(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[](uint64_t a1, uint64_t a2)
{
  nlohmann::detail::exception *exception;
  char *v5;
  std::string *v6;
  __int128 v7;
  std::string v8;
  __int128 v9;
  std::string::size_type v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)a1 != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v8, v5);
    v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v10 = v6->__r_.__value_.__r.__words[2];
    v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(305, (uint64_t)&v9, exception);
  }
  return **(_QWORD **)(a1 + 8) + 16 * a2;
}

void sub_1A4D0293C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

const char *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 9)
    return "number";
  else
    return off_1E4DEBD18[v1];
}

uint64_t nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  if (!*(_BYTE *)(a1 + 24))
    return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(a2, v3);
  *(_BYTE *)a2 = *(_BYTE *)v3;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(v3 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
  *(_BYTE *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0;
  return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2)
{
  std::string *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  switch(*(_BYTE *)a1)
  {
    case 1:
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(const void ****)(a2 + 8));
      goto LABEL_8;
    case 2:
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(uint64_t **)(a2 + 8));
      goto LABEL_8;
    case 3:
      v4 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(*(_QWORD *)(a2 + 8));
      goto LABEL_8;
    case 4:
      v4 = (std::string *)*(unsigned __int8 *)(a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      v4 = *(std::string **)(a2 + 8);
      goto LABEL_8;
    case 8:
      v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(*(_QWORD *)(a2 + 8));
LABEL_8:
      *(_QWORD *)(a1 + 8) = v4;
      break;
    default:
      break;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(const void ***a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)operator new(0x18uLL);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](v2, a1);
  return v2;
}

void sub_1A4D02B44(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_1A4D02B94(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t v8;
  const void **v9;
  uint64_t *v10[4];

  v10[3] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v8 = 0xAAAAAAAAAAAAAAAALL;
  v9 = (const void **)0xAAAAAAAAAAAAAAAALL;
  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(a1, a2, &v9, &v8, a3);
  result = *v6;
  if (!*v6)
  {
    memset(v10, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>((uint64_t)a1, a4, v10);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, (uint64_t)v9, v6, v10[0]);
    return v10[0];
  }
  return result;
}

const void **std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(_QWORD *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  const void **v9;
  const void **v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;

  v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2
    || std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }
    v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (const void **)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (const void **)v16[2];
        v17 = *v12 == v16;
        v16 = (uint64_t *)v12;
      }
      while (v17);
    }
    if (std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), v12 + 4, a5))
    {
      goto LABEL_16;
    }
    return (const void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  if (std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (const void **)a2[1];
      do
      {
        v15 = v14;
        v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = (const void **)a2;
      do
      {
        v15 = (const void **)v18[2];
        v17 = *v15 == v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), a5, v15 + 4))return (const void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

std::string *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  memset(a3, 170, 24);
  v6 = (char *)operator new(0x48uLL);
  *a3 = v6;
  a3[1] = v5;
  *((_BYTE *)a3 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *((_BYTE *)a3 + 16) = 1;
  return result;
}

void sub_1A4D02EF4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v2, v3);
  _Unwind_Resume(a1);
}

BOOL std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

std::string *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(&this[1], (char *)a2 + 24);
  return this;
}

void sub_1A4D02FD0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
    std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void,void>(*(_QWORD *)a1, (uint64_t)__p + 32);
  if (__p)
    operator delete(__p);
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void,void>(uint64_t a1, uint64_t a2)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2 + 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_1A4D03258(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1A4D03300(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  *(_QWORD *)(v2 + 8) = v3;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

char *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  unint64_t v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a4;
  v10[0] = a1;
  v10[1] = &v8;
  v10[2] = &v9;
  v11 = 0xAAAAAAAAAAAAAA00;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(v4, v6);
      v6 += 16;
      v4 = v9 + 16;
      v9 += 16;
    }
    while (v6 != a3);
  }
  LOBYTE(v11) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_1A4D03464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(*(_QWORD *)a1, **(_QWORD **)(a1 + 16), **(_QWORD **)(a1 + 16), **(_QWORD **)(a1 + 8), **(_QWORD **)(a1 + 8));
  return a1;
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  BOOL v9;

  if (a3 != a5)
  {
    v6 = a3 - 16;
    v7 = (unsigned __int8 *)(a3 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
      v8 = *v7;
      v7 -= 16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(v6 + 8), v8);
      v9 = v6 == a5;
      v6 = (uint64_t)v7;
    }
    while (!v9);
  }
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  unsigned int v8;
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (uint64_t)(v4 - 16);
      v7 = v4 - 16;
      do
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
        v8 = *v7;
        v7 -= 16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v6 + 8, v8);
        v9 = v6 == (_QWORD)v2;
        v6 = (uint64_t)v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;

  v3 = result;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != a2)
  {
    v5 = v4 - 16;
    v6 = (unsigned __int8 *)(v4 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
      v7 = *v6;
      v6 -= 16;
      result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v5 + 8, v7);
      v8 = v5 == a2;
      v5 = (uint64_t)v6;
    }
    while (!v8);
  }
  *(_QWORD *)(v3 + 8) = a2;
  return result;
}

std::string *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(uint64_t a1)
{
  std::string *v2;
  std::string *v3;

  v2 = (std::string *)operator new(0x18uLL);
  v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
  }
  return v3;
}

void sub_1A4D03658(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v2, *(const void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_1A4D036B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A4D03724(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v7;
  uint64_t *result;
  uint64_t v9;
  uint64_t *v10[4];

  v10[3] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v9 = 0xAAAAAAAAAAAAAAAALL;
  v7 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  result = *v7;
  if (!*v7)
  {
    memset(v10, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a3, a4, v10);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v9, v7, v10[0]);
    return v10[0];
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  _OWORD *v8;
  char v9;
  uint64_t v10;
  uint64_t result;

  v7 = a1 + 8;
  memset(a4, 170, 24);
  v8 = operator new(0x48uLL);
  *a4 = v8;
  a4[1] = v7;
  v8[2] = *(_OWORD *)a2;
  *((_QWORD *)v8 + 6) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v9 = *(_BYTE *)a3;
  *((_QWORD *)v8 + 8) = *(_QWORD *)(a3 + 8);
  *((_BYTE *)v8 + 56) = v9;
  v10 = (uint64_t)v8 + 56;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
  *((_BYTE *)a4 + 16) = 1;
  return result;
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;
  BOOL v7;

  v1 = result;
  v3 = *result;
  v2 = result[1];
  if (v2 != *result)
  {
    v4 = v2 - 16;
    v5 = (unsigned __int8 *)(v2 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      v6 = *v5;
      v5 -= 16;
      result = (_QWORD *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v4 + 8, v6);
      v7 = v4 == v3;
      v4 = (uint64_t)v5;
    }
    while (!v7);
  }
  v1[1] = v3;
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  _QWORD v16[3];
  unint64_t v17;
  uint64_t v18;

  v7 = a7;
  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v16[0] = a1;
  v16[1] = &v14;
  v16[2] = &v15;
  v17 = 0xAAAAAAAAAAAAAA00;
  if (a3 == a5)
  {
    v12 = a6;
  }
  else
  {
    v9 = a3 - 16;
    do
    {
      *(_BYTE *)(v7 - 16) = *(_BYTE *)v9;
      v10 = v7 - 16;
      *(_QWORD *)(v10 + 8) = *(_QWORD *)(v9 + 8);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
      *(_BYTE *)v9 = 0;
      *(_QWORD *)(v9 + 8) = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
      v7 = *((_QWORD *)&v15 + 1) - 16;
      *((_QWORD *)&v15 + 1) -= 16;
      v11 = v9 == a5;
      v9 -= 16;
    }
    while (!v11);
    v12 = v15;
  }
  LOBYTE(v17) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

uint64_t std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[8];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v2 = v1[1];
  v15 = v3;
  v16 = v2;
  v17 = v3;
  v18 = v2;
  v4 = *a1;
  v5 = (uint64_t *)a1[1];
  v7 = *v5;
  v6 = v5[1];
  v10 = v7;
  v11 = v6;
  v12 = v7;
  v13 = v6;
  return std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(v4, (uint64_t)v14, (uint64_t)v9);
}

uint64_t std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *i;
  uint64_t result;

  for (i = *(unsigned __int8 **)(a2 + 32); i != *(unsigned __int8 **)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)i);
    result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(i + 8, *i);
    i = (unsigned __int8 *)(*(_QWORD *)(a2 + 32) + 16);
  }
  return result;
}

uint64_t std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 16);
  if (v2 != a2)
  {
    v4 = result;
    do
    {
      *(_QWORD *)(v4 + 16) = v2 - 16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 16);
      result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v2 - 8, *(unsigned __int8 *)(v2 - 16));
      v2 = *(_QWORD *)(v4 + 16);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  unint64_t v7;

  v5 = a2;
  if (a2 != a3)
  {
    v7 = a4[1];
    do
    {
      if (v7 >= a4[2])
      {
        v7 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(a4, v5);
      }
      else
      {
        *(_BYTE *)v7 = *(_BYTE *)v5;
        *(_QWORD *)(v7 + 8) = *(_QWORD *)(v5 + 8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
        *(_BYTE *)v5 = 0;
        *(_QWORD *)(v5 + 8) = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        v7 += 16;
      }
      a4[1] = v7;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v15 = 0u;
  v16 = 0u;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  *(_QWORD *)&v15 = v10;
  *((_QWORD *)&v15 + 1) = v11;
  *((_QWORD *)&v16 + 1) = &v10[16 * v12];
  *(_BYTE *)v11 = *(_BYTE *)a2;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(_QWORD *)&v16 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
  v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v15);
  return v13;
}

void sub_1A4D03D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1A4D03DE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  *(_QWORD *)(v2 + 8) = v3;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  unint64_t v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a4;
  v10[0] = a1;
  v10[1] = &v8;
  v10[2] = &v9;
  v11 = 0xAAAAAAAAAAAAAA00;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(v4, v6);
      v6 += 32;
      v4 = v9 + 16;
      v9 += 16;
    }
    while (v6 != a3);
  }
  LOBYTE(v11) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_1A4D03EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1, uint64_t a2)
{
  _BYTE v4[8];
  uint64_t *v5[2];

  v5[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(a2, (uint64_t)v4);
  *(_BYTE *)a1 = v4[0];
  *(uint64_t **)(a1 + 8) = v5[0];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  v4[0] = 0;
  v5[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v5, v4[0]);
  return a1;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void std::__shared_ptr_emplace<nlohmann::detail::output_string_adapter<char,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBB50;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<nlohmann::detail::output_string_adapter<char,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBB50;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85A70E0);
}

void nlohmann::detail::output_string_adapter<char,std::string>::~output_string_adapter()
{
  JUMPOUT(0x1A85A70E0);
}

uint64_t std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(_QWORD *a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  char *v5;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)((char *)a1 + 17) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(unsigned char)::digits_to_99[(a2 - 100 * ((41 * a2) >> 12))];
      v5 = (char *)a1 + 17;
      v2 = (41 * a2) >> 12;
      goto LABEL_10;
    }
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  v5 = (char *)a1 + v3 + 16;
  if (a2 < 0xA)
  {
LABEL_10:
    *(v5 - 1) = v2 | 0x30;
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  }
  *((_WORD *)v5 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(unsigned char)::digits_to_99[a2];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

void std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::~__func()
{
  JUMPOUT(0x1A85A70E0);
}

__n128 std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E4DEB528;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E4DEB528;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::operator()(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  void *v5;
  uint64_t **v6;
  NSObject *v7;
  xpc_object_t v8;
  xpc_object_t v9[6];

  v9[5] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  v4 = (*(uint64_t (**)(void))(**(_QWORD **)(a1 + 16) + 16))();
  v5 = (void *)v4;
  if (!v4 || MEMORY[0x1A85A7704](v4) == MEMORY[0x1E0C81350])
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)a2, 0, 0, 0, 1);
  }
  else
  {
    v6 = (uint64_t **)(a1 + 8);
    if (MEMORY[0x1A85A7704](v5) == MEMORY[0x1E0C812F8])
    {
      v9[0] = v5;
      xpc_to_json(a2, v9);
      v8 = v9[0];
      v9[0] = 0;

    }
    else
    {
        std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::operator()(v6, v7);
      *(_BYTE *)a2 = 0;
      a2[1] = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a2);
    }
  }

}

void sub_1A4D042D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11, uint64_t a12, __int128 buf, int a14, __int16 a15, __int16 a16, uint64_t a17)
{
  void *v17;
  uint64_t v18;
  uint64_t **v19;
  void *v20;
  uint64_t **v21;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  char *v29;
  void **p_p;
  uint64_t v31;

  v21 = v19;
  v24 = (void *)buf;
  *(_QWORD *)&buf = 0;

  if (a2 == 1)
  {
    v25 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      v27 = **v21;
      v28 = v20;
      v29 = (char *)MEMORY[0x1A85A7680]();
      memset(&__p, 170, 24);
      std::string::basic_string[abi:ne180100]<0>(&__p, v29);
      free(v29);
      if (a12 >= 0)
        p_p = (void **)&__p;
      else
        p_p = __p;
      v31 = (*(uint64_t (**)(void *))(*(_QWORD *)v25 + 16))(v25);
      LODWORD(buf) = 136315650;
      *(_QWORD *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2080;
      *(_QWORD *)((char *)&buf + 14) = p_p;
      a16 = 2082;
      a17 = v31;
      _os_log_fault_impl(&dword_1A4CF5000, v26, OS_LOG_TYPE_FAULT, "Error: event \"%s\" %s dropped because the payload was unable to be converted to json: %{public}s", (uint8_t *)&buf, 0x20u);
      if (SHIBYTE(a12) < 0)
        operator delete(__p);

    }
    *(_BYTE *)v18 = 0;
    *(_QWORD *)(v18 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v18);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v18);
    __cxa_end_catch();
    JUMPOUT(0x1A4D0426CLL);
  }

  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::target_type()
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A4D04588(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::shared_ptr<`anonymous namespace'::EventObserverImpl>::reset[abi:ne180100](_QWORD *a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void sub_1A4D04770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4D04934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11)
    std::__shared_weak_count::__release_weak(a11);
  _Unwind_Resume(exception_object);
}

void sub_1A4D04BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<`anonymous namespace'::EventObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBAE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<`anonymous namespace'::EventObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBAE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85A70E0);
}

void `anonymous namespace'::EventObserverImpl::notifyMessageEmitted(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  void **v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  void *__p[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 8));
    v6 = (void *)MEMORY[0x1E0CB3940];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump(a2, 4, 0x20u, 0, 0, __p);
    if (v17 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    objc_msgSend(v6, "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 < 0)
      operator delete(__p[0]);
    v9 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN12_GLOBAL__N_117EventObserverImpl20notifyMessageEmittedEN8nlohmann10basic_jsonINSt3__13mapENS3_6vectorENS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEbxydS9_NS1_14adl_serializerENS5_IhNS9_IhEEEEEE_block_invoke;
    block[3] = &unk_1E4DEBD70;
    v13 = WeakRetained;
    v14 = v5;
    v15 = v8;
    v10 = v8;
    v11 = v5;
    dispatch_barrier_async(v9, block);

  }
}

void sub_1A4D04E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;

  if (a22 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t ___ZN12_GLOBAL__N_117EventObserverImpl20notifyMessageEmittedEN8nlohmann10basic_jsonINSt3__13mapENS3_6vectorENS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEbxydS9_NS1_14adl_serializerENS5_IhNS9_IhEEEEEE_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observer:didEmitMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id makeNSObjectFromJson(unsigned __int8 *a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v9;
  unint64_t v10;
  std::string *p_p;
  void *v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t *v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  int64x2_t v30;
  char *v31;
  unsigned __int8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t *v41;
  char *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  int64x2_t v46;
  char *v47;
  char **v48;
  unsigned __int8 *v49[5];
  unsigned __int8 *v50[5];
  std::string v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[32];
  unsigned __int8 *v56[9];
  char v57;
  void *v58;
  char v59;
  std::string __p;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  unsigned __int8 *v67;
  int64x2_t v68;
  char *v69;
  int64x2_t v70;
  _QWORD v71[2];
  uint64_t v72;
  int64x2_t v73;
  char *v74;
  char **v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  if (v2 == 6)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    __p.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,unsigned long long,0>(a1, (unint64_t *)&__p);
    objc_msgSend(v5, "numberWithUnsignedLongLong:", __p.__r_.__value_.__r.__words[0]);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v2 == 4)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    __p.__r_.__value_.__s.__data_[0] = -86;
    nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((char *)a1, &__p);
    objc_msgSend(v3, "numberWithBool:", __p.__r_.__value_.__s.__data_[0]);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v4;
    return v7;
  }
  if ((v2 - 5) <= 1)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    __p.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,long long,0>(a1, (uint64_t *)&__p);
    objc_msgSend(v6, "numberWithLongLong:", __p.__r_.__value_.__r.__words[0]);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = 0;
  switch(*a1)
  {
    case 0u:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1u:
      v70 = 0uLL;
      v71[0] = 0;
      v69 = 0;
      v68 = 0uLL;
      std::vector<NSString * {__strong}>::reserve((char **)&v70, *(_QWORD *)(*((_QWORD *)a1 + 1) + 16));
      v10 = *a1;
      if (*a1)
      {
        if ((_DWORD)v10 == 1)
        {
          v10 = *(_QWORD *)(*((_QWORD *)a1 + 1) + 16);
        }
        else if ((_DWORD)v10 == 2)
        {
          v10 = (uint64_t)(*(_QWORD *)(*((_QWORD *)a1 + 1) + 8) - **((_QWORD **)a1 + 1)) >> 4;
        }
        else
        {
          v10 = 1;
        }
      }
      std::vector<NSString * {__strong}>::reserve((char **)&v68, v10);
      v48 = &v69;
      v67 = a1;
      nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::begin((uint64_t *)&v67, (uint64_t)&__p);
      nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::end((uint64_t *)&v67, (uint64_t)v56);
      while (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==((unsigned __int8 **)&__p, v56))
      {
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)v55 = v13;
        *(_OWORD *)&v55[16] = v13;
        v54 = v13;
        v51 = __p;
        v52 = v61;
        v53 = v62;
        if (SHIBYTE(v64) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v54, (const std::string::value_type *)v63, *((std::string::size_type *)&v63 + 1));
        }
        else
        {
          v54 = v63;
          *(_QWORD *)v55 = v64;
        }
        if (SHIBYTE(v66) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v55[8], (const std::string::value_type *)v65, *((std::string::size_type *)&v65 + 1));
        }
        else
        {
          *(_OWORD *)&v55[8] = v65;
          *(_QWORD *)&v55[24] = v66;
        }
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key((unsigned __int8 **)&v51);
        if (*(char *)(v15 + 23) >= 0)
          v16 = v15;
        else
          v16 = *(_QWORD *)v15;
        objc_msgSend(v14, "stringWithUTF8String:", v16, v48);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = v70.i64[1];
        if (v70.i64[1] >= v71[0])
        {
          v21 = (v70.i64[1] - v70.i64[0]) >> 3;
          if ((unint64_t)(v21 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v22 = (v71[0] - v70.i64[0]) >> 2;
          if (v22 <= v21 + 1)
            v22 = v21 + 1;
          if (v71[0] - v70.i64[0] >= 0x7FFFFFFFFFFFFFF8uLL)
            v23 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v23 = v22;
          v75 = (char **)v71;
          if (v23)
            v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)v71, v23);
          else
            v24 = 0;
          v25 = (uint64_t *)&v24[8 * v21];
          v26 = &v24[8 * v23];
          v74 = v26;
          *v25 = v18;
          v20 = v25 + 1;
          v73.i64[1] = (uint64_t)(v25 + 1);
          v27 = (_QWORD *)v70.i64[1];
          v28 = (_QWORD *)v70.i64[0];
          if (v70.i64[1] == v70.i64[0])
          {
            v30 = vdupq_n_s64(v70.u64[1]);
          }
          else
          {
            do
            {
              v29 = *--v27;
              *v27 = 0;
              *--v25 = v29;
            }
            while (v27 != v28);
            v30 = v70;
            v20 = (_QWORD *)v73.i64[1];
            v26 = v74;
          }
          v70.i64[0] = (uint64_t)v25;
          v70.i64[1] = (uint64_t)v20;
          v73 = v30;
          v31 = (char *)v71[0];
          v71[0] = v26;
          v74 = v31;
          v72 = v30.i64[0];
          std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)&v72);
        }
        else
        {
          *(_QWORD *)v70.i64[1] = v17;
          v20 = (_QWORD *)(v19 + 8);
        }
        v70.i64[1] = (uint64_t)v20;
        v32 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((unsigned __int8 **)&v51);
        makeNSObjectFromJson(v32);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        v35 = v68.i64[1];
        if (v68.i64[1] >= (unint64_t)v69)
        {
          v37 = (v68.i64[1] - v68.i64[0]) >> 3;
          if ((unint64_t)(v37 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v38 = (uint64_t)&v69[-v68.i64[0]] >> 2;
          if (v38 <= v37 + 1)
            v38 = v37 + 1;
          if ((unint64_t)&v69[-v68.i64[0]] >= 0x7FFFFFFFFFFFFFF8)
            v39 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v39 = v38;
          v75 = v48;
          if (v39)
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)v48, v39);
          else
            v40 = 0;
          v41 = (uint64_t *)&v40[8 * v37];
          v42 = &v40[8 * v39];
          v74 = v42;
          *v41 = v34;
          v36 = v41 + 1;
          v73.i64[1] = (uint64_t)(v41 + 1);
          v43 = (_QWORD *)v68.i64[1];
          v44 = (_QWORD *)v68.i64[0];
          if (v68.i64[1] == v68.i64[0])
          {
            v46 = vdupq_n_s64(v68.u64[1]);
          }
          else
          {
            do
            {
              v45 = *--v43;
              *v43 = 0;
              *--v41 = v45;
            }
            while (v43 != v44);
            v46 = v68;
            v36 = (_QWORD *)v73.i64[1];
            v42 = v74;
          }
          v68.i64[0] = (uint64_t)v41;
          v68.i64[1] = (uint64_t)v36;
          v73 = v46;
          v47 = v69;
          v69 = v42;
          v74 = v47;
          v72 = v46.i64[0];
          std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)&v72);
        }
        else
        {
          *(_QWORD *)v68.i64[1] = v33;
          v36 = (_QWORD *)(v35 + 8);
        }
        v68.i64[1] = (uint64_t)v36;
        if ((v55[31] & 0x80000000) != 0)
          operator delete(*(void **)&v55[8]);
        if ((v55[7] & 0x80000000) != 0)
          operator delete((void *)v54);
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++((unsigned __int8 **)&__p);
        *(_QWORD *)&v62 = v62 + 1;
      }
      if (v59 < 0)
        operator delete(v58);
      if (v57 < 0)
        operator delete(v56[7]);
      if (SHIBYTE(v66) < 0)
        operator delete((void *)v65);
      if (SHIBYTE(v64) < 0)
        operator delete((void *)v63);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v68;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v70;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      break;
    case 2u:
      memset(&__p, 0, sizeof(__p));
      std::vector<NSString * {__strong}>::reserve(&__p.__r_.__value_.__l.__data_, (uint64_t)(*(_QWORD *)(*((_QWORD *)a1 + 1) + 8) - **((_QWORD **)a1 + 1)) >> 4);
      v50[0] = a1;
      memset(&v50[1], 0, 24);
      v50[4] = (unsigned __int8 *)0x8000000000000000;
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_begin(v50);
      v49[0] = a1;
      memset(&v49[1], 0, 24);
      v49[4] = (unsigned __int8 *)0x8000000000000000;
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_end(v49);
      v56[0] = (unsigned __int8 *)&__p;
      while (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==(v50, v49))
      {
        v9 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*(v50);
        makeNSObjectFromJson(v9);
        v51.__r_.__value_.__r.__words[0] = objc_claimAutoreleasedReturnValue();
        std::back_insert_iterator<std::vector<NSObject * {__strong}>>::operator=[abi:ne180100]((char ***)v56, (uint64_t *)&v51);

        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++(v50);
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = (unsigned __int8 *)&__p;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)v56);
      break;
    case 3u:
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::string,std::string,0>((uint64_t)a1, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      break;
    case 7u:
      v12 = (void *)MEMORY[0x1E0CB37E8];
      __p.__r_.__value_.__r.__words[0] = -1;
      nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,double,0>(a1, (double *)&__p);
      objc_msgSend(v12, "numberWithDouble:", *(double *)&__p.__r_.__value_.__l.__data_);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    default:
      return v7;
  }
  return v7;
}

void sub_1A4D05538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a55 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<NSString * {__strong}>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *(_QWORD *)v8 = 0;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

uint64_t nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::begin@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v4;
  v6[1] = v4;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::iter_impl(v6, v3);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_begin((unsigned __int8 **)v6);
  return nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::iteration_proxy_value(a2, (uint64_t)v6);
}

uint64_t nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::end@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v4;
  v6[1] = v4;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::iter_impl(v6, v3);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_end((unsigned __int8 **)v6);
  return nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::iteration_proxy_value(a2, (uint64_t)v6);
}

uint64_t nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key(unsigned __int8 **a1)
{
  int v2;
  unint64_t v3;

  if (!*a1)
    nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key();
  v2 = **a1;
  if (v2 == 1)
    return nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key(a1);
  if (v2 != 2)
    return (uint64_t)(a1 + 10);
  v3 = (unint64_t)a1[5];
  if ((unsigned __int8 *)v3 != a1[6])
  {
    nlohmann::detail::int_to_string<std::string>((uint64_t)(a1 + 7), v3);
    a1[6] = a1[5];
  }
  return (uint64_t)(a1 + 7);
}

uint64_t nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::~iteration_proxy_value(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  return a1;
}

void ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke_2(uint64_t a1, NSObject *a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6[2];

  v6[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v2 = *(uint64_t **)(a1 + 32);
  makeJsonFromNSObjectWithDepthCount(&v5, a2, *(_BYTE *)(a1 + 40) + 1);
  v3 = v2[1];
  if (v3 >= v2[2])
  {
    v4 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v2, (uint64_t)&v5);
  }
  else
  {
    *(_BYTE *)v3 = v5;
    *(uint64_t **)(v3 + 8) = v6[0];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v5);
    LOBYTE(v5) = 0;
    v6[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
    v4 = v3 + 16;
  }
  v2[1] = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v6, v5);
}

void sub_1A4D0597C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(_QWORD *a1, char **a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;

  v5 = std::string::basic_string[abi:ne180100]<0>(a1, *a2);
  *((_BYTE *)v5 + 24) = *(_BYTE *)a3;
  v6 = (uint64_t)(v5 + 3);
  v5[4] = *(_QWORD *)(a3 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1 + 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a1 + 32), *(unsigned __int8 *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v15 = 0u;
  v16 = 0u;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  *(_QWORD *)&v15 = v10;
  *((_QWORD *)&v15 + 1) = v11;
  *((_QWORD *)&v16 + 1) = &v10[16 * v12];
  *(_BYTE *)v11 = *(_BYTE *)a2;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(_QWORD *)&v16 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
  v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v15);
  return v13;
}

void sub_1A4D05B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_begin(unsigned __int8 **result)
{
  unsigned __int8 *v1;
  int v2;

  v1 = *result;
  if (!*result)
    __assert_rtn("set_begin", "iter_impl.hpp", 174, "m_object != nullptr");
  v2 = *v1;
  if (*v1)
  {
    if (v2 == 2)
    {
      result[2] = (unsigned __int8 *)**((_QWORD **)v1 + 1);
    }
    else if (v2 == 1)
    {
      result[1] = (unsigned __int8 *)**((_QWORD **)v1 + 1);
    }
    else
    {
      result[4] = 0;
    }
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

_QWORD *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::iter_impl(_QWORD *result, uint64_t a2)
{
  *result = a2;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0x8000000000000000;
  if (!a2)
    __assert_rtn("iter_impl", "iter_impl.hpp", 88, "m_object != nullptr");
  return result;
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_end(unsigned __int8 **result)
{
  unsigned __int8 *v1;
  int v2;

  v1 = *result;
  if (!*result)
    __assert_rtn("set_end", "iter_impl.hpp", 211, "m_object != nullptr");
  v2 = *v1;
  if (v2 == 2)
  {
    result[2] = *(unsigned __int8 **)(*((_QWORD *)v1 + 1) + 8);
  }
  else if (v2 == 1)
  {
    result[1] = (unsigned __int8 *)(*((_QWORD *)v1 + 1) + 8);
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

char *nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(char *result, _BYTE *a2)
{
  char *v2;
  nlohmann::detail::exception *exception;
  char *v4;
  std::string *v5;
  __int128 v6;
  std::string v7;
  __int128 v8;
  std::string::size_type v9;
  uint64_t v10;

  v2 = result;
  v10 = *MEMORY[0x1E0C80C00];
  if (*result != 4)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v4 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
    std::string::basic_string[abi:ne180100]<0>(&v7, v4);
    v5 = std::string::insert(&v7, 0, "type must be BOOLean, but is ");
    v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v9 = v5->__r_.__value_.__r.__words[2];
    v8 = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(302, (uint64_t)&v8, exception);
  }
  *a2 = result[8];
  return result;
}

void sub_1A4D05DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

unsigned __int8 *nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,unsigned long long,0>(unsigned __int8 *result, unint64_t *a2)
{
  char *v2;
  int v3;
  unint64_t v4;
  nlohmann::detail::exception *exception;
  char *v6;
  std::string *v7;
  __int128 v8;
  std::string v9;
  __int128 v10;
  std::string::size_type v11;
  uint64_t v12;

  v2 = (char *)result;
  v12 = *MEMORY[0x1E0C80C00];
  v3 = *result;
  if (v3 != 5)
  {
    if (v3 == 7)
    {
      v4 = (unint64_t)*((double *)result + 1);
      goto LABEL_6;
    }
    if (v3 != 6)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v6 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
      std::string::basic_string[abi:ne180100]<0>(&v9, v6);
      v7 = std::string::insert(&v9, 0, "type must be number, but is ");
      v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      v11 = v7->__r_.__value_.__r.__words[2];
      v10 = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(302, (uint64_t)&v10, exception);
    }
  }
  v4 = *((_QWORD *)result + 1);
LABEL_6:
  *a2 = v4;
  return result;
}

void sub_1A4D05F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

unsigned __int8 *nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,long long,0>(unsigned __int8 *result, uint64_t *a2)
{
  char *v2;
  int v3;
  uint64_t v4;
  nlohmann::detail::exception *exception;
  char *v6;
  std::string *v7;
  __int128 v8;
  std::string v9;
  __int128 v10;
  std::string::size_type v11;
  uint64_t v12;

  v2 = (char *)result;
  v12 = *MEMORY[0x1E0C80C00];
  v3 = *result;
  if (v3 != 5)
  {
    if (v3 == 7)
    {
      v4 = (uint64_t)*((double *)result + 1);
      goto LABEL_6;
    }
    if (v3 != 6)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v6 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
      std::string::basic_string[abi:ne180100]<0>(&v9, v6);
      v7 = std::string::insert(&v9, 0, "type must be number, but is ");
      v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      v11 = v7->__r_.__value_.__r.__words[2];
      v10 = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(302, (uint64_t)&v10, exception);
    }
  }
  v4 = *((_QWORD *)result + 1);
LABEL_6:
  *a2 = v4;
  return result;
}

void sub_1A4D060B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

unsigned __int8 *nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,double,0>(unsigned __int8 *result, double *a2)
{
  char *v2;
  int v3;
  double v4;
  nlohmann::detail::exception *exception;
  char *v6;
  std::string *v7;
  __int128 v8;
  std::string v9;
  __int128 v10;
  std::string::size_type v11;
  uint64_t v12;

  v2 = (char *)result;
  v12 = *MEMORY[0x1E0C80C00];
  v3 = *result;
  switch(v3)
  {
    case 5:
      v4 = (double)*((uint64_t *)result + 1);
      break;
    case 7:
      v4 = *((double *)result + 1);
      break;
    case 6:
      v4 = (double)*((unint64_t *)result + 1);
      break;
    default:
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v6 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
      std::string::basic_string[abi:ne180100]<0>(&v9, v6);
      v7 = std::string::insert(&v9, 0, "type must be number, but is ");
      v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      v11 = v7->__r_.__value_.__r.__words[2];
      v10 = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(302, (uint64_t)&v10, exception);
  }
  *a2 = v4;
  return result;
}

void sub_1A4D06228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

std::string *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::string,std::string,0>@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(a1, a2);
}

void sub_1A4D062B4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t a1, std::string *this)
{
  nlohmann::detail::exception *exception;
  char *v5;
  std::string *v6;
  __int128 v7;
  std::string v8;
  __int128 v9;
  std::string::size_type v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)a1 != 3)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v8, v5);
    v6 = std::string::insert(&v8, 0, "type must be string, but is ");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v10 = v6->__r_.__value_.__r.__words[2];
    v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(302, (uint64_t)&v9, exception);
  }
  return std::string::operator=(this, *(const std::string **)(a1 + 8));
}

void sub_1A4D063C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::__split_buffer<NSString * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::iteration_proxy_value(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 56), "0");
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 80), (char *)&unk_1A4D1D2AD);
  return a1;
}

BOOL nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==(unsigned __int8 **a1, unsigned __int8 **a2)
{
  unsigned __int8 *v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  nlohmann::detail::exception *exception;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  if (*a1 != *a2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v8, "cannot compare iterators of different containers");
    nlohmann::detail::invalid_iterator::create(212, (uint64_t)v8, exception);
  }
  if (!v2)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==();
  v3 = *v2;
  if (v3 == 2)
  {
    v4 = a1[2];
    v5 = a2[2];
  }
  else if (v3 == 1)
  {
    v4 = a1[1];
    v5 = a2[1];
  }
  else
  {
    v4 = a1[4];
    v5 = a2[4];
  }
  return v4 == v5;
}

void sub_1A4D0666C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  int v15;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

void nlohmann::detail::invalid_iterator::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(&__p, "invalid_iterator");
  nlohmann::detail::exception::name(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(_QWORD *)a3 = &off_1E4DEB950;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_1A4D067C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::invalid_iterator::~invalid_iterator(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++(unsigned __int8 **result)
{
  int v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  BOOL v5;

  if (!*result)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++();
  v1 = **result;
  if (v1 == 2)
  {
    result[2] += 16;
  }
  else if (v1 == 1)
  {
    v2 = result[1];
    v3 = (unsigned __int8 *)*((_QWORD *)v2 + 1);
    if (v3)
    {
      do
      {
        v4 = v3;
        v3 = *(unsigned __int8 **)v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        v4 = (unsigned __int8 *)*((_QWORD *)v2 + 2);
        v5 = *(_QWORD *)v4 == (_QWORD)v2;
        v2 = v4;
      }
      while (!v5);
    }
    result[1] = v4;
  }
  else
  {
    ++result[4];
  }
  return result;
}

double nlohmann::detail::int_to_string<std::string>(uint64_t a1, unint64_t __val)
{
  double result;
  std::string v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  std::to_string(&v4, __val);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  result = *(double *)&v4.__r_.__value_.__l.__data_;
  *(std::string *)a1 = v4;
  return result;
}

uint64_t nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key(_QWORD *a1)
{
  nlohmann::detail::exception *exception;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  if (!*a1)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key();
  if (*(_BYTE *)*a1 != 1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v3, "cannot use key() for non-object iterators");
    nlohmann::detail::invalid_iterator::create(207, (uint64_t)v3, exception);
  }
  return a1[1] + 32;
}

void sub_1A4D06A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  int v15;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

unsigned __int8 *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*(unsigned __int8 **a1)
{
  unsigned __int8 *result;
  int v3;
  nlohmann::detail::exception *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  nlohmann::detail::exception *exception;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  result = *a1;
  if (!result)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
  v3 = *result;
  if (v3 == 1)
  {
    v6 = a1[1];
    if (v6 == (unsigned __int8 *)(*((_QWORD *)result + 1) + 8))
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
    return v6 + 56;
  }
  else if (v3 == 2)
  {
    v5 = *(unsigned __int8 **)(*((_QWORD *)result + 1) + 8);
    result = a1[2];
    if (result == v5)
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
  }
  else
  {
    if (!*result)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, exception);
    }
    if (a1[4])
    {
      v4 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, v4);
    }
  }
  return result;
}

void sub_1A4D06BF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  char v15;

  if (a14 < 0)
    operator delete(__p);
  if ((v15 & 1) != 0)
    __cxa_free_exception(v14);
  _Unwind_Resume(exception_object);
}

char ***std::back_insert_iterator<std::vector<NSObject * {__strong}>>::operator=[abi:ne180100](char ***a1, uint64_t *a2)
{
  char **v4;
  char *v5;
  char **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  _QWORD v26[2];
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v12 = (v5 - *v4) >> 3;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v13 = v8 - (_QWORD)*v4;
    v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1))
      v14 = v12 + 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    v29 = v7;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>(v7, v15);
    else
      v16 = 0;
    v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    v28 = v18;
    v19 = *a2;
    *a2 = 0;
    *(_QWORD *)v17 = v19;
    v11 = v17 + 8;
    v27 = v17 + 8;
    v21 = *v4;
    v20 = v4[1];
    if (v20 == *v4)
    {
      v23 = v4[1];
    }
    else
    {
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *(_QWORD *)v20 = 0;
        *((_QWORD *)v17 - 1) = v22;
        v17 -= 8;
      }
      while (v20 != v21);
      v23 = *v4;
      v20 = v4[1];
      v11 = v27;
      v18 = v28;
    }
    *v4 = v17;
    v26[0] = v23;
    v26[1] = v23;
    v4[1] = v11;
    v27 = v20;
    v24 = v4[2];
    v4[2] = v18;
    v28 = v24;
    std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    v10 = *a2;
    *a2 = 0;
    *(_QWORD *)v5 = v10;
    v11 = v5 + 8;
  }
  v4[1] = v11;
  return a1;
}

void FrameworkConfiguration::getExternalConfiguration(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 **v10;
  uint64_t v11;
  NSObject *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 *v17;
  __int128 v18;
  __int128 v19;
  NSObject *v20;
  unsigned __int8 *v21;
  _OWORD v22[2];
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  _OWORD v27[2];
  unint64_t v28;
  unsigned __int8 *v29[5];
  unint64_t v30;
  uint64_t *v31;
  unsigned __int8 *v32[3];
  unsigned __int8 **v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a1 + 3;
  v5 = a1[3];
  if (!v5)
  {
      FrameworkConfiguration::getExternalConfiguration(v12);
    *(_BYTE *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    return;
  }
  v8 = *a1;
  if (*a1 == -1)
    v8 = 0;
  v9 = v8 + *(unsigned int *)(a1[2] + 12);
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v31 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v33 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(v5, v9, (uint64_t)v32, 1, &v30);
  v10 = v33;
  if (v33 == v32)
  {
    v11 = 4;
    v10 = v32;
    goto LABEL_11;
  }
  if (v33)
  {
    v11 = 5;
LABEL_11:
    (*(void (**)(void))&(*v10)[8 * v11])();
  }
  if (v30 == 2)
  {
    v32[0] = (unsigned __int8 *)&v30;
    v32[1] = 0;
    v32[2] = 0;
    v33 = 0;
    v34 = 0x8000000000000000;
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin(v32);
    v29[0] = (unsigned __int8 *)&v30;
    memset(&v29[1], 0, 24);
    v29[4] = (unsigned __int8 *)0x8000000000000000;
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(v29);
    while (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==(v32, v29))
    {
      v13 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*(v32);
      v14 = (uint64_t)v13;
      if (*v13 == 1)
      {
        v28 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v27[0] = v15;
        v27[1] = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::find<char const(&)[5]>((uint64_t)v13, "kind", (uint64_t)v27);
        v26 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v24 = v16;
        v25 = v16;
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(&v24, v14);
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)&v24);
        if (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)v27, (unsigned __int8 **)&v24))
        {
          v17 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*((unsigned __int8 **)v27);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v22, a2);
          LODWORD(v17) = nlohmann::operator==(v17, (unsigned __int8 *)v22);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)v22 + 1, LOBYTE(v22[0]));
          if ((_DWORD)v17)
          {
            v26 = 0xAAAAAAAAAAAAAAAALL;
            *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v24 = v18;
            v25 = v18;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::find<char const(&)[5]>(v14, "configuration", (uint64_t)&v24);
            v23 = 0xAAAAAAAAAAAAAAAALL;
            *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v22[0] = v19;
            v22[1] = v19;
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v22, v14);
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)v22);
            if (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)&v24, (unsigned __int8 **)v22))
            {
              v21 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*((unsigned __int8 **)&v24);
              *(_BYTE *)a3 = *v21;
              *(_QWORD *)(a3 + 8) = *((_QWORD *)v21 + 1);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
              *v21 = 0;
              *((_QWORD *)v21 + 1) = 0;
              goto LABEL_23;
            }
          }
        }
      }
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++(v32);
    }
  }
  else
  {
      FrameworkConfiguration::getExternalConfiguration(v6, v9, v20);
  }
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
LABEL_23:
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v31, v30);
}

void sub_1A4D070B0(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;

  if (!a2)
    _Unwind_Resume(exception_object);
  v5 = *(_QWORD **)(v2 - 104);
  if (v5 == (_QWORD *)(v2 - 128))
  {
    v6 = 4;
    v5 = (_QWORD *)(v2 - 128);
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_7:
  if (a2 == 2)
  {
    __cxa_begin_catch(exception_object);
    *(_BYTE *)(v2 - 144) = 0;
    *(_QWORD *)(v2 - 136) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 144);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 144);
    __cxa_end_catch();
    JUMPOUT(0x1A4D06E74);
  }
  __clang_call_terminate(exception_object);
}

unsigned __int8 *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*(unsigned __int8 **a1)
{
  unsigned __int8 *result;
  int v3;
  nlohmann::detail::exception *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  nlohmann::detail::exception *exception;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  result = *a1;
  if (!result)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
  v3 = *result;
  if (v3 == 1)
  {
    v6 = a1[1];
    if (v6 == (unsigned __int8 *)(*((_QWORD *)result + 1) + 8))
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
    return v6 + 56;
  }
  else if (v3 == 2)
  {
    v5 = *(unsigned __int8 **)(*((_QWORD *)result + 1) + 8);
    result = a1[2];
    if (result == v5)
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
  }
  else
  {
    if (!*result)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, exception);
    }
    if (a1[4])
    {
      v4 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, v4);
    }
  }
  return result;
}

void sub_1A4D0729C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  char v15;

  if (a14 < 0)
    operator delete(__p);
  if ((v15 & 1) != 0)
    __cxa_free_exception(v14);
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::find<char const(&)[5]>@<X0>(uint64_t a1@<X0>, std::string::value_type *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v6;
  unsigned __int8 **v7;
  uint64_t result;

  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  v7 = (unsigned __int8 **)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl((_QWORD *)a3, a1);
  result = (uint64_t)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(v7);
  if (*(_BYTE *)a1 == 1)
  {
    result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::find<char [5]>(*(_QWORD *)(a1 + 8), a2);
    *(_QWORD *)(a3 + 8) = result;
  }
  return result;
}

BOOL nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==(unsigned __int8 **a1, unsigned __int8 **a2)
{
  unsigned __int8 *v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  nlohmann::detail::exception *exception;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  if (*a1 != *a2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v8, "cannot compare iterators of different containers");
    nlohmann::detail::invalid_iterator::create(212, (uint64_t)v8, exception);
  }
  if (!v2)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==();
  v3 = *v2;
  if (v3 == 2)
  {
    v4 = a1[2];
    v5 = a2[2];
  }
  else if (v3 == 1)
  {
    v4 = a1[1];
    v5 = a2[1];
  }
  else
  {
    v4 = a1[4];
    v5 = a2[4];
  }
  return v4 == v5;
}

void sub_1A4D07440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  int v15;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void std::__shared_ptr_emplace<FrameworkConfiguration>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBAA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<FrameworkConfiguration>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBAA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85A70E0);
}

void std::__shared_ptr_emplace<FrameworkConfiguration>::__on_zero_shared(uint64_t a1)
{
  MemoryMappedBuffer::~MemoryMappedBuffer((MemoryMappedBuffer *)(a1 + 24));
}

_BYTE *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(_BYTE *a1, int a2)
{
  _QWORD *v3;

  switch(a2)
  {
    case 1:
      v3 = operator new(0x18uLL);
      v3[2] = 0;
      v3[1] = 0;
      *v3 = v3 + 1;
      goto LABEL_8;
    case 2:
      v3 = operator new(0x18uLL);
      v3[1] = 0;
      v3[2] = 0;
      *v3 = 0;
      goto LABEL_8;
    case 3:
      v3 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[1]>((char *)&unk_1A4D1D2AD);
      goto LABEL_8;
    case 4:
      *a1 = 0;
      return a1;
    case 8:
      v3 = operator new(0x20uLL);
      v3[1] = 0;
      v3[2] = 0;
      *v3 = 0;
      *((_WORD *)v3 + 12) = 0;
LABEL_8:
      *(_QWORD *)a1 = v3;
      break;
    default:
      *(_QWORD *)a1 = 0;
      break;
  }
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[1]>(char *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_1A4D075F4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void nlohmann::detail::other_error::~other_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _QWORD *a5@<X8>)
{
  _QWORD *v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;
  _BYTE v14[24];
  _BYTE *v15;
  _BYTE v16[24];
  _BYTE *v17;
  _QWORD v18[19];

  v18[18] = *MEMORY[0x1E0C80C00];
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  a5[1] = 0;
  *(_BYTE *)a5 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a5);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v14, a3);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>(a1, a2, (uint64_t)v14, a4, (uint64_t)v16);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parse((uint64_t)v16, 1, (uint64_t)a5);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)v18);
  v10 = v17;
  if (v17 == v16)
  {
    v11 = 4;
    v10 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_6:
  result = v15;
  if (v15 == v14)
  {
    v13 = 4;
    result = v14;
  }
  else
  {
    if (!v15)
      return result;
    v13 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v13))();
}

void sub_1A4D077A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, uint64_t a13)
{
  uint64_t **v13;
  uint64_t *v15;
  uint64_t v16;

  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~parser(&a13);
  v15 = a12;
  if (a12 == &a9)
  {
    v16 = 4;
    v15 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_6:
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v13);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  _QWORD *result;
  uint64_t v8;
  __int128 v9;
  _BYTE v10[24];
  _BYTE *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v9 = a1;
  *((_QWORD *)&v9 + 1) = a2;
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v10, a3);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(a5, &v9, (uint64_t)v10, a4);
  result = v11;
  if (v11 == v10)
  {
    v8 = 4;
    result = v10;
  }
  else
  {
    if (!v11)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v8))();
}

void sub_1A4D078B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a15;
  if (a15 == v15)
  {
    v18 = 4;
    v17 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parse(uint64_t a1, int a2, uint64_t a3)
{
  __int128 v6;
  _QWORD *v7;
  uint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t **v16;
  unsigned __int8 v17;
  uint64_t v18;
  int v19;
  unsigned __int8 v20;
  uint64_t v21;
  unsigned __int8 v22[8];
  uint64_t *v23;
  char v24[8];
  uint64_t v25;
  unsigned __int8 v26[8];
  uint64_t v27;
  void *v28[2];
  char v29;
  std::string __p;
  __int128 v31;
  uint64_t v32;
  std::exception v33;
  _BYTE v34[24];
  std::string v35;
  _BYTE v36[24];
  _BYTE *v37;
  _BYTE v38[48];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 24))
  {
    v45 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v43 = v6;
    v44 = v6;
    v41 = v6;
    v42 = v6;
    v39 = v6;
    v40 = v6;
    *(_OWORD *)&v38[16] = v6;
    *(_OWORD *)&v38[32] = v6;
    *(_OWORD *)v38 = v6;
    std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v36, a1);
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::json_sax_dom_callback_parser((uint64_t)v38, a3, (uint64_t)v36, *(_BYTE *)(a1 + 176));
    v7 = v37;
    if (v37 == v36)
    {
      v8 = 4;
      v7 = v36;
    }
    else
    {
      if (!v37)
      {
LABEL_19:
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(a1, (uint64_t *)v38);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
        if (a2)
        {
          v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(a1 + 40);
          *(_DWORD *)(a1 + 32) = v14;
          if (v14 != 15)
          {
            v15 = *(_QWORD *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &v35);
            v31 = *(_OWORD *)(a1 + 64);
            v32 = *(_QWORD *)(a1 + 80);
            std::string::basic_string[abi:ne180100]<0>(v28, "value");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xFu, (uint64_t)v28, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v31, (uint64_t)&__p, (nlohmann::detail::exception *)&v33);
            nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)v38, v15, (uint64_t)&v35, (const nlohmann::detail::parse_error *)&v33);
            v33.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
            MEMORY[0x1A85A6FD8](v34);
            std::exception::~exception(&v33);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (v29 < 0)
              operator delete(v28[0]);
            if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v35.__r_.__value_.__l.__data_);
          }
        }
        if (BYTE8(v41))
        {
          v26[0] = 9;
          v16 = (uint64_t **)&v27;
          v27 = 0;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
          v17 = *(_BYTE *)a3;
          *(_BYTE *)a3 = v26[0];
          v26[0] = v17;
          v18 = *(_QWORD *)(a3 + 8);
          *(_QWORD *)(a3 + 8) = v27;
          v27 = v18;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
          v19 = v26[0];
        }
        else
        {
          if (*(_BYTE *)a3 != 9)
          {
LABEL_32:
            nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~json_sax_dom_callback_parser((uint64_t)v38);
            return;
          }
          v24[0] = 0;
          v16 = (uint64_t **)&v25;
          v25 = 0;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
          v20 = *(_BYTE *)a3;
          *(_BYTE *)a3 = v24[0];
          v24[0] = v20;
          v21 = *(_QWORD *)(a3 + 8);
          *(_QWORD *)(a3 + 8) = v25;
          v25 = v21;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
          v19 = v24[0];
        }
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v16, v19);
        goto LABEL_32;
      }
      v8 = 5;
    }
    (*(void (**)(void))(*v7 + 8 * v8))();
    goto LABEL_19;
  }
  v9 = *(_BYTE *)(a1 + 176);
  *(_QWORD *)&v38[40] = 0xAAAAAAAAAAAAAA00;
  *(_QWORD *)v38 = a3;
  memset(&v38[8], 0, 32);
  v38[41] = v9;
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(a1, (uint64_t *)v38, a3);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  if (a2)
  {
    v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(a1 + 40);
    *(_DWORD *)(a1 + 32) = v10;
    if (v10 != 15)
    {
      v11 = *(_QWORD *)(a1 + 64);
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &v35);
      v31 = *(_OWORD *)(a1 + 64);
      v32 = *(_QWORD *)(a1 + 80);
      std::string::basic_string[abi:ne180100]<0>(v28, "value");
      nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xFu, (uint64_t)v28, &__p);
      nlohmann::detail::parse_error::create(101, (uint64_t *)&v31, (uint64_t)&__p, (nlohmann::detail::exception *)&v33);
      nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)v38, v11, (uint64_t)&v35, (const nlohmann::detail::parse_error *)&v33);
      v33.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
      MEMORY[0x1A85A6FD8](v34);
      std::exception::~exception(&v33);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v29 < 0)
        operator delete(v28[0]);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v35.__r_.__value_.__l.__data_);
    }
  }
  if (v38[40])
  {
    v22[0] = 9;
    v23 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v12 = *(_BYTE *)a3;
    *(_BYTE *)a3 = v22[0];
    v22[0] = v12;
    v13 = *(uint64_t **)(a3 + 8);
    *(_QWORD *)(a3 + 8) = v23;
    v23 = v13;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v23, v22[0]);
  }
  if (*(_QWORD *)&v38[8])
  {
    *(_QWORD *)&v38[16] = *(_QWORD *)&v38[8];
    operator delete(*(void **)&v38[8]);
  }
}

void sub_1A4D07D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,std::exception a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  uint64_t v45;
  uint64_t v46;
  void *v48;

  a31.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](v45 + 16);
  std::exception::~exception(&a31);
  if (a26 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a41 < 0)
    operator delete(a36);
  v48 = *(void **)(v46 - 200);
  if (v48)
  {
    *(_QWORD *)(v46 - 192) = v48;
    operator delete(v48);
  }
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~parser(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)(a1 + 5));
  v2 = (_QWORD *)a1[3];
  if (v2 == a1)
  {
    v3 = 4;
    v2 = a1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

uint64_t std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(uint64_t a1, _OWORD *a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;

  v7 = std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100](a1, a3);
  *(_DWORD *)(v7 + 32) = 0;
  v8 = v7 + 40;
  *(_OWORD *)(v7 + 40) = *a2;
  *(_DWORD *)(v7 + 56) = -1;
  *(_BYTE *)(v7 + 60) = 0;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(_QWORD *)(v7 + 128) = 0;
  *(_QWORD *)(v7 + 136) = &unk_1A4D1D2AD;
  *(_QWORD *)(v7 + 152) = 0;
  *(_QWORD *)(v7 + 160) = 0;
  *(_QWORD *)(v7 + 144) = 0;
  *(_DWORD *)(a1 + 168) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_decimal_point();
  *(_BYTE *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 32) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v8);
  return a1;
}

void sub_1A4D07FB4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v2);
  v4 = (_QWORD *)v1[3];
  if (v4 == v1)
  {
    v5 = 4;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
    v1 = (_QWORD *)v1[3];
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v5))(v1);
LABEL_6:
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_decimal_point()
{
  lconv *v0;

  v0 = localeconv();
  if (!v0)
    __assert_rtn("get_decimal_point", "lexer.hpp", 136, "loc != nullptr");
  if (v0->decimal_point)
    return *v0->decimal_point;
  else
    return 46;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const char *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 24)
    && !nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom((unsigned __int8 **)a1))
  {
    v8 = "invalid BOM; must be 0xEF 0xBB 0xBF if given";
    goto LABEL_19;
  }
  while (2)
  {
    while (1)
    {
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      v2 = *(_DWORD *)(a1 + 16);
      if (v2 > 31)
        break;
      if ((v2 - 9) >= 2 && v2 != 13)
      {
        if ((v2 + 1) < 2)
          return 15;
        goto LABEL_36;
      }
    }
    if (v2 > 90)
    {
      if (v2 <= 109)
      {
        if (v2 == 91)
          return 8;
        if (v2 == 93)
          return 10;
        if (v2 != 102)
          goto LABEL_36;
        qmemcpy(v9, "false", 5);
        v5 = a1;
        v6 = 5;
        v7 = 2;
        return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal(v5, (unsigned __int8 *)v9, v6, v7);
      }
      if (v2 <= 122)
      {
        if (v2 == 110)
        {
          v9[0] = 1819047278;
          v5 = a1;
          v6 = 4;
          v7 = 3;
        }
        else
        {
          if (v2 != 116)
            goto LABEL_36;
          v9[0] = 1702195828;
          v5 = a1;
          v6 = 4;
          v7 = 1;
        }
        return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal(v5, (unsigned __int8 *)v9, v6, v7);
      }
      if (v2 == 123)
        return 9;
      if (v2 == 125)
        return 11;
LABEL_36:
      v8 = "invalid literal";
LABEL_19:
      *(_QWORD *)(a1 + 96) = v8;
      return 14;
    }
    switch(v2)
    {
      case ' ':
        continue;
      case '"':
        result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(a1);
        break;
      case ',':
        result = 13;
        break;
      case '-':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(a1);
        break;
      case ':':
        result = 12;
        break;
      default:
        goto LABEL_36;
    }
    return result;
  }
}

BOOL nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom(unsigned __int8 **a1)
{
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 239)
  {
    return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 187
        && nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 191;
  }
  else
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget((uint64_t)a1);
    return 1;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(unsigned __int8 **a1)
{
  int v2;
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 **v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 v16;
  uint64_t result;
  uint64_t v18;

  *(int64x2_t *)(a1 + 3) = vaddq_s64(*(int64x2_t *)(a1 + 3), vdupq_n_s64(1uLL));
  if (*((_BYTE *)a1 + 20))
  {
    *((_BYTE *)a1 + 20) = 0;
    v2 = *((_DWORD *)a1 + 4);
  }
  else
  {
    v3 = *a1;
    if (*a1 == a1[1])
    {
      v2 = -1;
    }
    else
    {
      v2 = *v3;
      *a1 = v3 + 1;
    }
    *((_DWORD *)a1 + 4) = v2;
  }
  if (v2 == -1)
    return 0xFFFFFFFFLL;
  v5 = a1[7];
  v4 = (unint64_t)a1[8];
  if ((unint64_t)v5 >= v4)
  {
    v7 = a1 + 6;
    v8 = (unint64_t)a1[6];
    v9 = &v5[-v8];
    v10 = (uint64_t)&v5[-v8 + 1];
    if (v10 < 0)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v11 = v4 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unsigned __int8 *)operator new(v12);
    else
      v13 = 0;
    v14 = &v13[v12];
    v9[(_QWORD)v13] = v2;
    v6 = (uint64_t)&v9[(_QWORD)v13 + 1];
    if (v5 == (unsigned __int8 *)v8)
    {
      v13 = &v9[(_QWORD)v13];
    }
    else
    {
      v15 = &v5[~v8];
      do
      {
        v16 = *--v5;
        (v15--)[(_QWORD)v13] = v16;
      }
      while (v5 != (unsigned __int8 *)v8);
      v5 = *v7;
    }
    a1[6] = v13;
    a1[7] = (unsigned __int8 *)v6;
    a1[8] = v14;
    if (v5)
      operator delete(v5);
  }
  else
  {
    *v5 = v2;
    v6 = (uint64_t)(v5 + 1);
  }
  a1[7] = (unsigned __int8 *)v6;
  result = *((unsigned int *)a1 + 4);
  if ((_DWORD)result == 10)
  {
    v18 = (uint64_t)(a1[5] + 1);
    a1[4] = 0;
    a1[5] = (unsigned __int8 *)v18;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  int v9;

  if (*a2 != *(unsigned __int8 *)(a1 + 16))
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal();
  if (a3 >= 2)
  {
    v6 = a3 - 1;
    v7 = a2 + 1;
    while (1)
    {
      v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      v9 = *v7++;
      if (v9 != v8)
        break;
      if (!--v6)
        return a4;
    }
    *(_QWORD *)(a1 + 96) = "invalid literal";
    return 14;
  }
  return a4;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(uint64_t a1)
{
  int v2;
  uint64_t result;
  const char *v4;
  int v5;
  std::string *v6;
  unint64_t v7;
  __int128 v8;
  __int128 *v9;
  int v10;
  unsigned int codepoint;
  unsigned int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  if (*(_DWORD *)(a1 + 16) != 34)
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string();
  while (2)
  {
    while (2)
    {
      v2 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         + 1;
      result = 4;
      v4 = "invalid string: missing closing quote";
      switch(v2)
      {
        case 0:
          goto LABEL_82;
        case 1:
          v4 = "invalid string: control character U+0000 (NUL) must be escaped to \\u0000";
          goto LABEL_82;
        case 2:
          v4 = "invalid string: control character U+0001 (SOH) must be escaped to \\u0001";
          goto LABEL_82;
        case 3:
          v4 = "invalid string: control character U+0002 (STX) must be escaped to \\u0002";
          goto LABEL_82;
        case 4:
          v4 = "invalid string: control character U+0003 (ETX) must be escaped to \\u0003";
          goto LABEL_82;
        case 5:
          v4 = "invalid string: control character U+0004 (EOT) must be escaped to \\u0004";
          goto LABEL_82;
        case 6:
          v4 = "invalid string: control character U+0005 (ENQ) must be escaped to \\u0005";
          goto LABEL_82;
        case 7:
          v4 = "invalid string: control character U+0006 (ACK) must be escaped to \\u0006";
          goto LABEL_82;
        case 8:
          v4 = "invalid string: control character U+0007 (BEL) must be escaped to \\u0007";
          goto LABEL_82;
        case 9:
          v4 = "invalid string: control character U+0008 (BS) must be escaped to \\u0008 or \\b";
          goto LABEL_82;
        case 10:
          v4 = "invalid string: control character U+0009 (HT) must be escaped to \\u0009 or \\t";
          goto LABEL_82;
        case 11:
          v4 = "invalid string: control character U+000A (LF) must be escaped to \\u000A or \\n";
          goto LABEL_82;
        case 12:
          v4 = "invalid string: control character U+000B (VT) must be escaped to \\u000B";
          goto LABEL_82;
        case 13:
          v4 = "invalid string: control character U+000C (FF) must be escaped to \\u000C or \\f";
          goto LABEL_82;
        case 14:
          v4 = "invalid string: control character U+000D (CR) must be escaped to \\u000D or \\r";
          goto LABEL_82;
        case 15:
          v4 = "invalid string: control character U+000E (SO) must be escaped to \\u000E";
          goto LABEL_82;
        case 16:
          v4 = "invalid string: control character U+000F (SI) must be escaped to \\u000F";
          goto LABEL_82;
        case 17:
          v4 = "invalid string: control character U+0010 (DLE) must be escaped to \\u0010";
          goto LABEL_82;
        case 18:
          v4 = "invalid string: control character U+0011 (DC1) must be escaped to \\u0011";
          goto LABEL_82;
        case 19:
          v4 = "invalid string: control character U+0012 (DC2) must be escaped to \\u0012";
          goto LABEL_82;
        case 20:
          v4 = "invalid string: control character U+0013 (DC3) must be escaped to \\u0013";
          goto LABEL_82;
        case 21:
          v4 = "invalid string: control character U+0014 (DC4) must be escaped to \\u0014";
          goto LABEL_82;
        case 22:
          v4 = "invalid string: control character U+0015 (NAK) must be escaped to \\u0015";
          goto LABEL_82;
        case 23:
          v4 = "invalid string: control character U+0016 (SYN) must be escaped to \\u0016";
          goto LABEL_82;
        case 24:
          v4 = "invalid string: control character U+0017 (ETB) must be escaped to \\u0017";
          goto LABEL_82;
        case 25:
          v4 = "invalid string: control character U+0018 (CAN) must be escaped to \\u0018";
          goto LABEL_82;
        case 26:
          v4 = "invalid string: control character U+0019 (EM) must be escaped to \\u0019";
          goto LABEL_82;
        case 27:
          v4 = "invalid string: control character U+001A (SUB) must be escaped to \\u001A";
          goto LABEL_82;
        case 28:
          v4 = "invalid string: control character U+001B (ESC) must be escaped to \\u001B";
          goto LABEL_82;
        case 29:
          v4 = "invalid string: control character U+001C (FS) must be escaped to \\u001C";
          goto LABEL_82;
        case 30:
          v4 = "invalid string: control character U+001D (GS) must be escaped to \\u001D";
          goto LABEL_82;
        case 31:
          v4 = "invalid string: control character U+001E (RS) must be escaped to \\u001E";
          goto LABEL_82;
        case 32:
          v4 = "invalid string: control character U+001F (US) must be escaped to \\u001F";
          goto LABEL_82;
        case 33:
        case 34:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
          v5 = *(_DWORD *)(a1 + 16);
          goto LABEL_4;
        case 35:
          return result;
        case 93:
          v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
          v4 = "invalid string: forbidden character after backslash";
          if (v10 <= 97)
          {
            switch(v10)
            {
              case '"':
                LOBYTE(v5) = 34;
                break;
              case '/':
                LOBYTE(v5) = 47;
                break;
              case '\\':
                LOBYTE(v5) = 92;
                break;
              default:
                goto LABEL_82;
            }
            goto LABEL_4;
          }
          break;
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
          *(_QWORD *)&v14 = 0xBF00000080;
          v6 = (std::string *)a1;
          v7 = 2;
          goto LABEL_19;
        case 225:
          v8 = xmmword_1A4D1BB60;
          goto LABEL_7;
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 239:
        case 240:
          v8 = xmmword_1A4D1BB50;
          goto LABEL_7;
        case 238:
          v8 = xmmword_1A4D1BB40;
LABEL_7:
          v14 = v8;
          v6 = (std::string *)a1;
          v7 = 4;
          goto LABEL_19;
        case 241:
          v15 = 0xBF00000080;
          v9 = &xmmword_1A4D1BA98;
          goto LABEL_18;
        case 242:
        case 243:
        case 244:
          v15 = 0xBF00000080;
          v9 = &xmmword_1A4D1BAB0;
          goto LABEL_18;
        case 245:
          v15 = 0xBF00000080;
          v9 = &xmmword_1A4D1BAC8;
LABEL_18:
          v14 = *v9;
          v6 = (std::string *)a1;
          v7 = 6;
LABEL_19:
          if ((nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(v6, &v14, v7) & 1) == 0)return 14;
          continue;
        default:
          v4 = "invalid string: ill-formed UTF-8 byte";
          goto LABEL_82;
      }
      break;
    }
    switch(v10)
    {
      case 'n':
        LOBYTE(v5) = 10;
        goto LABEL_4;
      case 'o':
      case 'p':
      case 'q':
      case 's':
        goto LABEL_82;
      case 'r':
        LOBYTE(v5) = 13;
        goto LABEL_4;
      case 't':
        LOBYTE(v5) = 9;
        goto LABEL_4;
      case 'u':
        codepoint = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (codepoint == -1)
          goto LABEL_85;
        v12 = codepoint;
        if ((codepoint & 0xFFFFFC00) != 0xD800)
        {
          if ((codepoint & 0xFFFFFC00) == 0xDC00)
          {
            v4 = "invalid string: surrogate U+DC00..U+DFFF must follow U+D800..U+DBFF";
            goto LABEL_82;
          }
          if (codepoint >= 0x110000)
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string();
          if (codepoint > 0x7F)
          {
            if (codepoint <= 0x7FF)
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 6) | 0xC0);
              goto LABEL_39;
            }
            if (!HIWORD(codepoint))
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 12) | 0xE0);
              goto LABEL_38;
            }
LABEL_37:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 18) | 0xF0);
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 12) & 0x3F | 0x80);
LABEL_38:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 6) & 0x3F | 0x80);
LABEL_39:
            LOBYTE(v5) = v12 & 0x3F | 0x80;
            goto LABEL_4;
          }
          LOBYTE(v5) = codepoint;
LABEL_4:
          std::string::push_back((std::string *)(a1 + 72), v5);
          continue;
        }
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 92
          || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 117)
        {
LABEL_86:
          v4 = "invalid string: surrogate U+D800..U+DBFF must be followed by U+DC00..U+DFFF";
          goto LABEL_82;
        }
        v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (v13 != -1)
        {
          if (v13 >> 10 != 55)
            goto LABEL_86;
          v12 = v13 + (v12 << 10) - 56613888;
          goto LABEL_37;
        }
LABEL_85:
        v4 = "invalid string: '\\u' must be followed by 4 hex digits";
LABEL_82:
        *(_QWORD *)(a1 + 96) = v4;
        return 14;
      default:
        if (v10 == 98)
        {
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v10 != 102)
            goto LABEL_82;
          LOBYTE(v5) = 12;
        }
        goto LABEL_4;
    }
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(uint64_t a1)
{
  int v2;
  std::string *v3;
  int v4;
  std::string *v5;
  int v6;
  int v7;
  std::string *v8;
  const char **v9;
  const char *v10;
  uint64_t v11;
  int v13;
  const char *v14;
  int v15;
  int v16;
  const char **v17;
  const char *v18;
  unint64_t v19;
  uint64_t v20;
  const char **v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25[2];

  v25[1] = *(char **)MEMORY[0x1E0C80C00];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  v2 = *(_DWORD *)(a1 + 16);
  if ((v2 - 49) >= 9)
  {
    if (v2 == 48)
    {
      std::string::push_back((std::string *)(a1 + 72), 48);
      v4 = 5;
    }
    else
    {
      if (v2 != 45)
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
      v3 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), 45);
      v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      if ((v13 - 49) < 9)
      {
        v2 = *(_DWORD *)(a1 + 16);
        v4 = 6;
        goto LABEL_3;
      }
      if (v13 != 48)
      {
        v14 = "invalid number; expected digit after '-'";
        goto LABEL_52;
      }
      std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
      v4 = 6;
    }
    v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if (v15 == 101 || v15 == 69)
    {
      v5 = (std::string *)(a1 + 72);
      goto LABEL_9;
    }
    if (v15 != 46)
      goto LABEL_40;
    v5 = (std::string *)(a1 + 72);
LABEL_34:
    std::string::push_back(v5, *(_BYTE *)(a1 + 128));
    if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
       - 48 > 9)
    {
      v14 = "invalid number; expected digit after '.'";
      goto LABEL_52;
    }
    v5 = (std::string *)(a1 + 72);
    do
    {
      std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
      v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    }
    while ((v16 - 48) < 0xA);
    if (v16 != 101 && v16 != 69)
    {
LABEL_13:
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
      v25[0] = 0;
      *__error() = 0;
      goto LABEL_14;
    }
LABEL_9:
    std::string::push_back(v5, *(_BYTE *)(a1 + 16));
    v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v7 - 48) < 0xA)
    {
      v8 = (std::string *)(a1 + 72);
      goto LABEL_11;
    }
    if (v7 == 45 || v7 == 43)
    {
      v8 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
      if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         - 48 < 0xA)
      {
LABEL_11:
        std::string::push_back(v8, *(_BYTE *)(a1 + 16));
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
           - 48 <= 9)
        {
          do
            std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
          while (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
                - 48 < 0xA);
        }
        goto LABEL_13;
      }
      v14 = "invalid number; expected digit after exponent sign";
    }
    else
    {
      v14 = "invalid number; expected '+', '-', or digit after exponent";
    }
LABEL_52:
    *(_QWORD *)(a1 + 96) = v14;
    return 14;
  }
  v3 = (std::string *)(a1 + 72);
  v4 = 5;
LABEL_3:
  std::string::push_back(v3, v2);
  v5 = (std::string *)(a1 + 72);
  while (1)
  {
    v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v6 - 48) >= 0xA)
      break;
    std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
  }
  if (v6 == 46)
    goto LABEL_34;
  if (v6 == 69 || v6 == 101)
    goto LABEL_9;
LABEL_40:
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
  v25[0] = 0;
  *__error() = 0;
  if (v4 == 6)
  {
    v21 = (const char **)(a1 + 72);
    v22 = (const char *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0)
      v22 = *v21;
    v23 = strtoll(v22, v25, 10);
    if (*(char *)(a1 + 95) < 0)
    {
      v21 = *(const char ***)(a1 + 72);
      v24 = *(_QWORD *)(a1 + 80);
    }
    else
    {
      v24 = *(unsigned __int8 *)(a1 + 95);
    }
    if (v25[0] != (char *)v21 + v24)
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
    if (!*__error())
    {
      *(_QWORD *)(a1 + 104) = v23;
      return 6;
    }
  }
  else
  {
    v17 = (const char **)(a1 + 72);
    v18 = (const char *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0)
      v18 = *v17;
    v19 = strtoull(v18, v25, 10);
    if (*(char *)(a1 + 95) < 0)
    {
      v17 = *(const char ***)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 80);
    }
    else
    {
      v20 = *(unsigned __int8 *)(a1 + 95);
    }
    if (v25[0] != (char *)v17 + v20)
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
    if (!*__error())
    {
      *(_QWORD *)(a1 + 112) = v19;
      return 5;
    }
  }
LABEL_14:
  v9 = (const char **)(a1 + 72);
  v10 = (const char *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0)
    v10 = *v9;
  *(double *)(a1 + 120) = strtod(v10, v25);
  if (*(char *)(a1 + 95) < 0)
  {
    v9 = *(const char ***)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    v11 = *(unsigned __int8 *)(a1 + 95);
  }
  if (v25[0] != (char *)v9 + v11)
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
  return 7;
}

void sub_1A4D08D80(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 32);
  *(_BYTE *)(result + 20) = 1;
  --*(_QWORD *)(result + 24);
  if (v2 || (v1 = (_QWORD *)(result + 40), (v2 = *(_QWORD *)(result + 40)) != 0))
    *v1 = v2 - 1;
  if (*(_DWORD *)(result + 16) != -1)
  {
    v3 = *(_QWORD *)(result + 56);
    if (*(_QWORD *)(result + 48) == v3)
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget();
    *(_QWORD *)(result + 56) = v3 - 1;
  }
  return result;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  _BYTE *v9;

  if (*(char *)(a1 + 95) < 0)
  {
    **(_BYTE **)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = 0;
  }
  else
  {
    *(_BYTE *)(a1 + 72) = 0;
    *(_BYTE *)(a1 + 95) = 0;
  }
  v2 = *(_BYTE **)(a1 + 48);
  *(_QWORD *)(a1 + 56) = v2;
  v3 = *(_DWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 64);
  if ((unint64_t)v2 >= v4)
  {
    v6 = v4 - (_QWORD)v2;
    v7 = 2 * v6;
    if (2 * v6 <= 1)
      v7 = 1;
    if (v6 >= 0x3FFFFFFFFFFFFFFFLL)
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v8 = v7;
    v9 = operator new(v8);
    *v9 = v3;
    v5 = v9 + 1;
    *(_QWORD *)(a1 + 48) = v9;
    *(_QWORD *)(a1 + 56) = v9 + 1;
    *(_QWORD *)(a1 + 64) = &v9[v8];
    if (v2)
      operator delete(v2);
  }
  else
  {
    *v2 = v3;
    v5 = v2 + 1;
  }
  *(_QWORD *)(a1 + 56) = v5;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 16) != 117)
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint();
  v2 = 0;
  LODWORD(v3) = 0;
  v8 = xmmword_1A4D1BB70;
  do
  {
    v4 = *(_DWORD *)((char *)&v8 + v2);
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    v5 = *(_DWORD *)(a1 + 16);
    v6 = v5 - 48;
    if ((v5 - 48) >= 0xA)
    {
      if ((v5 - 65) > 5)
      {
        if ((v5 - 97) > 5)
          return 0xFFFFFFFFLL;
        v6 = v5 - 87;
      }
      else
      {
        v6 = v5 - 55;
      }
    }
    v3 = ((v6 << v4) + v3);
    v2 += 4;
  }
  while (v2 != 16);
  if (v3 >= 0x10000)
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint();
  return v3;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(std::string *a1, _DWORD *a2, unint64_t a3)
{
  std::string *v6;
  _DWORD *v7;
  int v8;
  uint64_t result;

  if (a3 > 6 || ((1 << a3) & 0x54) == 0)
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range();
  v6 = a1 + 3;
  std::string::push_back(a1 + 3, a1->__r_.__value_.__s.__data_[16]);
  v7 = &a2[a3];
  while (1)
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    v8 = a1->__r_.__value_.__r.__words[2];
    if (*a2 > v8 || v8 > a2[1])
      break;
    std::string::push_back(v6, v8);
    a2 += 2;
    if (a2 == v7)
      return 1;
  }
  result = 0;
  a1[4].__r_.__value_.__r.__words[0] = (std::string::size_type)"invalid string: ill-formed UTF-8 byte";
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(uint64_t a1)
{
  void *v2;

  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, uint64_t *a2)
{
  __int128 *v4;
  uint64_t v5;
  int v6;
  char v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  __int128 v31;
  std::string v32;
  std::string __p;
  void *v34[2];
  std::string::size_type v35;
  std::exception v36;
  _BYTE v37[24];
  std::string v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v4 = (__int128 *)(a1 + 112);
  v5 = a1 + 40;
  while (2)
  {
    switch(*(_DWORD *)(a1 + 32))
    {
      case 1:
        LOBYTE(v36.__vftable) = 1;
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v36, 0);
        goto LABEL_19;
      case 2:
        LOBYTE(v36.__vftable) = 0;
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v36, 0);
        goto LABEL_19;
      case 3:
        v36.__vftable = 0;
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(a2, (uint64_t)&v36, 0);
        goto LABEL_19;
      case 4:
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(a2, (uint64_t)v4, 0);
        goto LABEL_19;
      case 5:
        v36.__vftable = *(std::exception_vtbl **)(a1 + 152);
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(a2, (uint64_t **)&v36, 0);
        goto LABEL_19;
      case 6:
        v36.__vftable = *(std::exception_vtbl **)(a1 + 144);
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(a2, (uint64_t **)&v36, 0);
        goto LABEL_19;
      case 7:
        if ((*(_QWORD *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
        {
          v36.__vftable = *(std::exception_vtbl **)(a1 + 160);
          nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(a2, (uint64_t **)&v36, 0);
          goto LABEL_19;
        }
        v27 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v32);
        v28 = std::string::insert(&v32, 0, "number overflow parsing '");
        v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v29;
        v28->__r_.__value_.__l.__size_ = 0;
        v28->__r_.__value_.__r.__words[2] = 0;
        v28->__r_.__value_.__r.__words[0] = 0;
        v30 = std::string::append(&__p, "'");
        v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
        v35 = v30->__r_.__value_.__r.__words[2];
        *(_OWORD *)v34 = v31;
        v30->__r_.__value_.__l.__size_ = 0;
        v30->__r_.__value_.__r.__words[2] = 0;
        v30->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(406, (uint64_t)v34, (nlohmann::detail::exception *)&v36);
        v17 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v27, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
        v36.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
        MEMORY[0x1A85A6FD8](v37);
        std::exception::~exception(&v36);
        if (SHIBYTE(v35) < 0)
          operator delete(v34[0]);
        goto LABEL_50;
      case 8:
        if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(a2, 0xFFFFFFFFFFFFFFFFLL))goto LABEL_56;
        v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v6;
        if (v6 == 10)
        {
          v7 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array(a2);
          goto LABEL_13;
        }
        LOBYTE(v36.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&v39, &v36);
        continue;
      case 9:
        if ((nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(a2, 0xFFFFFFFFFFFFFFFFLL) & 1) == 0)goto LABEL_56;
        v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v8;
        if (v8 != 11)
        {
          if (v8 != 4)
            goto LABEL_59;
          if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::key(a2, v4))goto LABEL_56;
          v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
          *(_DWORD *)(a1 + 32) = v16;
          if (v16 != 12)
            goto LABEL_60;
          LOBYTE(v36.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&v39, &v36);
          v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
LABEL_37:
          *(_DWORD *)(a1 + 32) = v15;
          continue;
        }
        v7 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object(a2);
LABEL_13:
        if ((v7 & 1) == 0)
        {
LABEL_56:
          v17 = 0;
          goto LABEL_44;
        }
LABEL_19:
        v9 = v40;
        if (!v40)
        {
LABEL_43:
          v17 = 1;
          goto LABEL_44;
        }
        while (2)
        {
          if (((*(_QWORD *)&v39[((unint64_t)(v9 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v9 - 1)) & 1) != 0)
          {
            v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
            *(_DWORD *)(a1 + 32) = v10;
            if (v10 == 13)
              goto LABEL_36;
            if (v10 != 10)
            {
              v22 = *(_QWORD *)(a1 + 64);
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
              *(_OWORD *)v34 = *(_OWORD *)(a1 + 64);
              v35 = *(_QWORD *)(a1 + 80);
              std::string::basic_string[abi:ne180100]<0>(&v32, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xAu, (uint64_t)&v32, &__p);
              nlohmann::detail::parse_error::create(101, (uint64_t *)v34, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
              v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v22, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
              goto LABEL_49;
            }
            if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array(a2))
              goto LABEL_56;
            v11 = v40;
            if (!v40)
            {
              v23 = 383;
              goto LABEL_62;
            }
LABEL_30:
            v9 = v11 - 1;
            v40 = v9;
            if (!v9)
              goto LABEL_43;
            continue;
          }
          break;
        }
        v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v12;
        if (v12 != 13)
        {
          if (v12 != 11)
          {
            v24 = *(_QWORD *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
            *(_OWORD *)v34 = *(_OWORD *)(a1 + 64);
            v35 = *(_QWORD *)(a1 + 80);
            std::string::basic_string[abi:ne180100]<0>(&v32, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xBu, (uint64_t)&v32, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)v34, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
            v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v24, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
            goto LABEL_49;
          }
          if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object(a2))
            goto LABEL_56;
          v11 = v40;
          if (!v40)
          {
            v23 = 439;
LABEL_62:
            __assert_rtn("sax_parse_internal", "parser.hpp", v23, "not states.empty()");
          }
          goto LABEL_30;
        }
        v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v13;
        if (v13 != 4)
        {
LABEL_59:
          v25 = *(_QWORD *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
          *(_OWORD *)v34 = *(_OWORD *)(a1 + 64);
          v35 = *(_QWORD *)(a1 + 80);
          std::string::basic_string[abi:ne180100]<0>(&v32, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 4u, (uint64_t)&v32, &__p);
          nlohmann::detail::parse_error::create(101, (uint64_t *)v34, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
          v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v25, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
          goto LABEL_49;
        }
        if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::key(a2, v4))goto LABEL_56;
        v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v14;
        if (v14 == 12)
        {
LABEL_36:
          v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
          goto LABEL_37;
        }
LABEL_60:
        v26 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
        *(_OWORD *)v34 = *(_OWORD *)(a1 + 64);
        v35 = *(_QWORD *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v32, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xCu, (uint64_t)&v32, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v34, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
        v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v26, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
LABEL_49:
        v17 = v20;
        v36.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
        MEMORY[0x1A85A6FD8](v37);
        std::exception::~exception(&v36);
LABEL_50:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v32.__r_.__value_.__l.__data_);
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v38.__r_.__value_.__l.__data_);
LABEL_44:
        if (v39)
          operator delete(v39);
        return v17;
      case 0xE:
        v19 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
        *(_OWORD *)v34 = *(_OWORD *)(a1 + 64);
        v35 = *(_QWORD *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v32, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0, (uint64_t)&v32, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v34, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
        v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v19, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
        goto LABEL_49;
      default:
        v21 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v38);
        *(_OWORD *)v34 = *(_OWORD *)(a1 + 64);
        v35 = *(_QWORD *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v32, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0x10u, (uint64_t)&v32, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v34, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
        v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v21, (uint64_t)&v38, (const nlohmann::detail::parse_error *)&v36);
        goto LABEL_49;
    }
  }
}

void sub_1A4D09934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,std::exception a30)
{
  uint64_t v30;
  uint64_t v31;
  void *v33;

  a30.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](v30 + 16);
  std::exception::~exception(&a30);
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (*(char *)(v31 - 97) < 0)
    operator delete(*(void **)(v31 - 120));
  v33 = *(void **)(v31 - 96);
  if (v33)
    operator delete(v33);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error(uint64_t a1, uint64_t a2, uint64_t a3, const nlohmann::detail::parse_error *a4)
{
  nlohmann::detail::parse_error *exception;
  nlohmann::detail::parse_error *v6;
  nlohmann::detail::invalid_iterator *v7;
  nlohmann::detail::invalid_iterator *v8;
  nlohmann::detail::type_error *v9;
  nlohmann::detail::type_error *v10;
  nlohmann::detail::out_of_range *v11;
  nlohmann::detail::out_of_range *v12;
  nlohmann::detail::other_error *v13;
  nlohmann::detail::other_error *v14;

  *(_BYTE *)(a1 + 88) = 1;
  if (*(_BYTE *)(a1 + 128))
  {
    switch(~(100 * (*((_DWORD *)a4 + 2) / 100 / 100)) + *((_DWORD *)a4 + 2) / 100)
    {
      case 0:
        exception = (nlohmann::detail::parse_error *)__cxa_allocate_exception(0x28uLL);
        v6 = nlohmann::detail::parse_error::parse_error(exception, a4);
      case 1:
        v7 = (nlohmann::detail::invalid_iterator *)__cxa_allocate_exception(0x20uLL);
        v8 = nlohmann::detail::invalid_iterator::invalid_iterator(v7, a4);
      case 2:
        v9 = (nlohmann::detail::type_error *)__cxa_allocate_exception(0x20uLL);
        v10 = nlohmann::detail::type_error::type_error(v9, a4);
      case 3:
        v11 = (nlohmann::detail::out_of_range *)__cxa_allocate_exception(0x20uLL);
        v12 = nlohmann::detail::out_of_range::out_of_range(v11, a4);
      case 4:
        v13 = (nlohmann::detail::other_error *)__cxa_allocate_exception(0x20uLL);
        v14 = nlohmann::detail::other_error::other_error(v13, a4);
      default:
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error();
    }
  }
  return 0;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  unsigned __int8 *v3;
  unsigned __int8 *i;
  unsigned int v5;
  char __str[8];
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v3 = *(unsigned __int8 **)(a1 + 48);
  for (i = *(unsigned __int8 **)(a1 + 56); v3 != i; ++v3)
  {
    v5 = *v3;
    if (v5 > 0x1F)
    {
      std::string::push_back(a2, v5);
    }
    else
    {
      v7 = 0;
      *(_QWORD *)__str = 0;
      snprintf(__str, 9uLL, "<U+%.4X>", v5);
      std::string::append(a2, __str);
    }
  }
}

void sub_1A4D09CAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::create(int a1@<W0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, nlohmann::detail::exception *a4@<X8>)
{
  std::string *v8;
  __int128 v9;
  std::string *p_p;
  std::string::size_type size;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  __int128 v15;
  int v16;
  const std::string::value_type *v17;
  std::string::size_type v18;
  std::string *v19;
  __int128 v20;
  uint64_t v21;
  const char *v22;
  std::string __p;
  void *v24;
  char v25;
  std::string v26;
  std::string v27;
  std::string v28;
  std::string v29;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  memset(v30, 170, sizeof(v30));
  std::string::basic_string[abi:ne180100]<0>(&v24, "parse_error");
  nlohmann::detail::exception::name(a1, &v26);
  v8 = std::string::append(&v26, "parse error");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  nlohmann::detail::parse_error::position_string((uint64_t)a2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v12 = std::string::append(&v27, (const std::string::value_type *)p_p, size);
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v14 = std::string::append(&v28, ": ");
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = *(char *)(a3 + 23);
  if (v16 >= 0)
    v17 = (const std::string::value_type *)a3;
  else
    v17 = *(const std::string::value_type **)a3;
  if (v16 >= 0)
    v18 = *(unsigned __int8 *)(a3 + 23);
  else
    v18 = *(_QWORD *)(a3 + 8);
  v19 = std::string::append(&v29, v17, v18);
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  *(_QWORD *)&v30[16] = *((_QWORD *)&v19->__r_.__value_.__l + 2);
  *(_OWORD *)v30 = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (v25 < 0)
    operator delete(v24);
  v21 = *a2;
  if (v30[23] >= 0)
    v22 = v30;
  else
    v22 = *(const char **)v30;
  nlohmann::detail::exception::exception(a4, a1, v22);
  *(_QWORD *)a4 = &off_1E4DEB900;
  *((_QWORD *)a4 + 4) = v21;
  if ((v30[23] & 0x80000000) != 0)
    operator delete(*(void **)v30);
}

void sub_1A4D09EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v40;

  if (*(char *)(v40 - 57) < 0)
    operator delete(*(void **)(v40 - 80));
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v8;
  std::string *v9;
  __int128 v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  unsigned int v13;
  std::string *v14;
  __int128 v15;
  std::string *p_p;
  std::string::size_type size;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  void *v24;
  char *v25;
  std::string *v26;
  __int128 v27;
  const std::string::value_type *v28;
  std::string::size_type v29;
  char *v30;
  std::string *v31;
  __int128 v32;
  const std::string::value_type *v33;
  std::string::size_type v34;
  std::string __p;
  std::string v36;
  std::string v37;
  std::string v38;
  __int128 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  memset(a4, 170, sizeof(std::string));
  std::string::basic_string[abi:ne180100]<0>(a4, "syntax error ");
  v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a3 + 8);
  if (v8)
  {
    std::operator+<char>();
    v9 = std::string::append(&v38, " ");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v40 = v9->__r_.__value_.__r.__words[2];
    v39 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v11 = (const std::string::value_type *)&v39;
    else
      v11 = (const std::string::value_type *)v39;
    if (v40 >= 0)
      v12 = HIBYTE(v40);
    else
      v12 = *((_QWORD *)&v39 + 1);
    std::string::append(a4, v11, v12);
    if (SHIBYTE(v40) < 0)
      operator delete((void *)v39);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
  }
  std::string::append(a4, "- ");
  v13 = *(_DWORD *)(a1 + 32);
  if (v13 == 14)
  {
    std::string::basic_string[abi:ne180100]<0>(&v36, *(char **)(a1 + 136));
    v14 = std::string::append(&v36, "; last read: '");
    v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    v18 = std::string::append(&v37, (const std::string::value_type *)p_p, size);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    v20 = std::string::append(&v38, "'");
    v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v40 = v20->__r_.__value_.__r.__words[2];
    v39 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v22 = (const std::string::value_type *)&v39;
    else
      v22 = (const std::string::value_type *)v39;
    if (v40 >= 0)
      v23 = HIBYTE(v40);
    else
      v23 = *((_QWORD *)&v39 + 1);
    std::string::append(a4, v22, v23);
    if (SHIBYTE(v40) < 0)
      operator delete((void *)v39);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      v24 = (void *)v36.__r_.__value_.__r.__words[0];
      goto LABEL_49;
    }
LABEL_46:
    if (!a2)
      return;
    goto LABEL_50;
  }
  v25 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(v13);
  std::string::basic_string[abi:ne180100]<0>(&v38, v25);
  v26 = std::string::insert(&v38, 0, "unexpected ");
  v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v40 = v26->__r_.__value_.__r.__words[2];
  v39 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0)
    v28 = (const std::string::value_type *)&v39;
  else
    v28 = (const std::string::value_type *)v39;
  if (v40 >= 0)
    v29 = HIBYTE(v40);
  else
    v29 = *((_QWORD *)&v39 + 1);
  std::string::append(a4, v28, v29);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_46;
  v24 = (void *)v38.__r_.__value_.__r.__words[0];
LABEL_49:
  operator delete(v24);
  if (!a2)
    return;
LABEL_50:
  v30 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(a2);
  std::string::basic_string[abi:ne180100]<0>(&v38, v30);
  v31 = std::string::insert(&v38, 0, "; expected ");
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v40 = v31->__r_.__value_.__r.__words[2];
  v39 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0)
    v33 = (const std::string::value_type *)&v39;
  else
    v33 = (const std::string::value_type *)v39;
  if (v40 >= 0)
    v34 = HIBYTE(v40);
  else
    v34 = *((_QWORD *)&v39 + 1);
  std::string::append(a4, v33, v34);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
}

void sub_1A4D0A2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  uint64_t v34;

  if (*(char *)(v34 - 41) < 0)
    operator delete(*(void **)(v34 - 64));
  if (a33 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  if (*(char *)(v33 + 23) < 0)
    operator delete(*(void **)v33);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::~parse_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  std::exception_vtbl *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t **v14;
  int v15;
  int v16;
  uint64_t **v17;
  int v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  std::string *v30;
  __int128 v31;
  std::string *v32;
  __int128 v33;
  std::string v34;
  std::string __p;
  void *v36[2];
  std::string::size_type v37;
  std::exception v38;
  _BYTE v39[24];
  std::string v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v5 = (std::exception_vtbl *)(a1 + 112);
  v6 = a1 + 40;
  while (2)
  {
    switch(*(_DWORD *)(a1 + 32))
    {
      case 1:
        LOBYTE(v38.__vftable) = 1;
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v38, a3);
        goto LABEL_17;
      case 2:
        LOBYTE(v38.__vftable) = 0;
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v38, a3);
        goto LABEL_17;
      case 3:
        v38.__vftable = 0;
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(a2, (uint64_t)&v38, a3);
        goto LABEL_17;
      case 4:
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(a2, (uint64_t)v5, a3);
        goto LABEL_17;
      case 5:
        v38.__vftable = *(std::exception_vtbl **)(a1 + 152);
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(a2, (uint64_t *)&v38, a3);
        goto LABEL_17;
      case 6:
        v38.__vftable = *(std::exception_vtbl **)(a1 + 144);
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(a2, (uint64_t *)&v38, a3);
        goto LABEL_17;
      case 7:
        if ((*(_QWORD *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
        {
          v38.__vftable = *(std::exception_vtbl **)(a1 + 160);
          nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(a2, (uint64_t *)&v38, a3);
          goto LABEL_17;
        }
        v29 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v34);
        v30 = std::string::insert(&v34, 0, "number overflow parsing '");
        v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v31;
        v30->__r_.__value_.__l.__size_ = 0;
        v30->__r_.__value_.__r.__words[2] = 0;
        v30->__r_.__value_.__r.__words[0] = 0;
        v32 = std::string::append(&__p, "'");
        v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        v37 = v32->__r_.__value_.__r.__words[2];
        *(_OWORD *)v36 = v33;
        v32->__r_.__value_.__l.__size_ = 0;
        v32->__r_.__value_.__r.__words[2] = 0;
        v32->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(406, (uint64_t)v36, (nlohmann::detail::exception *)&v38);
        v19 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v29, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
        v38.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
        MEMORY[0x1A85A6FD8](v39);
        std::exception::~exception(&v38);
        if (SHIBYTE(v37) < 0)
          operator delete(v36[0]);
        goto LABEL_43;
      case 8:
        if (!nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(a2, 0xFFFFFFFFFFFFFFFFLL, a3))goto LABEL_55;
        v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
        *(_DWORD *)(a1 + 32) = v7;
        if (v7 == 10)
          goto LABEL_12;
        LOBYTE(v38.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&v41, &v38);
        continue;
      case 9:
        if ((nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(a2, 0xFFFFFFFFFFFFFFFFLL, a3) & 1) == 0)
        {
LABEL_55:
          v19 = 0;
          goto LABEL_37;
        }
        v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
        *(_DWORD *)(a1 + 32) = v8;
        if (v8 != 11)
        {
          if (v8 != 4)
            goto LABEL_51;
          v17 = *(uint64_t ***)(*(_QWORD *)(a2[2] - 8) + 8);
          v38.__vftable = v5;
          a2[4] = (uint64_t)(std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v17, (const void **)&v5->~exception, (uint64_t)&std::piecewise_construct, (__int128 **)&v38)+ 7);
          v18 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
          *(_DWORD *)(a1 + 32) = v18;
          if (v18 != 12)
            goto LABEL_54;
          LOBYTE(v38.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&v41, &v38);
          v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
LABEL_32:
          *(_DWORD *)(a1 + 32) = v16;
          continue;
        }
LABEL_12:
        a2[2] -= 8;
LABEL_17:
        v9 = v42;
        if (!v42)
        {
LABEL_36:
          v19 = 1;
          goto LABEL_37;
        }
        while (2)
        {
          if (((*(_QWORD *)&v41[((unint64_t)(v9 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v9 - 1)) & 1) != 0)
          {
            v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
            *(_DWORD *)(a1 + 32) = v10;
            if (v10 == 13)
              goto LABEL_31;
            if (v10 != 10)
            {
              v24 = *(_QWORD *)(a1 + 64);
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
              *(_OWORD *)v36 = *(_OWORD *)(a1 + 64);
              v37 = *(_QWORD *)(a1 + 80);
              std::string::basic_string[abi:ne180100]<0>(&v34, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xAu, (uint64_t)&v34, &__p);
              nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
              v22 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v24, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
              goto LABEL_42;
            }
            a2[2] -= 8;
            v11 = v42;
            if (!v42)
            {
              v25 = 383;
              goto LABEL_53;
            }
LABEL_26:
            v9 = v11 - 1;
            v42 = v9;
            if (!v9)
              goto LABEL_36;
            continue;
          }
          break;
        }
        v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
        *(_DWORD *)(a1 + 32) = v12;
        if (v12 != 13)
        {
          if (v12 != 11)
          {
            v26 = *(_QWORD *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
            *(_OWORD *)v36 = *(_OWORD *)(a1 + 64);
            v37 = *(_QWORD *)(a1 + 80);
            std::string::basic_string[abi:ne180100]<0>(&v34, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xBu, (uint64_t)&v34, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
            v22 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v26, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
            goto LABEL_42;
          }
          a2[2] -= 8;
          v11 = v42;
          if (!v42)
          {
            v25 = 439;
LABEL_53:
            __assert_rtn("sax_parse_internal", "parser.hpp", v25, "not states.empty()");
          }
          goto LABEL_26;
        }
        v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
        *(_DWORD *)(a1 + 32) = v13;
        if (v13 != 4)
        {
LABEL_51:
          v27 = *(_QWORD *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
          *(_OWORD *)v36 = *(_OWORD *)(a1 + 64);
          v37 = *(_QWORD *)(a1 + 80);
          std::string::basic_string[abi:ne180100]<0>(&v34, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 4u, (uint64_t)&v34, &__p);
          nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
          v22 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v27, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
          goto LABEL_42;
        }
        v14 = *(uint64_t ***)(*(_QWORD *)(a2[2] - 8) + 8);
        v38.__vftable = v5;
        a2[4] = (uint64_t)(std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v14, (const void **)&v5->~exception, (uint64_t)&std::piecewise_construct, (__int128 **)&v38)+ 7);
        v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
        *(_DWORD *)(a1 + 32) = v15;
        if (v15 == 12)
        {
LABEL_31:
          v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v6);
          goto LABEL_32;
        }
LABEL_54:
        v28 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
        *(_OWORD *)v36 = *(_OWORD *)(a1 + 64);
        v37 = *(_QWORD *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v34, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xCu, (uint64_t)&v34, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
        v22 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v28, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
LABEL_42:
        v19 = v22;
        v38.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
        MEMORY[0x1A85A6FD8](v39);
        std::exception::~exception(&v38);
LABEL_43:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v34.__r_.__value_.__l.__data_);
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v40.__r_.__value_.__l.__data_);
LABEL_37:
        if (v41)
          operator delete(v41);
        return v19;
      case 0xE:
        v21 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
        *(_OWORD *)v36 = *(_OWORD *)(a1 + 64);
        v37 = *(_QWORD *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v34, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0, (uint64_t)&v34, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
        v22 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v21, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
        goto LABEL_42;
      default:
        v23 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v6, &v40);
        *(_OWORD *)v36 = *(_OWORD *)(a1 + 64);
        v37 = *(_QWORD *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v34, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0x10u, (uint64_t)&v34, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
        v22 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v23, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
        goto LABEL_42;
    }
  }
}

void sub_1A4D0AC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,std::exception a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v40;
  uint64_t v41;
  void *v43;

  a30.__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](v40 + 16);
  std::exception::~exception(&a30);
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (a40 < 0)
    operator delete(a35);
  v43 = *(void **)(v41 - 112);
  if (v43)
    operator delete(v43);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error(uint64_t a1, uint64_t a2, uint64_t a3, const nlohmann::detail::parse_error *a4)
{
  nlohmann::detail::parse_error *exception;
  nlohmann::detail::parse_error *v6;
  nlohmann::detail::invalid_iterator *v7;
  nlohmann::detail::invalid_iterator *v8;
  nlohmann::detail::type_error *v9;
  nlohmann::detail::type_error *v10;
  nlohmann::detail::out_of_range *v11;
  nlohmann::detail::out_of_range *v12;
  nlohmann::detail::other_error *v13;
  nlohmann::detail::other_error *v14;

  *(_BYTE *)(a1 + 40) = 1;
  if (*(_BYTE *)(a1 + 41))
  {
    switch(~(100 * (*((_DWORD *)a4 + 2) / 100 / 100)) + *((_DWORD *)a4 + 2) / 100)
    {
      case 0:
        exception = (nlohmann::detail::parse_error *)__cxa_allocate_exception(0x28uLL);
        v6 = nlohmann::detail::parse_error::parse_error(exception, a4);
      case 1:
        v7 = (nlohmann::detail::invalid_iterator *)__cxa_allocate_exception(0x20uLL);
        v8 = nlohmann::detail::invalid_iterator::invalid_iterator(v7, a4);
      case 2:
        v9 = (nlohmann::detail::type_error *)__cxa_allocate_exception(0x20uLL);
        v10 = nlohmann::detail::type_error::type_error(v9, a4);
      case 3:
        v11 = (nlohmann::detail::out_of_range *)__cxa_allocate_exception(0x20uLL);
        v12 = nlohmann::detail::out_of_range::out_of_range(v11, a4);
      case 4:
        v13 = (nlohmann::detail::other_error *)__cxa_allocate_exception(0x20uLL);
        v14 = nlohmann::detail::other_error::other_error(v13, a4);
      default:
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error();
    }
  }
  return 0;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::json_sax_dom_callback_parser(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  v6 = a1 + 32;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_BYTE *)(a1 + 88) = 0;
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100](a1 + 96, a3);
  *(_BYTE *)(a1 + 136) = 9;
  *(_BYTE *)(a1 + 128) = a4;
  *(_QWORD *)(a1 + 144) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1 + 136);
  v8 = 1;
  std::vector<BOOL>::push_back(v6, &v8);
  return a1;
}

void sub_1A4D0AFDC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  _QWORD *v3;
  uint64_t **v4;
  void **v5;
  _QWORD *v6;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = v3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v4);
  v8 = (_QWORD *)v1[15];
  if (v8 == v6)
  {
    v9 = v6;
    v10 = 4;
  }
  else
  {
    if (!v8)
      goto LABEL_6;
    v10 = 5;
    v9 = (_QWORD *)v1[15];
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  v11 = (void *)v1[7];
  if (v11)
    operator delete(v11);
  if (*v2)
    operator delete(*v2);
  v12 = *v5;
  if (*v5)
  {
    v1[2] = v12;
    operator delete(v12);
  }
  _Unwind_Resume(a1);
}

void std::vector<BOOL>::push_back(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    std::vector<BOOL>::reserve((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  __int128 v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v6 = 0;
    v7 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v6, a2);
    v3 = (unint64_t)a1[1];
    v10 = *a1;
    v11 = 0;
    v8 = &v10[8 * (v3 >> 6)];
    v9 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v6, (uint64_t)&v10, (uint64_t)&v8, v3);
    v4 = *a1;
    *a1 = v6;
    v6 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v7;
    v7 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_1A4D0B1C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  __int128 v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  v6 = *((_DWORD *)a1 + 2);
  v7 = *a2;
  v8 = *((_DWORD *)a2 + 2);
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v9;
  v21 = v9;
  v18 = v5;
  v19 = v6;
  v16 = v7;
  v17 = v8;
  v10 = *((_DWORD *)a3 + 2);
  v14 = *a3;
  v15 = v10;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v18, (uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v20);
  v11 = DWORD2(v20);
  v12 = v21;
  v13 = DWORD2(v21);
  *(_QWORD *)a4 = v20;
  *(_DWORD *)(a4 + 8) = v11;
  *(_QWORD *)(a4 + 16) = v12;
  *(_DWORD *)(a4 + 24) = v13;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(uint64_t *a1, unint64_t a2)
{
  _QWORD **v4;
  char **v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  nlohmann::detail::exception *exception;
  std::string *v26;
  __int128 v27;
  std::string v28;
  __int128 v29;
  std::string::size_type v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD **)(a1 + 2);
  v5 = (char **)(a1 + 1);
  v31 = std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 0);
  std::vector<BOOL>::push_back((uint64_t)(v4 + 2), &v31);
  LOBYTE(v29) = 1;
  nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v29, 1);
  v7 = v6;
  v8 = *v4;
  v9 = a1[3];
  if ((unint64_t)v8 >= v9)
  {
    v11 = ((char *)v8 - *v5) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v12 = v9 - (_QWORD)*v5;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = v7;
    v10 = v16 + 8;
    v19 = (char *)a1[1];
    v18 = (char *)a1[2];
    if (v18 != v19)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = *v5;
    }
    a1[1] = (uint64_t)v16;
    a1[2] = (uint64_t)v10;
    a1[3] = (uint64_t)v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v8 = v6;
    v10 = v8 + 1;
  }
  a1[2] = (uint64_t)v10;
  if (a2 != -1)
  {
    v21 = (char *)*(v10 - 1);
    if (v21)
    {
      v22 = *v21;
      if (v22 > 2)
        v23 = 1;
      else
        v23 = qword_1A4D1BB28[v22];
      if (v23 < a2)
      {
        exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::to_string(&v28, a2);
        v26 = std::string::insert(&v28, 0, "excessive object size: ");
        v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        v30 = v26->__r_.__value_.__r.__words[2];
        v29 = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(408, (uint64_t)&v29, exception);
      }
    }
  }
  return 1;
}

void sub_1A4D0B6B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  unsigned __int8 *v16;
  unsigned __int8 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  _BYTE v24[40];
  _BYTE v25[8];
  uint64_t *v26[2];

  v26[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v2 = a1[2];
  if (*(_QWORD *)(v2 - 8)
    && (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), ((unint64_t)(v2 - a1[1]) >> 3) - 1, 1) & 1) == 0)
  {
    v3 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v25, (uint64_t)(a1 + 17));
    v4 = *(_QWORD *)(a1[2] - 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
    v5 = *(_BYTE *)v4;
    *(_BYTE *)v4 = v25[0];
    v25[0] = v5;
    v6 = *(uint64_t **)(v4 + 8);
    *(uint64_t **)(v4 + 8) = v26[0];
    v26[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v26, v25[0]);
  }
  v8 = a1[1];
  v7 = a1[2];
  if (v8 == v7)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object();
  v9 = a1[5];
  if (!v9)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object();
  a1[2] = v7 - 8;
  a1[5] = v9 - 1;
  if (v8 != v7 - 8)
  {
    v10 = *(unsigned __int8 **)(v7 - 16);
    if (v10)
    {
      if (*v10 - 1 <= 1)
      {
        *(_QWORD *)&v24[32] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)v24 = v11;
        *(_OWORD *)&v24[16] = v11;
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v24, (uint64_t)v10);
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v24);
        v12 = *(_QWORD *)(a1[2] - 8);
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v21 = v13;
        v22 = v13;
        v23 = 0xAAAAAAAAAAAAAAAALL;
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(&v21, v12);
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)&v21);
        if (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)v24, (unsigned __int8 **)&v21))
        {
          while (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->((unsigned __int8 **)v24) != 9)
          {
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++((unsigned __int8 **)v24);
            v14 = *(_QWORD *)(a1[2] - 8);
            *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v21 = v15;
            v22 = v15;
            v23 = 0xAAAAAAAAAAAAAAAALL;
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(&v21, v14);
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)&v21);
            if (nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)v24, (unsigned __int8 **)&v21))
            {
              return 1;
            }
          }
          v16 = *(unsigned __int8 **)(a1[2] - 8);
          v18 = *(unsigned __int8 **)v24;
          v19 = *(_OWORD *)&v24[8];
          v20 = *(_OWORD *)&v24[24];
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::erase<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(v16, &v18, (uint64_t)&v21);
        }
      }
    }
  }
  return 1;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::key(_QWORD *a1, __int128 *a2)
{
  uint64_t **v4;
  uint64_t *v5;
  char v6;
  uint64_t *v7;
  _BYTE v9[8];
  uint64_t *v10;
  char v11;
  unint64_t v12;
  uint64_t *v13;
  __int128 *v14[2];

  v14[1] = *(__int128 **)MEMORY[0x1E0C80C00];
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v13 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)&v12, (uint64_t)a2);
  v11 = std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (a1[2] - a1[1]) >> 3, 4);
  std::vector<BOOL>::push_back((uint64_t)(a1 + 7), &v11);
  if (v11 && *(_QWORD *)(a1[2] - 8))
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v9, (uint64_t)(a1 + 17));
    v4 = *(uint64_t ***)(*(_QWORD *)(a1[2] - 8) + 8);
    v14[0] = a2;
    v5 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (const void **)a2, (uint64_t)&std::piecewise_construct, v14);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v9);
    v6 = *((_BYTE *)v5 + 56);
    v5 += 7;
    *(_BYTE *)v5 = v9[0];
    v9[0] = v6;
    v7 = (uint64_t *)v5[1];
    v5[1] = (uint64_t)v10;
    v10 = v7;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v5);
    a1[10] = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9[0]);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v12);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v13, v12);
  return 1;
}

void sub_1A4D0BA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a12);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(uint64_t *a1, unint64_t a2)
{
  _QWORD **v4;
  char **v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  nlohmann::detail::exception *exception;
  std::string *v26;
  __int128 v27;
  std::string v28;
  __int128 v29;
  std::string::size_type v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD **)(a1 + 2);
  v5 = (char **)(a1 + 1);
  v31 = std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 2);
  std::vector<BOOL>::push_back((uint64_t)(v4 + 2), &v31);
  LOBYTE(v29) = 2;
  nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v29, 1);
  v7 = v6;
  v8 = *v4;
  v9 = a1[3];
  if ((unint64_t)v8 >= v9)
  {
    v11 = ((char *)v8 - *v5) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v12 = v9 - (_QWORD)*v5;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = v7;
    v10 = v16 + 8;
    v19 = (char *)a1[1];
    v18 = (char *)a1[2];
    if (v18 != v19)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = *v5;
    }
    a1[1] = (uint64_t)v16;
    a1[2] = (uint64_t)v10;
    a1[3] = (uint64_t)v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v8 = v6;
    v10 = v8 + 1;
  }
  a1[2] = (uint64_t)v10;
  if (a2 != -1)
  {
    v21 = (char *)*(v10 - 1);
    if (v21)
    {
      v22 = *v21;
      if (v22 > 2)
        v23 = 1;
      else
        v23 = qword_1A4D1BB28[v22];
      if (v23 < a2)
      {
        exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::to_string(&v28, a2);
        v26 = std::string::insert(&v28, 0, "excessive array size: ");
        v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        v30 = v26->__r_.__value_.__r.__words[2];
        v29 = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(408, (uint64_t)&v29, exception);
      }
    }
  }
  return 1;
}

void sub_1A4D0BCC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array(_QWORD *a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[8];
  uint64_t *v13[2];

  v13[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v2 = a1[2];
  if (*(_QWORD *)(v2 - 8)
    && (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), ((unint64_t)(v2 - a1[1]) >> 3) - 1, 3) & 1) == 0)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v12, (uint64_t)(a1 + 17));
    v4 = *(_QWORD *)(a1[2] - 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
    v5 = *(_BYTE *)v4;
    *(_BYTE *)v4 = v12[0];
    v12[0] = v5;
    v6 = *(uint64_t **)(v4 + 8);
    *(uint64_t **)(v4 + 8) = v13[0];
    v13[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v13, v12[0]);
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v8 = a1[1];
  v7 = a1[2];
  if (v8 == v7)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array();
  v9 = a1[5];
  if (!v9)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array();
  a1[2] = v7 - 8;
  a1[5] = v9 - 1;
  if (v8 == v7 - 8)
    v3 = 1;
  if ((v3 & 1) == 0)
  {
    v10 = *(_QWORD *)(v7 - 16);
    if (*(_BYTE *)v10 == 2)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](*(_QWORD *)(v10 + 8), *(_QWORD *)(*(_QWORD *)(v10 + 8) + 8) - 16);
  }
  return 1;
}

void nlohmann::detail::out_of_range::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(&__p, "out_of_range");
  nlohmann::detail::exception::name(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(_QWORD *)a3 = &off_1E4DEB928;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_1A4D0BF9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::out_of_range::~out_of_range(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&off_1E4DEB9A8;
  MEMORY[0x1A85A6FD8](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

uint64_t std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()(uint64_t a1, int a2, char a3)
{
  uint64_t v3;
  char v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v5 = a3;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, char *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(uint64_t *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  const char *v24;
  int v25;
  _BYTE v26[8];
  uint64_t *v27;
  _BYTE v28[8];
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31[2];

  v31[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v30 = 0xAAAAAAAAAAAAAAAALL;
    v31[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    v6 = *a2;
    LOBYTE(v30) = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v31, v6);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v15 = *(_BYTE *)v14;
        *(_BYTE *)v14 = v28[0];
        v28[0] = v15;
        v16 = *(uint64_t **)(v14 + 8);
        *(_QWORD *)(v14 + 8) = v29;
        v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        v13 = 1;
        goto LABEL_21;
      }
      v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        v9 = *v8;
        if (v9 == 2)
        {
          v10 = (uint64_t *)*((_QWORD *)v8 + 1);
          v11 = v10[1];
          if (v11 >= v10[2])
          {
            v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(_BYTE *)v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          v17 = a1[8];
          if (v17)
          {
            v18 = v17 - 1;
            v19 = *(_QWORD *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if (((v19 >> v18) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v26[0] = v30;
              v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v21 = *(_BYTE *)v20;
              *(_BYTE *)v20 = v26[0];
              v26[0] = v21;
              v22 = *(uint64_t **)(v20 + 8);
              *(_QWORD *)(v20 + 8) = v27;
              v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v24 = "not key_keep_stack.empty()";
          v25 = 615;
        }
        else
        {
          v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A4D0C3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A85A70E0);
}

unsigned __int8 *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->(unsigned __int8 **a1)
{
  unsigned __int8 *result;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  nlohmann::detail::exception *exception;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  result = *a1;
  if (!result)
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->();
  v3 = *result;
  if (v3 == 2)
  {
    v5 = *(unsigned __int8 **)(*((_QWORD *)result + 1) + 8);
    result = a1[2];
    if (result == v5)
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->();
  }
  else if (v3 == 1)
  {
    v4 = a1[1];
    if (v4 == (unsigned __int8 *)(*((_QWORD *)result + 1) + 8))
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->();
    return v4 + 56;
  }
  else if (a1[4])
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v7, "cannot get value");
    nlohmann::detail::invalid_iterator::create(214, (uint64_t)v7, exception);
  }
  return result;
}

void sub_1A4D0C538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  int v15;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

void nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::erase<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(unsigned __int8 *a1@<X0>, unsigned __int8 **a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v6;
  unsigned __int8 **v7;
  int v8;
  void **v9;
  void **v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t *v18;
  nlohmann::detail::exception *exception;
  nlohmann::detail::exception *v20;
  nlohmann::detail::exception *v21;
  char *v22;
  std::string *v23;
  __int128 v24;
  std::string v25;
  __int128 v26;
  std::string::size_type v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*a2 != a1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v26, "iterator does not fit current value");
    nlohmann::detail::invalid_iterator::create(202, (uint64_t)&v26, exception);
  }
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  v7 = (unsigned __int8 **)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl((_QWORD *)a3, (uint64_t)a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(v7);
  v8 = *a1;
  if ((v8 - 3) < 6)
  {
    if (a2[4])
    {
      v20 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v26, "iterator out of range");
      nlohmann::detail::invalid_iterator::create(205, (uint64_t)&v26, v20);
    }
    if (v8 == 8)
    {
      v10 = (void **)(a1 + 8);
      v9 = (void **)*((_QWORD *)a1 + 1);
      v15 = *v9;
      if (*v9)
      {
        v9[1] = v15;
        v11 = v15;
        goto LABEL_13;
      }
    }
    else
    {
      if (v8 != 3)
      {
LABEL_15:
        *a1 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        return;
      }
      v10 = (void **)(a1 + 8);
      v9 = (void **)*((_QWORD *)a1 + 1);
      if (*((char *)v9 + 23) < 0)
      {
        v11 = *v9;
LABEL_13:
        operator delete(v11);
        v9 = (void **)*v10;
      }
    }
    operator delete(v9);
    *v10 = 0;
    goto LABEL_15;
  }
  if (v8 == 1)
  {
    v16 = (uint64_t **)*((_QWORD *)a1 + 1);
    v17 = (uint64_t *)a2[1];
    v18 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__remove_node_pointer(v16, v17);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)(v17 + 4));
    operator delete(v17);
    *(_QWORD *)(a3 + 8) = v18;
  }
  else
  {
    if (v8 != 2)
    {
      v21 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v22 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v25, v22);
      v23 = std::string::insert(&v25, 0, "cannot use erase() with ");
      v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v27 = v23->__r_.__value_.__r.__words[2];
      v26 = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(307, (uint64_t)&v26, v21);
    }
    v12 = *((_QWORD *)a1 + 1);
    v13 = (uint64_t)a2[2];
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>((uint64_t)&v26, v13 + 16, *(_QWORD *)(v12 + 8), v13);
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](v12, v14);
    *(_QWORD *)(a3 + 16) = v13;
  }
}

void sub_1A4D0C824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  char v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if ((v22 & 1) != 0)
    __cxa_free_exception(v21);
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t *v8;
  char v10[8];
  uint64_t *v11[2];

  v5 = a2;
  v11[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  if (a2 == a3)
    return a2;
  v6 = a3;
  do
  {
    v10[0] = *(_BYTE *)v5;
    v11[0] = *(uint64_t **)(v5 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
    *(_BYTE *)v5 = 0;
    *(_QWORD *)(v5 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    v7 = *(_BYTE *)a4;
    *(_BYTE *)a4 = v10[0];
    v10[0] = v7;
    v8 = *(uint64_t **)(a4 + 8);
    *(uint64_t **)(a4 + 8) = v11[0];
    v11[0] = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v11, v10[0]);
    a4 += 16;
    v5 += 16;
  }
  while (v5 != v6);
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11[4];

  v11[3] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v10 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    memset(v11, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, v11);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v10, v8, v11[0]);
    v7 = v11[0];
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v7;
}

std::string *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  memset(a3, 170, 24);
  v6 = (char *)operator new(0x48uLL);
  *a3 = v6;
  a3[1] = v5;
  *((_BYTE *)a3 + 16) = 0;
  result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<std::string const&>((std::string *)(v6 + 32), *a2);
  *((_BYTE *)a3 + 16) = 1;
  return result;
}

void sub_1A4D0CED8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<std::string const&>(std::string *this, __int128 *a2)
{
  __int128 v3;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  this[1].__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&this[1]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&this[1]);
  return this;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(uint64_t *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  const char *v24;
  int v25;
  _BYTE v26[8];
  uint64_t *v27;
  _BYTE v28[8];
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31[2];

  v31[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v30 = 0xAAAAAAAAAAAAAAAALL;
    v6 = *a2;
    LOBYTE(v30) = 7;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v15 = *(_BYTE *)v14;
        *(_BYTE *)v14 = v28[0];
        v28[0] = v15;
        v16 = *(uint64_t **)(v14 + 8);
        *(_QWORD *)(v14 + 8) = v29;
        v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        v13 = 1;
        goto LABEL_21;
      }
      v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        v9 = *v8;
        if (v9 == 2)
        {
          v10 = (uint64_t *)*((_QWORD *)v8 + 1);
          v11 = v10[1];
          if (v11 >= v10[2])
          {
            v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(_BYTE *)v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          v17 = a1[8];
          if (v17)
          {
            v18 = v17 - 1;
            v19 = *(_QWORD *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if (((v19 >> v18) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v26[0] = v30;
              v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v21 = *(_BYTE *)v20;
              *(_BYTE *)v20 = v26[0];
              v26[0] = v21;
              v22 = *(uint64_t **)(v20 + 8);
              *(_QWORD *)(v20 + 8) = v27;
              v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v24 = "not key_keep_stack.empty()";
          v25 = 615;
        }
        else
        {
          v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A4D0D2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(uint64_t *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  const char *v24;
  int v25;
  _BYTE v26[8];
  uint64_t *v27;
  _BYTE v28[8];
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31[2];

  v31[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v6 = (uint64_t *)*a2;
    v30 = 0xAAAAAAAAAAAAAA04;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v15 = *(_BYTE *)v14;
        *(_BYTE *)v14 = v28[0];
        v28[0] = v15;
        v16 = *(uint64_t **)(v14 + 8);
        *(_QWORD *)(v14 + 8) = v29;
        v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        v13 = 1;
        goto LABEL_21;
      }
      v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        v9 = *v8;
        if (v9 == 2)
        {
          v10 = (uint64_t *)*((_QWORD *)v8 + 1);
          v11 = v10[1];
          if (v11 >= v10[2])
          {
            v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(_BYTE *)v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          v17 = a1[8];
          if (v17)
          {
            v18 = v17 - 1;
            v19 = *(_QWORD *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if (((v19 >> v18) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v26[0] = v30;
              v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v21 = *(_BYTE *)v20;
              *(_BYTE *)v20 = v26[0];
              v26[0] = v21;
              v22 = *(uint64_t **)(v20 + 8);
              *(_QWORD *)(v20 + 8) = v27;
              v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v24 = "not key_keep_stack.empty()";
          v25 = 615;
        }
        else
        {
          v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A4D0D608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  const char *v23;
  int v24;
  _BYTE v25[8];
  uint64_t *v26;
  _BYTE v27[8];
  uint64_t *v28;
  unint64_t v29;
  uint64_t *v30[2];

  v30[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v29 = 0xAAAAAAAAAAAAAA00;
    v30[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v6 = a1[2];
      if (a1[1] == v6)
      {
        v27[0] = v29;
        v28 = v30[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
        LOBYTE(v29) = 0;
        v30[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        v13 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        v14 = *(_BYTE *)v13;
        *(_BYTE *)v13 = v27[0];
        v27[0] = v14;
        v15 = *(uint64_t **)(v13 + 8);
        *(_QWORD *)(v13 + 8) = v28;
        v28 = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v13);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v28, v27[0]);
LABEL_20:
        v12 = 1;
        goto LABEL_21;
      }
      v7 = *(unsigned __int8 **)(v6 - 8);
      if (v7)
      {
        v8 = *v7;
        if (v8 == 2)
        {
          v9 = (uint64_t *)*((_QWORD *)v7 + 1);
          v10 = v9[1];
          if (v10 >= v9[2])
          {
            v11 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v9, (uint64_t)&v29);
          }
          else
          {
            *(_BYTE *)v10 = v29;
            *(uint64_t **)(v10 + 8) = v30[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
            LOBYTE(v29) = 0;
            v30[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
            v11 = v10 + 16;
          }
          v9[1] = v11;
          goto LABEL_20;
        }
        if (v8 == 1)
        {
          v16 = a1[8];
          if (v16)
          {
            v17 = v16 - 1;
            v18 = *(_QWORD *)(a1[7] + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v17;
            if (((v18 >> v17) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v25[0] = v29;
              v26 = v30[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
              LOBYTE(v29) = 0;
              v30[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              v19 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              v20 = *(_BYTE *)v19;
              *(_BYTE *)v19 = v25[0];
              v25[0] = v20;
              v21 = *(uint64_t **)(v19 + 8);
              *(_QWORD *)(v19 + 8) = v26;
              v26 = v21;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v19);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v26, v25[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v23 = "not key_keep_stack.empty()";
          v24 = 615;
        }
        else
        {
          v23 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v24 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v24, v23);
      }
    }
LABEL_17:
    v12 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v30, v29);
    return v12;
  }
  return 0;
}

void sub_1A4D0D944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(uint64_t *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  const char *v24;
  int v25;
  _BYTE v26[8];
  uint64_t *v27;
  _BYTE v28[8];
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31[2];

  v31[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v6 = *a2;
    v30 = 0xAAAAAAAAAAAAAA05;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v15 = *(_BYTE *)v14;
        *(_BYTE *)v14 = v28[0];
        v28[0] = v15;
        v16 = *(uint64_t **)(v14 + 8);
        *(_QWORD *)(v14 + 8) = v29;
        v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        v13 = 1;
        goto LABEL_21;
      }
      v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        v9 = *v8;
        if (v9 == 2)
        {
          v10 = (uint64_t *)*((_QWORD *)v8 + 1);
          v11 = v10[1];
          if (v11 >= v10[2])
          {
            v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(_BYTE *)v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          v17 = a1[8];
          if (v17)
          {
            v18 = v17 - 1;
            v19 = *(_QWORD *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if (((v19 >> v18) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v26[0] = v30;
              v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v21 = *(_BYTE *)v20;
              *(_BYTE *)v20 = v26[0];
              v26[0] = v21;
              v22 = *(uint64_t **)(v20 + 8);
              *(_QWORD *)(v20 + 8) = v27;
              v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v24 = "not key_keep_stack.empty()";
          v25 = 615;
        }
        else
        {
          v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A4D0DC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  const char *v23;
  int v24;
  _BYTE v25[8];
  uint64_t *v26;
  _BYTE v27[8];
  uint64_t *v28;
  unint64_t v29;
  uint64_t *v30[2];

  v30[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v29 = 0xAAAAAAAAAAAAAAAALL;
    v30[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)&v29, a2);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v6 = a1[2];
      if (a1[1] == v6)
      {
        v27[0] = v29;
        v28 = v30[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
        LOBYTE(v29) = 0;
        v30[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        v13 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        v14 = *(_BYTE *)v13;
        *(_BYTE *)v13 = v27[0];
        v27[0] = v14;
        v15 = *(uint64_t **)(v13 + 8);
        *(_QWORD *)(v13 + 8) = v28;
        v28 = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v13);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v28, v27[0]);
LABEL_20:
        v12 = 1;
        goto LABEL_21;
      }
      v7 = *(unsigned __int8 **)(v6 - 8);
      if (v7)
      {
        v8 = *v7;
        if (v8 == 2)
        {
          v9 = (uint64_t *)*((_QWORD *)v7 + 1);
          v10 = v9[1];
          if (v10 >= v9[2])
          {
            v11 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v9, (uint64_t)&v29);
          }
          else
          {
            *(_BYTE *)v10 = v29;
            *(uint64_t **)(v10 + 8) = v30[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
            LOBYTE(v29) = 0;
            v30[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
            v11 = v10 + 16;
          }
          v9[1] = v11;
          goto LABEL_20;
        }
        if (v8 == 1)
        {
          v16 = a1[8];
          if (v16)
          {
            v17 = v16 - 1;
            v18 = *(_QWORD *)(a1[7] + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v17;
            if (((v18 >> v17) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v25[0] = v29;
              v26 = v30[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
              LOBYTE(v29) = 0;
              v30[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              v19 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              v20 = *(_BYTE *)v19;
              *(_BYTE *)v19 = v25[0];
              v25[0] = v20;
              v21 = *(uint64_t **)(v19 + 8);
              *(_QWORD *)(v19 + 8) = v26;
              v26 = v21;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v19);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v26, v25[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v23 = "not key_keep_stack.empty()";
          v24 = 615;
        }
        else
        {
          v23 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v24 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v24, v23);
      }
    }
LABEL_17:
    v12 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v30, v29);
    return v12;
  }
  return 0;
}

void sub_1A4D0DFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(uint64_t *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v3;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  const char *v24;
  int v25;
  _BYTE v26[8];
  uint64_t *v27;
  _BYTE v28[8];
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31[2];

  v31[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v3 = a1[5];
  if (!v3)
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
  if (((*(_QWORD *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)) & 1) != 0)
  {
    v5 = a3;
    v6 = *a2;
    v30 = 0xAAAAAAAAAAAAAA06;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((v5 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        v15 = *(_BYTE *)v14;
        *(_BYTE *)v14 = v28[0];
        v28[0] = v15;
        v16 = *(uint64_t **)(v14 + 8);
        *(_QWORD *)(v14 + 8) = v29;
        v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        v13 = 1;
        goto LABEL_21;
      }
      v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        v9 = *v8;
        if (v9 == 2)
        {
          v10 = (uint64_t *)*((_QWORD *)v8 + 1);
          v11 = v10[1];
          if (v11 >= v10[2])
          {
            v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(_BYTE *)v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          v17 = a1[8];
          if (v17)
          {
            v18 = v17 - 1;
            v19 = *(_QWORD *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if (((v19 >> v18) & 1) != 0)
            {
              if (!a1[10])
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              v26[0] = v30;
              v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              v21 = *(_BYTE *)v20;
              *(_BYTE *)v20 = v26[0];
              v26[0] = v21;
              v22 = *(uint64_t **)(v20 + 8);
              *(_QWORD *)(v20 + 8) = v27;
              v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          v24 = "not key_keep_stack.empty()";
          v25 = 615;
        }
        else
        {
          v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A4D0E2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

nlohmann::detail::parse_error *nlohmann::detail::parse_error::parse_error(nlohmann::detail::parse_error *this, const nlohmann::detail::parse_error *a2)
{
  *(_QWORD *)this = &off_1E4DEB9A8;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1A85A6FCC]((char *)this + 16, (char *)a2 + 16);
  *(_QWORD *)this = &off_1E4DEB900;
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  return this;
}

nlohmann::detail::out_of_range *nlohmann::detail::out_of_range::out_of_range(nlohmann::detail::out_of_range *this, const nlohmann::detail::out_of_range *a2)
{
  *(_QWORD *)this = &off_1E4DEB9A8;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1A85A6FCC]((char *)this + 16, (char *)a2 + 16);
  *(_QWORD *)this = &off_1E4DEB928;
  return this;
}

nlohmann::detail::invalid_iterator *nlohmann::detail::invalid_iterator::invalid_iterator(nlohmann::detail::invalid_iterator *this, const nlohmann::detail::invalid_iterator *a2)
{
  *(_QWORD *)this = &off_1E4DEB9A8;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1A85A6FCC]((char *)this + 16, (char *)a2 + 16);
  *(_QWORD *)this = &off_1E4DEB950;
  return this;
}

nlohmann::detail::type_error *nlohmann::detail::type_error::type_error(nlohmann::detail::type_error *this, const nlohmann::detail::type_error *a2)
{
  *(_QWORD *)this = &off_1E4DEB9A8;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1A85A6FCC]((char *)this + 16, (char *)a2 + 16);
  *(_QWORD *)this = &off_1E4DEB8B0;
  return this;
}

nlohmann::detail::other_error *nlohmann::detail::other_error::other_error(nlohmann::detail::other_error *this, const nlohmann::detail::other_error *a2)
{
  *(_QWORD *)this = &off_1E4DEB9A8;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1A85A6FCC]((char *)this + 16, (char *)a2 + 16);
  *(_QWORD *)this = &off_1E4DEB8D8;
  return this;
}

void nlohmann::detail::parse_error::position_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *v6;
  __int128 v7;
  std::string *p_p;
  std::string::size_type size;
  std::string *v10;
  std::string __p;
  std::string v12;
  std::string v13;
  std::string v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::to_string(&v12, *(_QWORD *)(a1 + 16) + 1);
  v4 = std::string::insert(&v12, 0, " at line ");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = std::string::append(&v13, ", column ");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, *(_QWORD *)(a1 + 8));
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v10 = std::string::append(&v14, (const std::string::value_type *)p_p, size);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_1A4D0E624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v26 - 25) < 0)
    operator delete(*(void **)(v26 - 48));
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

const char *nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(unsigned int a1)
{
  if (a1 > 0x10)
    return "unknown token";
  else
    return off_1E4DEBDF8[a1];
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~json_sax_dom_callback_parser(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1 + 136);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a1 + 144), *(unsigned __int8 *)(a1 + 136));
  v2 = *(_QWORD **)(a1 + 120);
  if (v2 == (_QWORD *)(a1 + 96))
  {
    v3 = 4;
    v2 = (_QWORD *)(a1 + 96);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  v4 = *(void **)(a1 + 56);
  if (v4)
    operator delete(v4);
  v5 = *(void **)(a1 + 32);
  if (v5)
    operator delete(v5);
  v6 = *(void **)(a1 + 8);
  if (v6)
  {
    *(_QWORD *)(a1 + 16) = v6;
    operator delete(v6);
  }
  return a1;
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  nlohmann::detail::exception *exception;
  std::string *v24;
  __int128 v25;
  std::string v26;
  __int128 v27;
  std::string::size_type v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  LOBYTE(v27) = 1;
  v5 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v27, a3);
  v6 = a1[3];
  v7 = (uint64_t *)a1[2];
  if ((unint64_t)v7 >= v6)
  {
    v9 = a1[1];
    v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v11 = v6 - v9;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v13);
    else
      v14 = 0;
    v15 = (uint64_t *)&v14[8 * v10];
    v16 = &v14[8 * v13];
    *v15 = v5;
    v8 = v15 + 1;
    v18 = (char *)a1[1];
    v17 = (char *)a1[2];
    if (v17 != v18)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *--v15 = v19;
      }
      while (v17 != v18);
      v17 = (char *)a1[1];
    }
    a1[1] = (uint64_t)v15;
    a1[2] = (uint64_t)v8;
    a1[3] = (uint64_t)v16;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v7 = v5;
    v8 = v7 + 1;
  }
  a1[2] = (uint64_t)v8;
  if (a2 != -1)
  {
    v20 = *(char *)*(v8 - 1);
    if (v20 > 2)
      v21 = 1;
    else
      v21 = qword_1A4D1BB28[v20];
    if (v21 < a2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::to_string(&v26, a2);
      v24 = std::string::insert(&v26, 0, "excessive object size: ");
      v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v28 = v24->__r_.__value_.__r.__words[2];
      v27 = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::out_of_range::create(408, (uint64_t)&v27, exception);
    }
  }
  return 1;
}

void sub_1A4D0E920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  nlohmann::detail::exception *exception;
  std::string *v24;
  __int128 v25;
  std::string v26;
  __int128 v27;
  std::string::size_type v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  LOBYTE(v27) = 2;
  v5 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v27, a3);
  v6 = a1[3];
  v7 = (uint64_t *)a1[2];
  if ((unint64_t)v7 >= v6)
  {
    v9 = a1[1];
    v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v11 = v6 - v9;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v13);
    else
      v14 = 0;
    v15 = (uint64_t *)&v14[8 * v10];
    v16 = &v14[8 * v13];
    *v15 = v5;
    v8 = v15 + 1;
    v18 = (char *)a1[1];
    v17 = (char *)a1[2];
    if (v17 != v18)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *--v15 = v19;
      }
      while (v17 != v18);
      v17 = (char *)a1[1];
    }
    a1[1] = (uint64_t)v15;
    a1[2] = (uint64_t)v8;
    a1[3] = (uint64_t)v16;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v7 = v5;
    v8 = v7 + 1;
  }
  a1[2] = (uint64_t)v8;
  if (a2 != -1)
  {
    v20 = *(char *)*(v8 - 1);
    if (v20 > 2)
      v21 = 1;
    else
      v21 = qword_1A4D1BB28[v20];
    if (v21 < a2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::to_string(&v26, a2);
      v24 = std::string::insert(&v26, 0, "excessive array size: ");
      v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v28 = v24->__r_.__value_.__r.__words[2];
      v27 = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::out_of_range::create(408, (uint64_t)&v27, exception);
    }
  }
  return 1;
}

void sub_1A4D0EB68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(uint64_t *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t *v13;
  int v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t *v18;
  char v19[8];
  uint64_t *v20;
  char v21[8];
  uint64_t *v22[2];

  v22[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    v10 = *a2;
    v21[0] = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v22, v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    v11 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    v12 = *(_BYTE *)v11;
    *(_BYTE *)v11 = v21[0];
    v21[0] = v12;
    v13 = *(uint64_t **)(v11 + 8);
    *(uint64_t **)(v11 + 8) = v22[0];
    v22[0] = v13;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v22, v21[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::detail::value_t>(v7, a2);
      }
      else
      {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__construct_one_at_end[abi:ne180100]<nlohmann::detail::value_t>((uint64_t)v7, a2);
        v9 = v8 + 16;
      }
      v7[1] = v9;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      v15 = *a2;
      v19[0] = v15;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(&v20, v15);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      v16 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      v17 = *(_BYTE *)v16;
      *(_BYTE *)v16 = v19[0];
      v19[0] = v17;
      v18 = *(uint64_t **)(v16 + 8);
      *(_QWORD *)(v16 + 8) = v20;
      v20 = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__construct_one_at_end[abi:ne180100]<nlohmann::detail::value_t>(uint64_t a1, unsigned __int8 *a2)
{
  _BYTE *v3;
  int v4;
  uint64_t result;

  v4 = *a2;
  v3 = *(_BYTE **)(a1 + 8);
  *v3 = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v3 + 8, v4);
  result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v3);
  *(_QWORD *)(a1 + 8) = v3 + 16;
  return result;
}

void sub_1A4D0EDB8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::detail::value_t>(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  int v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[16 * v9];
  v12 = *a2;
  *v11 = v12;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v11 + 8, v12);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v11);
  v16 += 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_1A4D0EED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t *v14;
  uint64_t *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t *v19;
  unsigned __int8 v20[8];
  uint64_t *v21;
  unsigned __int8 v22[8];
  uint64_t *v23[2];

  v23[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    v11 = (uint64_t *)*a2;
    v22[0] = 7;
    v23[0] = v11;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v12 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v13 = *(_BYTE *)v12;
    *(_BYTE *)v12 = v22[0];
    v22[0] = v13;
    v14 = *(uint64_t **)(v12 + 8);
    *(uint64_t **)(v12 + 8) = v23[0];
    v23[0] = v14;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v23, v22[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v10 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<double &>(v7, a2);
      }
      else
      {
        *(_QWORD *)(v8 + 8) = 0;
        v9 = *a2;
        *(_BYTE *)v8 = 7;
        *(_QWORD *)(v8 + 8) = v9;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        v10 = v8 + 16;
      }
      v7[1] = v10;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      v16 = (uint64_t *)*a2;
      v20[0] = 7;
      v21 = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v17 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v18 = *(_BYTE *)v17;
      *(_BYTE *)v17 = v20[0];
      v20[0] = v18;
      v19 = *(uint64_t **)(v17 + 8);
      *(_QWORD *)(v17 + 8) = v21;
      v21 = v19;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<double &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v16 = 0u;
  v17 = 0u;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  *(_QWORD *)&v16 = v10;
  *((_QWORD *)&v16 + 1) = v11;
  *((_QWORD *)&v17 + 1) = &v10[16 * v12];
  *(_QWORD *)(v11 + 8) = 0;
  v13 = *a2;
  *(_BYTE *)v11 = 7;
  *(_QWORD *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(_QWORD *)&v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A4D0F1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(uint64_t *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t *v14;
  uint64_t *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t *v19;
  unsigned __int8 v20[8];
  uint64_t *v21;
  unsigned __int8 v22[8];
  uint64_t *v23[2];

  v23[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    v11 = (uint64_t *)*a2;
    v22[0] = 4;
    v23[0] = v11;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v12 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v13 = *(_BYTE *)v12;
    *(_BYTE *)v12 = v22[0];
    v22[0] = v13;
    v14 = *(uint64_t **)(v12 + 8);
    *(uint64_t **)(v12 + 8) = v23[0];
    v23[0] = v14;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v23, v22[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v10 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<BOOL &>(v7, a2);
      }
      else
      {
        *(_QWORD *)(v8 + 8) = 0;
        v9 = *a2;
        *(_BYTE *)v8 = 4;
        *(_QWORD *)(v8 + 8) = v9;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        v10 = v8 + 16;
      }
      v7[1] = v10;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      v16 = (uint64_t *)*a2;
      v20[0] = 4;
      v21 = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v17 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v18 = *(_BYTE *)v17;
      *(_BYTE *)v17 = v20[0];
      v20[0] = v18;
      v19 = *(uint64_t **)(v17 + 8);
      *(_QWORD *)(v17 + 8) = v21;
      v21 = v19;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<BOOL &>(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v16 = 0u;
  v17 = 0u;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  *(_QWORD *)&v16 = v10;
  *((_QWORD *)&v16 + 1) = v11;
  *((_QWORD *)&v17 + 1) = &v10[16 * v12];
  *(_QWORD *)(v11 + 8) = 0;
  v13 = *a2;
  *(_BYTE *)v11 = 4;
  *(_QWORD *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(_QWORD *)&v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A4D0F4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t *v12;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t *v16;
  char v17[8];
  uint64_t *v18;
  char v19[8];
  uint64_t *v20[2];

  v20[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    v19[0] = 0;
    v20[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    v10 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    v11 = *(_BYTE *)v10;
    *(_BYTE *)v10 = v19[0];
    v19[0] = v11;
    v12 = *(uint64_t **)(v10 + 8);
    *(uint64_t **)(v10 + 8) = v20[0];
    v20[0] = v12;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v20, v19[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<decltype(nullptr)>(v7);
      }
      else
      {
        *(_BYTE *)v8 = 0;
        *(_QWORD *)(v8 + 8) = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        v9 = v8 + 16;
      }
      v7[1] = v9;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, a2, a3);
      v17[0] = 0;
      v18 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      v14 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      v15 = *(_BYTE *)v14;
      *(_BYTE *)v14 = v17[0];
      v17[0] = v15;
      v16 = *(uint64_t **)(v14 + 8);
      *(_QWORD *)(v14 + 8) = v18;
      v18 = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v18, v17[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<decltype(nullptr)>(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = (a1[1] - *a1) >> 4;
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v13 = 0u;
  v14 = 0u;
  v5 = (uint64_t)(a1 + 2);
  v6 = a1[2] - v2;
  if (v6 >> 3 > v4)
    v4 = v6 >> 3;
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF0)
    v7 = 0xFFFFFFFFFFFFFFFLL;
  else
    v7 = v4;
  v15 = a1 + 2;
  v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v5, v7);
  v9 = (uint64_t)&v8[16 * v3];
  *(_QWORD *)&v13 = v8;
  *((_QWORD *)&v13 + 1) = v9;
  *((_QWORD *)&v14 + 1) = &v8[16 * v10];
  *(_BYTE *)v9 = 0;
  *(_QWORD *)(v9 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  *(_QWORD *)&v14 = v9 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1A4D0F7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t *v14;
  uint64_t *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t *v19;
  unsigned __int8 v20[8];
  uint64_t *v21;
  unsigned __int8 v22[8];
  uint64_t *v23[2];

  v23[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    v11 = (uint64_t *)*a2;
    v22[0] = 5;
    v23[0] = v11;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v12 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v13 = *(_BYTE *)v12;
    *(_BYTE *)v12 = v22[0];
    v22[0] = v13;
    v14 = *(uint64_t **)(v12 + 8);
    *(uint64_t **)(v12 + 8) = v23[0];
    v23[0] = v14;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v23, v22[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v10 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<long long &>(v7, a2);
      }
      else
      {
        *(_QWORD *)(v8 + 8) = 0;
        v9 = *a2;
        *(_BYTE *)v8 = 5;
        *(_QWORD *)(v8 + 8) = v9;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        v10 = v8 + 16;
      }
      v7[1] = v10;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      v16 = (uint64_t *)*a2;
      v20[0] = 5;
      v21 = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v17 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v18 = *(_BYTE *)v17;
      *(_BYTE *)v17 = v20[0];
      v20[0] = v18;
      v19 = *(uint64_t **)(v17 + 8);
      *(_QWORD *)(v17 + 8) = v21;
      v21 = v19;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<long long &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v16 = 0u;
  v17 = 0u;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  *(_QWORD *)&v16 = v10;
  *((_QWORD *)&v16 + 1) = v11;
  *((_QWORD *)&v17 + 1) = &v10[16 * v12];
  *(_QWORD *)(v11 + 8) = 0;
  v13 = *a2;
  *(_BYTE *)v11 = 5;
  *(_QWORD *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(_QWORD *)&v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A4D0FAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t *v12;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t *v16;
  char v17[8];
  uint64_t *v18;
  char v19[8];
  uint64_t *v20[2];

  v20[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v19, a2);
    v10 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    v11 = *(_BYTE *)v10;
    *(_BYTE *)v10 = v19[0];
    v19[0] = v11;
    v12 = *(uint64_t **)(v10 + 8);
    *(uint64_t **)(v10 + 8) = v20[0];
    v20[0] = v12;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v20, v19[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&>(v7, a2);
      }
      else
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>(v7[1], a2);
        v9 = v8 + 16;
        v7[1] = v8 + 16;
      }
      v7[1] = v9;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, a2, a3);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v17, a2);
      v14 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      v15 = *(_BYTE *)v14;
      *(_BYTE *)v14 = v17[0];
      v17[0] = v15;
      v16 = *(uint64_t **)(v14 + 8);
      *(_QWORD *)(v14 + 8) = v18;
      v18 = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v18, v17[0]);
      return a1[4];
    }
  }
}

void sub_1A4D0FC58(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[16 * v4];
  v16 = &v10[16 * v9];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v14, a2);
  v15 = v14 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1A4D0FD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t *v14;
  uint64_t *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t *v19;
  unsigned __int8 v20[8];
  uint64_t *v21;
  unsigned __int8 v22[8];
  uint64_t *v23[2];

  v23[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  v4 = a1[2];
  if (a1[1] == v4)
  {
    v11 = (uint64_t *)*a2;
    v22[0] = 6;
    v23[0] = v11;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v12 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    v13 = *(_BYTE *)v12;
    *(_BYTE *)v12 = v22[0];
    v22[0] = v13;
    v14 = *(uint64_t **)(v12 + 8);
    *(uint64_t **)(v12 + 8) = v23[0];
    v23[0] = v14;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v23, v22[0]);
    return *a1;
  }
  else
  {
    v5 = *(unsigned __int8 **)(v4 - 8);
    v6 = *v5;
    if (v6 == 2)
    {
      v7 = (uint64_t *)*((_QWORD *)v5 + 1);
      v8 = v7[1];
      if (v8 >= v7[2])
      {
        v10 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<unsigned long long &>(v7, a2);
      }
      else
      {
        *(_QWORD *)(v8 + 8) = 0;
        v9 = *a2;
        *(_BYTE *)v8 = 6;
        *(_QWORD *)(v8 + 8) = v9;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
        v10 = v8 + 16;
      }
      v7[1] = v10;
      return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v6 != 1)
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      if (!a1[4])
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>((uint64_t)a1, (uint64_t)a2, a3);
      v16 = (uint64_t *)*a2;
      v20[0] = 6;
      v21 = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v17 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      v18 = *(_BYTE *)v17;
      *(_BYTE *)v17 = v20[0];
      v20[0] = v18;
      v19 = *(uint64_t **)(v17 + 8);
      *(_QWORD *)(v17 + 8) = v21;
      v21 = v19;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v17);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<unsigned long long &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v16 = 0u;
  v17 = 0u;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  v11 = (uint64_t)&v10[16 * v4];
  *(_QWORD *)&v16 = v10;
  *((_QWORD *)&v16 + 1) = v11;
  *((_QWORD *)&v17 + 1) = &v10[16 * v12];
  *(_QWORD *)(v11 + 8) = 0;
  v13 = *a2;
  *(_BYTE *)v11 = 6;
  *(_QWORD *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(_QWORD *)&v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A4D1006C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin(unsigned __int8 **result)
{
  unsigned __int8 *v1;
  int v2;

  v1 = *result;
  if (!*result)
    __assert_rtn("set_begin", "iter_impl.hpp", 174, "m_object != nullptr");
  v2 = *v1;
  if (*v1)
  {
    if (v2 == 2)
    {
      result[2] = (unsigned __int8 *)**((_QWORD **)v1 + 1);
    }
    else if (v2 == 1)
    {
      result[1] = (unsigned __int8 *)**((_QWORD **)v1 + 1);
    }
    else
    {
      result[4] = 0;
    }
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

_QWORD *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(_QWORD *result, uint64_t a2)
{
  *result = a2;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0x8000000000000000;
  if (!a2)
    __assert_rtn("iter_impl", "iter_impl.hpp", 88, "m_object != nullptr");
  return result;
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(unsigned __int8 **result)
{
  unsigned __int8 *v1;
  int v2;

  v1 = *result;
  if (!*result)
    __assert_rtn("set_end", "iter_impl.hpp", 211, "m_object != nullptr");
  v2 = *v1;
  if (v2 == 2)
  {
    result[2] = *(unsigned __int8 **)(*((_QWORD *)v1 + 1) + 8);
  }
  else if (v2 == 1)
  {
    result[1] = (unsigned __int8 *)(*((_QWORD *)v1 + 1) + 8);
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::find<char [5]>(uint64_t a1, std::string::value_type *__s)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  uint64_t *v7;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 8;
  do
  {
    v6 = std::string::compare((const std::string *)(v3 + 32), __s);
    v7 = (uint64_t *)(v3 + 8);
    if (v6 >= 0)
    {
      v7 = (uint64_t *)v3;
      v5 = v3;
    }
    v3 = *v7;
  }
  while (*v7);
  if (v5 == v2 || std::string::compare((const std::string *)(v5 + 32), __s) >= 1)
    return v2;
  return v5;
}

uint64_t nlohmann::operator==(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v3;
  int v4;
  uint64_t result;
  BOOL v6;
  double v10;
  double v11;
  double v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const void **v23;
  unsigned __int8 *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  unsigned __int8 **v35;
  uint64_t v36;
  unsigned __int8 *v37;
  unsigned __int8 *v38;
  int v39;
  unsigned __int8 *v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  BOOL v47;
  uint64_t v48;
  _QWORD v49[3];
  _QWORD v50[3];
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  if (v3 != v4)
  {
    if (v3 == 5 && v4 == 7)
    {
      v12 = (double)*((uint64_t *)a1 + 1);
    }
    else
    {
      if (v3 == 7 && v4 == 5)
      {
        v10 = *((double *)a1 + 1);
        v11 = (double)*((uint64_t *)a2 + 1);
        return v10 == v11;
      }
      if (v3 != 6 || v4 != 7)
      {
        if (v3 != 7 || v4 != 6)
        {
          if (v3 != 6 || v4 != 5)
          {
            result = 0;
            if (v3 != 5 || v4 != 6)
              return result;
          }
          return *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
        }
        v10 = *((double *)a1 + 1);
        v11 = (double)*((unint64_t *)a2 + 1);
        return v10 == v11;
      }
      v12 = (double)*((unint64_t *)a1 + 1);
    }
    return *((double *)a2 + 1) == v12;
  }
  result = 1;
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      v13 = (_QWORD *)*((_QWORD *)a1 + 1);
      v14 = (_QWORD *)*((_QWORD *)a2 + 1);
      if (v13[2] != v14[2])
        return 0;
      v17 = (_QWORD *)*v13;
      v15 = v13 + 1;
      v16 = v17;
      if (v17 == v15)
        return result;
      v18 = (_QWORD *)*v14;
      break;
    case 2:
      v29 = (uint64_t *)*((_QWORD *)a1 + 1);
      v30 = (uint64_t *)*((_QWORD *)a2 + 1);
      v31 = *v29;
      v32 = v29[1];
      v33 = *v30;
      if (v32 - *v29 != v30[1] - *v30)
        return 0;
      while (v31 != v32)
      {
        result = nlohmann::operator==(v31, v33);
        if (!(_DWORD)result)
          break;
        v31 += 16;
        v33 += 16;
      }
      return result;
    case 3:
      v34 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
      v35 = (unsigned __int8 **)*((_QWORD *)a2 + 1);
      v36 = v34[23];
      if ((v36 & 0x80u) == 0)
        v37 = (unsigned __int8 *)v34[23];
      else
        v37 = (unsigned __int8 *)*((_QWORD *)v34 + 1);
      v38 = (unsigned __int8 *)*((unsigned __int8 *)v35 + 23);
      v39 = (char)v38;
      if ((char)v38 < 0)
        v38 = v35[1];
      if (v37 != v38)
        return 0;
      if (v39 >= 0)
        v40 = (unsigned __int8 *)*((_QWORD *)a2 + 1);
      else
        v40 = *v35;
      if ((v36 & 0x80) != 0)
        return memcmp(*(const void **)v34, v40, *((_QWORD *)v34 + 1)) == 0;
      if (v34[23])
      {
        v41 = v36 - 1;
        do
        {
          v43 = *v34++;
          v42 = v43;
          v45 = *v40++;
          v44 = v45;
          v47 = v41-- != 0;
          result = v42 == v44;
        }
        while (v42 == v44 && v47);
      }
      return result;
    case 4:
      return a1[8] == a2[8];
    case 5:
    case 6:
      return *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
    case 7:
      v10 = *((double *)a1 + 1);
      v11 = *((double *)a2 + 1);
      return v10 == v11;
    case 8:
      v48 = *((_QWORD *)a2 + 1);
      v50[0] = *((_QWORD *)a1 + 1);
      v50[1] = v50[0] + 24;
      v50[2] = v50[0] + 25;
      v49[0] = v48;
      v49[1] = v48 + 24;
      v49[2] = v48 + 25;
      return std::__tuple_equal<3ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>((uint64_t)&v51, (uint64_t)v50, (uint64_t)v49);
    default:
      return 0;
  }
  while (1)
  {
    v19 = *((unsigned __int8 *)v16 + 55);
    if ((v19 & 0x80u) == 0)
      v20 = *((unsigned __int8 *)v16 + 55);
    else
      v20 = v16[5];
    v21 = *((unsigned __int8 *)v18 + 55);
    v22 = (char)v21;
    if ((v21 & 0x80u) != 0)
      v21 = v18[5];
    if (v20 != v21)
      return 0;
    v23 = (const void **)(v16 + 4);
    if (v22 >= 0)
      v24 = (unsigned __int8 *)(v18 + 4);
    else
      v24 = (unsigned __int8 *)v18[4];
    if ((v19 & 0x80) != 0)
    {
      if (memcmp(*v23, v24, v16[5]))
        return 0;
    }
    else if (*((_BYTE *)v16 + 55))
    {
      while (*(unsigned __int8 *)v23 == *v24)
      {
        v23 = (const void **)((char *)v23 + 1);
        ++v24;
        if (!--v19)
          goto LABEL_41;
      }
      return 0;
    }
LABEL_41:
    result = nlohmann::operator==(v16 + 7, v18 + 7);
    if ((_DWORD)result)
    {
      v25 = (_QWORD *)v16[1];
      v26 = v16;
      if (v25)
      {
        do
        {
          v16 = v25;
          v25 = (_QWORD *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v26[2];
          v6 = *v16 == (_QWORD)v26;
          v26 = v16;
        }
        while (!v6);
      }
      v27 = (_QWORD *)v18[1];
      if (v27)
      {
        do
        {
          v28 = v27;
          v27 = (_QWORD *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          v28 = (_QWORD *)v18[2];
          v6 = *v28 == (_QWORD)v18;
          v18 = v28;
        }
        while (!v6);
      }
      result = 1;
      v18 = v28;
      if (v16 != v15)
        continue;
    }
    return result;
  }
}

void sub_1A4D105D4(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

BOOL std::__tuple_equal<3ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  return std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>((uint64_t)&v6, (const void ***)a2, (uint64_t *)a3)&& **(unsigned __int8 **)(a2 + 8) == **(unsigned __int8 **)(a3 + 8)&& **(unsigned __int8 **)(a2 + 16) == **(unsigned __int8 **)(a3 + 16);
}

BOOL std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>(uint64_t a1, const void ***a2, uint64_t *a3)
{
  uint64_t v3;
  _BYTE *v4;
  size_t v5;

  v3 = *a3;
  v4 = **a2;
  v5 = (_BYTE *)(*a2)[1] - v4;
  return v5 == *(_QWORD *)(v3 + 8) - *(_QWORD *)v3 && memcmp(v4, *(const void **)v3, v5) == 0;
}

void OUTLINED_FUNCTION_0_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 312, a4);
}

void OUTLINED_FUNCTION_1_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 568, a4);
}

void OUTLINED_FUNCTION_2_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 321, a4);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_1A4D1079C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4D10928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4D10A44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4D10C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  std::__shared_weak_count *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CoreAnalytics::ConfigurationObserver *v22;
  void *v24;

  CoreAnalytics::ConfigurationObserver::~ConfigurationObserver(v22);

  if (a16 < 0)
    operator delete(__p);
  std::__shared_weak_count::~__shared_weak_count(v16);
  operator delete(v24);

  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<`anonymous namespace'::ConfigurationObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBB18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<`anonymous namespace'::ConfigurationObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4DEBB18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85A70E0);
}

uint64_t std::__shared_ptr_emplace<`anonymous namespace'::ConfigurationObserverImpl>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void `anonymous namespace'::ConfigurationObserverImpl::~ConfigurationObserverImpl(id *this)
{
  *this = off_1E4DEB838;

  objc_destroyWeak(this + 5);
  objc_destroyWeak(this + 4);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  CoreAnalytics::ConfigurationObserver::~ConfigurationObserver((CoreAnalytics::ConfigurationObserver *)this);
}

{
  *this = off_1E4DEB838;

  objc_destroyWeak(this + 5);
  objc_destroyWeak(this + 4);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  CoreAnalytics::ConfigurationObserver::~ConfigurationObserver((CoreAnalytics::ConfigurationObserver *)this);
  JUMPOUT(0x1A85A70E0);
}

void `anonymous namespace'::ConfigurationObserverImpl::notifyConfigurationActivated(id *this, const FrameworkConfiguration *a2)
{
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t *v19[2];

  v19[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(this + 5);
  if (WeakRetained)
  {
    v18 = 0xAAAAAAAAAAAAAAAALL;
    v19[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    v5 = this + 1;
    FrameworkConfiguration::getExternalConfiguration((uint64_t *)a2, (uint64_t)(this + 1), (uint64_t)&v18);
    if ((_BYTE)v18)
    {
      makeNSObjectFromJson((unsigned __int8 *)&v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if (*((char *)this + 31) < 0)
      v5 = (_QWORD *)*v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(this + 4);
    v9 = this[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN12_GLOBAL__N_125ConfigurationObserverImpl28notifyConfigurationActivatedERK22FrameworkConfiguration_block_invoke;
    block[3] = &unk_1E4DEBEB8;
    v14 = WeakRetained;
    v15 = v8;
    v16 = v6;
    v17 = v7;
    v10 = v7;
    v11 = v6;
    v12 = v8;
    dispatch_barrier_async(v9, block);

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v18);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v19, v18);
  }

}

void sub_1A4D110D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  va_list va;

  va_start(va, a10);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);

  _Unwind_Resume(a1);
}

uint64_t ___ZN12_GLOBAL__N_125ConfigurationObserverImpl28notifyConfigurationActivatedERK22FrameworkConfiguration_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observer:didChangeConfiguration:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t AnalyticsRolloverEvents()
{
  return analytics_rollover_with_options(0);
}

uint64_t analytics_rollover_events()
{
  return analytics_rollover_with_options(0);
}

uint64_t analytics_rollover_with_options(void *a1)
{
  id v1;
  CoreAnalytics::Client *v2;
  uint64_t *v3;
  id v4;
  xpc_object_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  xpc_object_t v9;
  id v10;
  id v11;
  xpc_object_t v12;
  uint64_t v13;
  void *v14;
  xpc_object_t v15;
  _QWORD v17[2];
  xpc_object_t v18;
  void *v19[3];
  id v20;
  void *__p[2];
  char v22;
  xpc_object_t v23;
  xpc_object_t *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  CASPIEnter();
  v23 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "rollover");
  v4 = v1;
  v5 = v4;
  if (!v4)
    v5 = xpc_null_create();

  v6 = v5;
  v7 = v6;
  v20 = v6;
  v8 = MEMORY[0x1E0C812F8];
  if (!v6 || MEMORY[0x1A85A7704](v6) != v8)
  {
    v9 = xpc_null_create();
    v10 = v20;
    v20 = v9;

  }
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v20, &v23);
  v11 = v20;
  v20 = 0;

  if (v22 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v23) == v8
    && (v24 = &v23, v25 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v24)))
  {
    memset(v19, 170, sizeof(v19));
    v17[0] = &v23;
    v17[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v17, &v18);
    v24 = 0;
    v25 = 0;
    v26 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v26) < 0)
      operator delete(v24);
    v12 = v18;
    v18 = 0;

      analytics_rollover_with_options_cold_1();
    if (SHIBYTE(v19[2]) < 0)
      operator delete(v19[0]);
    v13 = 0;
  }
  else
  {
    v24 = &v23;
    v25 = "rollover";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v24, v19);
    v13 = applesauce::xpc::dyn_cast_or_default();
    v14 = v19[0];
    v19[0] = 0;

  }
  v15 = v23;
  v23 = 0;

  return v13;
}

void sub_1A4D11378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23)
{
  void *v23;
  uint64_t v24;

  if (*(char *)(v24 - 57) < 0)
    operator delete(*(void **)(v24 - 80));

  _Unwind_Resume(a1);
}

uint64_t AnalyticsRolloverWithOptions(void *a1)
{
  NSObject *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v6[5];

  v6[4] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  v1 = a1;
  CASPIEnter();
  v2 = xpc_null_create();
  if (v1)
  {
    makeXpcFromNSObject(v1, v6);
    v3 = v6[0];
    v6[0] = 0;

    v4 = analytics_rollover_with_options(v3);
  }
  else
  {
    v4 = analytics_rollover_with_options(0);
    v3 = v2;
  }

  return v4;
}

void sub_1A4D11510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t analytics_disable_all_transform_sampling()
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  id v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  _QWORD v9[2];
  xpc_object_t v10;
  void *v11[3];
  id v12;
  void *__p[2];
  char v14;
  xpc_object_t v15;
  id v16;
  xpc_object_t *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v16);
  v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "disable-sampling");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v12, &v16);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v12, &v15);
  v2 = v12;
  v12 = 0;

  if (v14 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v15) == MEMORY[0x1E0C812F8]
    && (v17 = &v15, v18 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17)))
  {
    memset(v11, 170, sizeof(v11));
    v9[0] = &v15;
    v9[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v9, &v10);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v19) < 0)
      operator delete(v17);
    v3 = v10;
    v10 = 0;

      analytics_disable_all_transform_sampling_cold_1();
    if (SHIBYTE(v11[2]) < 0)
      operator delete(v11[0]);
    v4 = 0;
  }
  else
  {
    v17 = &v15;
    v18 = "disable-sampling";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v17, v11);
    v4 = applesauce::xpc::dyn_cast_or_default();
    v5 = v11[0];
    v11[0] = 0;

  }
  v6 = v15;
  v15 = 0;

  v7 = v16;
  v16 = 0;

  return v4;
}

void sub_1A4D117F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  void *v23;
  void *v24;

  if (*(char *)(v21 - 25) < 0)
    operator delete(*(void **)(v21 - 48));

  v23 = *(void **)(v21 - 64);
  *(_QWORD *)(v21 - 64) = 0;

  v24 = *(void **)(v21 - 56);
  *(_QWORD *)(v21 - 56) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_reenable_all_transform_sampling()
{
  CoreAnalytics::Client *v0;
  uint64_t *v1;
  id v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  _QWORD v9[2];
  xpc_object_t v10;
  void *v11[3];
  id v12;
  void *__p[2];
  char v14;
  xpc_object_t v15;
  id v16;
  xpc_object_t *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v16);
  v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "reenable-sampling");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v12, &v16);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v12, &v15);
  v2 = v12;
  v12 = 0;

  if (v14 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v15) == MEMORY[0x1E0C812F8]
    && (v17 = &v15, v18 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17)))
  {
    memset(v11, 170, sizeof(v11));
    v9[0] = &v15;
    v9[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v9, &v10);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v19) < 0)
      operator delete(v17);
    v3 = v10;
    v10 = 0;

      analytics_reenable_all_transform_sampling_cold_1();
    if (SHIBYTE(v11[2]) < 0)
      operator delete(v11[0]);
    v4 = 0;
  }
  else
  {
    v17 = &v15;
    v18 = "reenable-sampling";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v17, v11);
    v4 = applesauce::xpc::dyn_cast_or_default();
    v5 = v11[0];
    v11[0] = 0;

  }
  v6 = v15;
  v15 = 0;

  v7 = v16;
  v16 = 0;

  return v4;
}

void sub_1A4D11AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  void *v23;
  void *v24;

  if (*(char *)(v21 - 25) < 0)
    operator delete(*(void **)(v21 - 48));

  v23 = *(void **)(v21 - 64);
  *(_QWORD *)(v21 - 64) = 0;

  v24 = *(void **)(v21 - 56);
  *(_QWORD *)(v21 - 56) = 0;

  _Unwind_Resume(a1);
}

uint64_t AnalyticsNotifyTaskingAvailable(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  v2 = analytics_notify_tasking_available((const char *)objc_msgSend(v1, "UTF8String"));

  return v2;
}

void sub_1A4D11BBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t analytics_notify_tasking_available(const char *a1)
{
  CoreAnalytics::Client *v2;
  id v3;
  id v4;
  uint64_t *v5;
  id v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  xpc_object_t v10;
  id v11;
  _QWORD v13[2];
  xpc_object_t v14;
  void *v15[3];
  id v16;
  void *__p[2];
  char v18;
  xpc_object_t v19;
  id v20;
  id v21;
  id v22;
  id *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  CASPIEnter();
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v22);
  if (a1)
  {
    applesauce::xpc::object::object((applesauce::xpc::object *)&v20, a1);
    v23 = &v22;
    v24 = "tasking-id";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v23, &v20, &v21);
    v3 = v21;
    v21 = 0;

    v4 = v20;
    v20 = 0;

  }
  v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "tasking-notify");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v16, &v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v16, &v19);
  v6 = v16;
  v16 = 0;

  if (v18 < 0)
    operator delete(__p[0]);
  if (MEMORY[0x1A85A7704](v19) == MEMORY[0x1E0C812F8]
    && (v23 = &v19, v24 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v23)))
  {
    memset(v15, 170, sizeof(v15));
    v13[0] = &v19;
    v13[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, &v14);
    v23 = 0;
    v24 = 0;
    v25 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v25) < 0)
      operator delete(v23);
    v7 = v14;
    v14 = 0;

      analytics_notify_tasking_available_cold_1();
    if (SHIBYTE(v15[2]) < 0)
      operator delete(v15[0]);
    v8 = 0;
  }
  else
  {
    v23 = &v19;
    v24 = "tasking-notify";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v23, v15);
    v8 = applesauce::xpc::dyn_cast_or_default();
    v9 = v15[0];
    v15[0] = 0;

  }
  v10 = v19;
  v19 = 0;

  v11 = v22;
  v22 = 0;

  return v8;
}

void sub_1A4D11E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22)
{
  uint64_t v22;
  void *v24;

  if (*(char *)(v22 - 41) < 0)
    operator delete(*(void **)(v22 - 64));

  v24 = *(void **)(v22 - 72);
  *(_QWORD *)(v22 - 72) = 0;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t CoreAnalytics::Client::sendEventAlways(NSObject **a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  const char *v8;
  std::chrono::system_clock::time_point v9;
  void **v10;
  uint64_t v11;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t object;
  xpc_object_t v25[3];
  void *__p[2];
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v5 = *(_QWORD *)(a3 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(unint64_t *__return_ptr))(*(_QWORD *)v5 + 48))(&v28);
  if (v28 == 1)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v28, -1, 0x20u, 0, 0, &v30);
    *(_OWORD *)__p = v30;
    v27 = v31;
    v25[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    applesauce::xpc::dict::create(v25);
    v23 = xpc_string_create("send");
    if (!v23)
      v23 = xpc_null_create();
    *(_QWORD *)&v30 = v25;
    *((_QWORD *)&v30 + 1) = "command";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v23, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v23);
    v23 = 0;
    v21 = xpc_int64_create(a4);
    if (!v21)
      v21 = xpc_null_create();
    *(_QWORD *)&v30 = v25;
    *((_QWORD *)&v30 + 1) = "priority";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v21, &v22);
    xpc_release(v22);
    v22 = 0;
    xpc_release(v21);
    v21 = 0;
    if (*(char *)(a2 + 23) >= 0)
      v8 = (const char *)a2;
    else
      v8 = *(const char **)a2;
    v19 = xpc_string_create(v8);
    if (!v19)
      v19 = xpc_null_create();
    *(_QWORD *)&v30 = v25;
    *((_QWORD *)&v30 + 1) = "event";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v19, &v20);
    xpc_release(v20);
    v20 = 0;
    xpc_release(v19);
    v19 = 0;
    v9.__d_.__rep_ = now().__d_.__rep_;
    v17 = xpc_int64_create(v9.__d_.__rep_);
    if (!v17)
      v17 = xpc_null_create();
    *(_QWORD *)&v30 = v25;
    *((_QWORD *)&v30 + 1) = "timestamp";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v17, &v18);
    xpc_release(v18);
    v18 = 0;
    xpc_release(v17);
    v17 = 0;
    if (v27 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    v15 = xpc_string_create((const char *)v10);
    if (!v15)
      v15 = xpc_null_create();
    *(_QWORD *)&v30 = v25;
    *((_QWORD *)&v30 + 1) = "json";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v15, &v16);
    xpc_release(v16);
    v16 = 0;
    xpc_release(v15);
    v15 = 0;
    v13 = xpc_int64_create(BYTE1(a4));
    if (!v13)
      v13 = xpc_null_create();
    *(_QWORD *)&v30 = v25;
    *((_QWORD *)&v30 + 1) = "format";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v13, &v14);
    xpc_release(v14);
    v14 = 0;
    xpc_release(v13);
    v13 = 0;
    v11 = CoreAnalytics::Client::sendXpcMessage(a1, (uint64_t)v25, a4, BYTE2(a4) & 1, 1);
    xpc_release(v25[0]);
    if (SHIBYTE(v27) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v11 = 0;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v28);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28);
  return v11;
}

void sub_1A4D12280(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,xpc_object_t object,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t CoreAnalytics::Client::sendXpcMessage(NSObject **a1, uint64_t a2, char a3, char a4, char a5)
{
  NSObject *v5;
  _QWORD block[6];
  unsigned __int8 v8;
  _QWORD v9[2];
  char v10;
  char v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  v9[0] = a1;
  v9[1] = a2;
  v10 = a3;
  v11 = a5;
  v12 = a4;
  v8 = -86;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client14sendXpcMessageERKNS_3xpc4dictE18XPCMessagePrioritybbE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  block[4] = &v8;
  block[5] = v9;
  dispatch_sync(v5, block);
  return v8;
}

void std::atomic_load[abi:ne180100]<FrameworkConfiguration const>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  std::__sp_mut *sp_mut;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  sp_mut = std::__get_sp_mut(a1);
  std::__sp_mut::lock(sp_mut);
  v5 = a1[1];
  *a2 = *a1;
  a2[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  std::__sp_mut::unlock(sp_mut);
}

BOOL CoreAnalytics::Client::hasConfig(CoreAnalytics::Client *this)
{
  return *((_QWORD *)this + 10) != 0;
}

void **applesauce::xpc::object::object(void **a1, void **a2)
{
  void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    xpc_retain(v3);
  else
    *a1 = xpc_null_create();
  return a1;
}

void CoreAnalytics::Client::registerConfigurationObserver(NSObject **a1, uint64_t a2)
{
  NSObject *v2;
  NSObject **v3;
  std::__shared_weak_count *v4[2];
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a1;
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client29registerConfigurationObserverENSt3__18weak_ptrINS3_21ConfigurationObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_125;
  block[4] = &v3;
  dispatch_sync(v2, block);
  if (v4[1])
    std::__shared_weak_count::__release_weak(v4[1]);
}

void CoreAnalytics::Client::registerEventObserver(NSObject **a1, uint64_t a2)
{
  NSObject *v2;
  NSObject **v3;
  std::__shared_weak_count *v4[2];
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a1;
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client21registerEventObserverENSt3__18weak_ptrINS3_13EventObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_126;
  block[4] = &v3;
  dispatch_sync(v2, block);
  if (v4[1])
    std::__shared_weak_count::__release_weak(v4[1]);
}

_QWORD *CoreAnalytics::Client::registerErrorHandler(NSObject **a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *result;
  uint64_t v4;
  _QWORD block[5];
  NSObject **v6;
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v6 = a1;
  std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)v7, a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client20registerErrorHandlerEONSt3__18functionIFvRKNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_127;
  block[4] = &v6;
  dispatch_sync(v2, block);
  result = v8;
  if (v8 == v7)
  {
    v4 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

void `anonymous namespace'::atExitHandler(_anonymous_namespace_ *this)
{
  void *v1;
  NSObject *v2;
  _BOOL8 v3;
  uint64_t *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((_dispatch_is_fork_of_multithreaded_parent() & 1) == 0)
  {
    v1 = (void *)os_transaction_create();
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4CF5000, v2, OS_LOG_TYPE_DEFAULT, "Entering exit handler.", buf, 2u);
    }
    v4 = CoreAnalytics::Client::get((CoreAnalytics::Client *)v3);
    CoreAnalytics::Client::sendExitBarrierWithTimeoutSync((NSObject **)v4, 0x12Cu);
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4CF5000, v5, OS_LOG_TYPE_DEFAULT, "Exiting exit handler.", v6, 2u);
    }
    os_release(v1);
  }
}

void ___ZN13CoreAnalytics6Client4initEv_block_invoke_2(uint64_t a1)
{
  CoreAnalytics::Client *v1;

  v1 = *(CoreAnalytics::Client **)(a1 + 32);
  CoreAnalytics::Client::updateDaemonState(v1);
  if (*((_BYTE *)v1 + 60))
    CoreAnalytics::Client::sendCheckinMessage_sync(v1);
}

void CoreAnalytics::Client::sendCheckinMessage_sync(CoreAnalytics::Client *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t object;
  xpc_object_t *v16;
  const char *v17;
  id v18;
  xpc_object_t v19;
  xpc_object_t v20[2];

  v20[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  if (MEMORY[0x1A85A7704](*((_QWORD *)this + 6)) == MEMORY[0x1E0C812E0] && !*((_BYTE *)this + 61))
  {
    *((_BYTE *)this + 61) = 1;
      CoreAnalytics::Client::sendCheckinMessage_sync((uint64_t)this, v2, v3, v4, v5, v6, v7, v8);
    v20[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    applesauce::xpc::dict::create(v20);
    v18 = xpc_string_create("checkin");
    if (!v18)
      v18 = xpc_null_create();
    v16 = v20;
    v17 = "command";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v16, &v18, &v19);
    xpc_release(v19);
    v19 = 0;
    xpc_release(v18);
    v18 = 0;
    v9 = getprogname();
    v14 = xpc_string_create(v9);
    if (!v14)
      v14 = xpc_null_create();
    v16 = v20;
    v17 = "process";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v16, &v14, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v14);
    v14 = 0;
    v12 = xpc_int64_create(0);
    if (!v12)
      v12 = xpc_null_create();
    v16 = v20;
    v17 = "priority";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v16, &v12, &v13);
    xpc_release(v13);
    v13 = 0;
    xpc_release(v12);
    v10 = v20[0];
    v11 = v20[0];
    v12 = 0;
    if (v20[0])
    {
      xpc_retain(v20[0]);
    }
    else
    {
      v10 = xpc_null_create();
      v11 = v10;
    }
    CoreAnalytics::Client::sendXpcMessage_sync((uint64_t)this, &v11, 0, 0, 1);
    xpc_release(v10);
    v11 = 0;
    xpc_release(v20[0]);
  }
}

void sub_1A4D12AD8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke_24(uint64_t a1, int a2)
{
  CoreAnalytics::Client *v4;
  uint64_t result;
  NSObject *v6;
  uint8_t v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *(CoreAnalytics::Client **)(a1 + 32);
  result = xpc_user_sessions_get_foreground_uid();
  if ((_DWORD)result != *(_DWORD *)(a1 + 40))
  {
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4CF5000, v6, OS_LOG_TYPE_DEFAULT, "Re-estabilishing XPC connection after a user switch", v7, 2u);
    }
    CoreAnalytics::Client::initConnection(v4);
    return notify_cancel(a2);
  }
  return result;
}

BOOL CoreAnalytics::Client::sendXpcMessage_sync(uint64_t a1, void **a2, int a3, char a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_qos_class_t v13;
  dispatch_block_t v14;
  _QWORD v16[5];
  xpc_object_t object;
  char v18;
  char v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = MEMORY[0x1A85A7704](*(_QWORD *)(a1 + 48));
  v11 = MEMORY[0x1E0C812E0];
  if (v10 == MEMORY[0x1E0C812E0])
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 1174405120;
    v16[2] = ___ZN13CoreAnalytics6Client19sendXpcMessage_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybb_block_invoke;
    v16[3] = &__block_descriptor_tmp_26;
    v12 = *a2;
    v16[4] = a1;
    object = v12;
    if (v12)
      xpc_retain(v12);
    else
      object = xpc_null_create();
    v18 = a4;
    v19 = a3;
    v20 = a5;
    if (a3 == 1)
      v13 = QOS_CLASS_UTILITY;
    else
      v13 = QOS_CLASS_BACKGROUND;
    v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, v16);
    dispatch_async(*(dispatch_queue_t *)(a1 + 8), v14);
    _Block_release(v14);
    xpc_release(object);
  }
  return v10 == v11;
}

void sub_1A4D12D40(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ___ZN13CoreAnalytics6Client19sendXpcMessage_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybb_block_invoke(uint64_t a1)
{
  xpc_object_t *v2;
  uint64_t v3;
  NSObject *v4;
  xpc_object_t *v5;
  const char *v6;
  xpc_object_t object;
  xpc_object_t *v8;
  const char *v9;
  xpc_object_t v10;
  void *__p[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (xpc_object_t *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "event") && xpc_dictionary_get_value(*v2, "json"))
  {
    if (os_log_type_enabled((os_log_t)qword_1ECD3AF60, OS_LOG_TYPE_DEBUG))
    {
      v8 = v2;
      v9 = "event";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v8, &v10);
      applesauce::xpc::dyn_cast<std::string>();
      v5 = v2;
      v6 = "json";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v5, &object);
      applesauce::xpc::dyn_cast<std::string>();
      CoreAnalytics::Client::sendManagementCommandWithReply();
      xpc_release(object);
      if (SHIBYTE(v12) < 0)
        operator delete(__p[0]);
      xpc_release(v10);
    }
    if (*(_BYTE *)(a1 + 48) && os_log_type_enabled((os_log_t)qword_1ECD3AF68, OS_LOG_TYPE_DEBUG))
    {
      v8 = v2;
      v9 = "event";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v8, &v10);
      applesauce::xpc::dyn_cast<std::string>();
      v5 = v2;
      v6 = "json";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v5, &object);
      applesauce::xpc::dyn_cast<std::string>();
      CoreAnalytics::Client::sendManagementCommandWithReply();
      xpc_release(object);
      if (SHIBYTE(v12) < 0)
        operator delete(__p[0]);
      xpc_release(v10);
    }
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v4 = *(NSObject **)v3;
  __p[0] = (void *)MEMORY[0x1E0C809B0];
  __p[1] = (void *)0x40000000;
  v12 = ___ZN13CoreAnalytics6Client22acquireSendTransactionEv_block_invoke;
  v13 = &__block_descriptor_tmp_31;
  v14 = v3;
  dispatch_sync(v4, __p);
  CoreAnalytics::Client::retryXpcMessage_sync(v3, v2, *(_BYTE *)(a1 + 49), *(_BYTE *)(a1 + 50));
}

void sub_1A4D12F90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, xpc_object_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CoreAnalytics::Client::acquireSendTransaction(NSObject **this)
{
  NSObject *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v1 = *this;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 0x40000000;
  v2[2] = ___ZN13CoreAnalytics6Client22acquireSendTransactionEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_31;
  v2[4] = this;
  dispatch_sync(v1, v2);
}

void CoreAnalytics::Client::releaseSendTransaction(NSObject **this)
{
  NSObject *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v1 = *this;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 0x40000000;
  v2[2] = ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_32;
  v2[4] = this;
  dispatch_sync(v1, v2);
}

void ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_27(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t object;
  uint64_t v9;
  uint64_t *v10;
  void *__p[2];
  char v12;
  uint8_t buf[4];
  void **v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  {
    v4 = *(void **)(a1 + 40);
    object = v4;
    if (v4)
      xpc_retain(v4);
    else
      object = xpc_null_create();
    try_xpc_to_json(&object, &v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v9, -1, 0x20u, 0, 1, __p);
    if (v12 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v14 = v5;
    _os_log_impl(&dword_1A4CF5000, v3, OS_LOG_TYPE_DEFAULT, "Retrying message: %s", buf, 0xCu);
    if (v12 < 0)
      operator delete(__p[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9);
    xpc_release(object);
  }
  v6 = *(xpc_object_t *)(a1 + 40);
  v7 = v6;
  if (v6)
  {
    xpc_retain(v6);
  }
  else
  {
    v6 = xpc_null_create();
    v7 = v6;
  }
  CoreAnalytics::Client::retryXpcMessageHelper_sync(v2, &v7, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), (*(_BYTE *)(a1 + 58) + 1), 2 * *(_QWORD *)(a1 + 48));
  xpc_release(v6);
}

void sub_1A4D132CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void CoreAnalytics::Client::cancelConnection_sync(xpc_connection_t *this)
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1A85A7704](this[6]) == MEMORY[0x1E0C812E0] && !*((_BYTE *)this + 40))
  {
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A4CF5000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling XPC connection. Any further reply handler invocations will not retry messages", v3, 2u);
    }
    xpc_connection_cancel(this[6]);
    *((_BYTE *)this + 40) = 1;
  }
}

void CoreAnalytics::Client::handleSinkMessageEmit_sync(CoreAnalytics::Client *this, xpc_object_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *i;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  _BYTE v15[8];
  uint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  const char *string;
  _QWORD v20[3];
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  string = xpc_dictionary_get_string(*a2, "message");
  if (string)
  {
    v17 = 0xAAAAAAAAAAAAAAAALL;
    v18 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    v21 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*&>(&string, (uint64_t)v20, 1, &v17);
    v3 = v21;
    if (v21 == v20)
    {
      v4 = 4;
      v3 = v20;
    }
    else
    {
      if (!v21)
      {
LABEL_9:
        if (v17 == 1)
        {
          v5 = (uint64_t *)*((_QWORD *)this + 15);
          for (i = (uint64_t *)*((_QWORD *)this + 16); v5 != i; v5 += 2)
          {
            v7 = (std::__shared_weak_count *)v5[1];
            if (v7)
            {
              v8 = *v5;
              p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
              do
                v10 = __ldxr(p_shared_weak_owners);
              while (__stxr(v10 + 1, p_shared_weak_owners));
              v11 = std::__shared_weak_count::lock(v7);
              v20[1] = v11;
              if (v11)
              {
                v12 = v11;
                v20[0] = v8;
                if (v8)
                {
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v15, (uint64_t)&v17);
                  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 16))(v8, v15);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v15);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v16, v15[0]);
                }
                p_shared_owners = (unint64_t *)&v12->__shared_owners_;
                do
                  v14 = __ldaxr(p_shared_owners);
                while (__stlxr(v14 - 1, p_shared_owners));
                if (!v14)
                {
                  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
                  std::__shared_weak_count::__release_weak(v12);
                }
              }
              std::__shared_weak_count::__release_weak(v7);
            }
          }
        }
        {
          CoreAnalytics::Client::handleSinkMessageEmit_sync();
        }
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v17);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v18, v17);
        return;
      }
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
    goto LABEL_9;
  }
    CoreAnalytics::Client::handleSinkMessageEmit_sync();
}

void sub_1A4D135E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v20;
  uint64_t v21;

  v20 = a17;
  if (a17 == v17)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_6:
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    a11 = 0;
    a12 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&a11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&a11);
    __cxa_end_catch();
    JUMPOUT(0x1A4D1349CLL);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::atomic_exchange[abi:ne180100]<FrameworkConfiguration const>@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  std::__sp_mut *sp_mut;
  uint64_t v7;
  uint64_t v8;
  __n128 result;

  sp_mut = std::__get_sp_mut(a1);
  std::__sp_mut::lock(sp_mut);
  v7 = *a1;
  *a1 = *a2;
  *a2 = v7;
  v8 = a1[1];
  a1[1] = a2[1];
  a2[1] = v8;
  std::__sp_mut::unlock(sp_mut);
  result = *(__n128 *)a2;
  *a3 = *(_OWORD *)a2;
  *a2 = 0;
  a2[1] = 0;
  return result;
}

void CoreAnalytics::Client::sendExitBarrierWithTimeoutSync(NSObject **this, unsigned int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject **v9;
  dispatch_object_t object;
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  NSObject ***v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = *this;
  v9 = this;
  object = v4;
  if (v4)
    dispatch_retain(v4);
  v6 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v12 = 0x40000000;
  v13 = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  v14 = &__block_descriptor_tmp_251;
  v15 = &v9;
  dispatch_sync(v5, &block);
  if (object)
    dispatch_release(object);
  v7 = dispatch_time(0, 1000000 * a2);
  if (dispatch_group_wait(v4, v7))
  {
    v9 = this;
    v8 = *this;
    block = v6;
    v12 = 0x40000000;
    v13 = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    v14 = &__block_descriptor_tmp_256;
    v15 = &v9;
    dispatch_sync(v8, &block);
  }
  if (v4)
    dispatch_release(v4);
}

uint64_t CoreAnalytics::Client::allowAllEvents(uint64_t this)
{
  *(_BYTE *)(this + 62) = 1;
  return this;
}

void **std::pair<applesauce::xpc::object,unsigned long>::pair[abi:ne180100]<applesauce::xpc::object&,unsigned long &,0>(void **a1, void **a2, void **a3)
{
  void *v5;

  v5 = *a2;
  *a1 = *a2;
  if (v5)
    xpc_retain(v5);
  else
    *a1 = xpc_null_create();
  a1[1] = *a3;
  return a1;
}

void ___ZN10applesauce8dispatch2v19sync_implIZNK13CoreAnalytics6Client30sendManagementCommandWithReplyENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS_3xpc4dictEE3__0EENS5_5decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  void **v4;
  xpc_object_t v5;
  void *v6;

  v2 = **(_QWORD **)(a1 + 40);
  v3 = *(xpc_object_t *)(v2 + 48);
  if (v3)
    xpc_retain(*(xpc_object_t *)(v2 + 48));
  else
    v3 = xpc_null_create();
  v4 = *(void ***)(a1 + 32);
  v5 = xpc_null_create();
  v6 = *v4;
  *v4 = v3;
  xpc_release(v6);
  xpc_release(v5);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client29registerConfigurationObserverENSt3__18weak_ptrINS3_21ConfigurationObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  CoreAnalytics::Client **v1;
  CoreAnalytics::Client *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v1 = *(CoreAnalytics::Client ***)(a1 + 32);
  v2 = *v1;
  std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>((uint64_t *)*v1 + 12, (uint64_t)(v1 + 1));
  if (*((_QWORD *)v2 + 10))
  {
    v3 = *((_QWORD *)v2 + 13);
    v4 = *(std::__shared_weak_count **)(v3 - 8);
    if (v4)
    {
      v5 = std::__shared_weak_count::lock(v4);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)(v3 - 16);
        if (v7)
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v7 + 16))(v7, *((_QWORD *)v2 + 10));
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
    }
  }
  else
  {
    CoreAnalytics::Client::sendCheckinMessage_sync(v2);
  }
}

void sub_1A4D139B8(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  p_shared_owners = (unint64_t *)&v1->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
    ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client29registerConfigurationObserverENSt3__18weak_ptrINS3_21ConfigurationObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke_cold_1(v1);
  _Unwind_Resume(exception_object);
}

_OWORD *std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>(uint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void *v17[6];

  v17[5] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a1[2];
  v4 = a1 + 2;
  v5 = v6;
  v7 = (_OWORD *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = ((uint64_t)v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *a1;
    v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v17[4] = v4;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)v4, v12);
    v14 = &v13[16 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[16 * v15];
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v17[2] = v14 + 16;
    std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::__swap_out_circular_buffer(a1, v17);
    v8 = (_OWORD *)a1[1];
    std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(v17);
  }
  else
  {
    *v7 = *(_OWORD *)a2;
    v8 = v7 + 1;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    a1[1] = (uint64_t)v8;
  }
  a1[1] = (uint64_t)v8;
  return v8 - 1;
}

void sub_1A4D13AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(&a9);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  _QWORD v14[3];
  unint64_t v15;
  uint64_t v16;

  v7 = a7;
  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v13 = a6;
  *((_QWORD *)&v13 + 1) = a7;
  v12 = v13;
  v14[0] = a1;
  v14[1] = &v12;
  v14[2] = &v13;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = (_OWORD *)(a7 - 16);
    do
    {
      v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((_QWORD *)&v13 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    v10 = v13;
  }
  LOBYTE(v15) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    v1 += 16;
  }
}

void **std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v4;

  v2 = *(_QWORD *)(a1 + 8);
  v1 = *(_QWORD *)(a1 + 16);
  while (v1 != v2)
  {
    *(_QWORD *)(a1 + 16) = v1 - 16;
    v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_weak(v4);
      v1 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client21registerEventObserverENSt3__18weak_ptrINS3_13EventObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  CoreAnalytics::Client **v1;
  CoreAnalytics::Client *v2;

  v1 = *(CoreAnalytics::Client ***)(a1 + 32);
  v2 = *v1;
  std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::EventObserver>>((uint64_t *)*v1 + 15, (uint64_t)(v1 + 1));
  CoreAnalytics::Client::sendCheckinMessage_sync(v2);
}

_OWORD *std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::EventObserver>>(uint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void *v17[6];

  v17[5] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a1[2];
  v4 = a1 + 2;
  v5 = v6;
  v7 = (_OWORD *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = ((uint64_t)v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *a1;
    v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v17[4] = v4;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)v4, v12);
    v14 = &v13[16 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[16 * v15];
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v17[2] = v14 + 16;
    std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::__swap_out_circular_buffer(a1, v17);
    v8 = (_OWORD *)a1[1];
    std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(v17);
  }
  else
  {
    *v7 = *(_OWORD *)a2;
    v8 = v7 + 1;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    a1[1] = (uint64_t)v8;
  }
  a1[1] = (uint64_t)v8;
  return v8 - 1;
}

void sub_1A4D13E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(&a9);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  _QWORD v14[3];
  unint64_t v15;
  uint64_t v16;

  v7 = a7;
  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v13 = a6;
  *((_QWORD *)&v13 + 1) = a7;
  v12 = v13;
  v14[0] = a1;
  v14[1] = &v12;
  v14[2] = &v13;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = (_OWORD *)(a7 - 16);
    do
    {
      v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((_QWORD *)&v13 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    v10 = v13;
  }
  LOBYTE(v15) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>::operator()[abi:ne180100](a1);
  return a1;
}

uint64_t std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

_QWORD *std::function<void ()(std::string)>::operator=<std::function<void ()(std::string const&)>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];
  _BYTE *v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)v8, a2);
  std::__function::__value_func<void ()(std::string)>::__value_func[abi:ne180100]<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>>((uint64_t)v10, (uint64_t)v8);
  std::__function::__value_func<void ()(std::string)>::swap[abi:ne180100](v10, a1);
  v3 = v11;
  if (v11 == v10)
  {
    v4 = 4;
    v3 = v10;
  }
  else
  {
    if (!v11)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_10;
  }
  if (v9)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return a1;
}

void sub_1A4D1413C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__value_func<void ()(std::string)>::__value_func[abi:ne180100]<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a1 + 24) = 0;
  if (*(_QWORD *)(a2 + 24))
  {
    v4 = operator new(0x28uLL);
    *v4 = &unk_1E4DEB9D0;
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)(v4 + 1), a2);
    *(_QWORD *)(a1 + 24) = v4;
  }
  return a1;
}

_QWORD *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &unk_1E4DEB9D0;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &unk_1E4DEB9D0;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x1A85A70E0);
}

_QWORD *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::__clone(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &unk_1E4DEB9D0;
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_1A4D142E8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &unk_1E4DEB9D0;
  return std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::operator()(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

uint64_t std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::target_type()
{
}

_QWORD *std::__function::__value_func<void ()(std::string)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        memset(v6, 170, 24);
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_1A4D14580(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t *_ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(_QWORD *)(v2 + 8) = 0;
    MEMORY[0x1A85A70E0](v2, 0xA0C40AFF93C70);
  }
  return a1;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client14sendXpcMessageERKNS_3xpc4dictE18XPCMessagePrioritybbE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  BOOL v5;
  void *v6[2];

  v6[1] = *(void **)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)v2;
  v4 = **(xpc_object_t **)(v2 + 8);
  v6[0] = v4;
  if (v4)
  {
    xpc_retain(v4);
  }
  else
  {
    v4 = xpc_null_create();
    v6[0] = v4;
  }
  v5 = CoreAnalytics::Client::sendXpcMessage_sync(v3, v6, *(unsigned __int8 *)(v2 + 16), *(_BYTE *)(v2 + 18), *(_BYTE *)(v2 + 17));
  xpc_release(v4);
  **(_BYTE **)(a1 + 32) = v5;
}

void sub_1A4D14690(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*&>@<X0>(const char **a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _QWORD *a4@<X8>)
{
  const char *v8;
  size_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;
  _BYTE v14[24];
  _BYTE *v15;
  _BYTE v16[24];
  _BYTE *v17;
  _QWORD v18[19];

  v18[18] = *MEMORY[0x1E0C80C00];
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0;
  *(_BYTE *)a4 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a4);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a4);
  v8 = *a1;
  v9 = strlen(v8);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v14, a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>((uint64_t)v8, (uint64_t)&v8[v9], (uint64_t)v14, a3, (uint64_t)v16);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parse((uint64_t)v16, 1, (uint64_t)a4);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)v18);
  v10 = v17;
  if (v17 == v16)
  {
    v11 = 4;
    v10 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_6:
  result = v15;
  if (v15 == v14)
  {
    v13 = 4;
    result = v14;
  }
  else
  {
    if (!v15)
      return result;
    v13 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v13))();
}

void sub_1A4D147D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, uint64_t a13)
{
  uint64_t **v13;
  uint64_t *v15;
  uint64_t v16;

  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~parser(&a13);
  v15 = a12;
  if (a12 == &a9)
  {
    v16 = 4;
    v15 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_6:
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v13);
  _Unwind_Resume(a1);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  dispatch_group_t *v1;
  dispatch_group_t v2;
  NSObject *v3;
  int isa;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  dispatch_object_t object;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(dispatch_group_t **)(a1 + 32);
  v2 = *v1;
  if (MEMORY[0x1A85A7704]((*v1)[6].isa) == MEMORY[0x1E0C812E0])
  {
    {
      isa = (int)v2[9].isa;
      LODWORD(v7[0]) = 67109120;
      HIDWORD(v7[0]) = isa;
      _os_log_impl(&dword_1A4CF5000, v3, OS_LOG_TYPE_DEFAULT, "Queueing exit procedure onto XPC queue. Any further messages sent will be discarded. activeSendTransactions=%d", (uint8_t *)v7, 8u);
    }
    v5 = v2[1].isa;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 1174405120;
    v7[2] = ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke;
    v7[3] = &__block_descriptor_tmp_254;
    v7[4] = v2;
    v6 = v1[1];
    object = v6;
    if (v6)
      dispatch_retain(v6);
    dispatch_async(v5, v7);
    if (object)
      dispatch_release(object);
  }
  else
  {
    dispatch_group_leave(v1[1]);
  }
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD barrier[5];
  dispatch_object_t object;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
    ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_cold_1();
  v3 = *(_xpc_connection_s **)(v2 + 48);
  barrier[0] = MEMORY[0x1E0C809B0];
  barrier[1] = 1174405120;
  barrier[2] = ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_252;
  barrier[3] = &__block_descriptor_tmp_253;
  v4 = *(NSObject **)(a1 + 40);
  barrier[4] = v2;
  object = v4;
  if (v4)
    dispatch_retain(v4);
  xpc_connection_send_barrier(v3, barrier);
  if (object)
    dispatch_release(object);
}

void sub_1A4D14A64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object)
{
  _Unwind_Resume(exception_object);
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_252(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  NSObject **v4;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject ***)(a1 + 32);
    ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_252_cold_1();
  v4 = v2;
  v3 = *v2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZZZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEvEUb_EUb_EUlvE_EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_255;
  block[4] = &v4;
  dispatch_sync(v3, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __copy_helper_block_e8_40c36_ZTSN10applesauce8dispatch2v15groupE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __destroy_helper_block_e8_40c36_ZTSN10applesauce8dispatch2v15groupE(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

void ___ZN10applesauce8dispatch2v19sync_implIZZZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEvEUb_EUb_EUlvE_EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  CoreAnalytics::Client::cancelConnection_sync(**(xpc_connection_t ***)(a1 + 32));
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  xpc_connection_t *v1;
  NSObject *v2;

  v1 = **(xpc_connection_t ***)(a1 + 32);
    ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_1((uint64_t)v1, v2);
  CoreAnalytics::Client::cancelConnection_sync(v1);
}

_QWORD *OUTLINED_FUNCTION_1_2(_QWORD *result, uint64_t a2, uint64_t a3, float a4)
{
  int v4;
  _QWORD *v5;

  if (v4 >= 0)
    v5 = result;
  else
    v5 = (_QWORD *)*result;
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = v5;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_10()
{
  void **v0;

  operator delete(*v0);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void MemoryMappedBuffer::~MemoryMappedBuffer(MemoryMappedBuffer *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2 != (void *)-1)
  {
    munmap(v2, *((_QWORD *)this + 1));
    *(_QWORD *)this = -1;
  }
}

void makeXpcFromNSObject(NSObject *a1@<X0>, xpc_object_t *a2@<X8>)
{
  makeXpcFromNSObjectWithDepthCount(a2, a1, 0);
}

void makeXpcFromNSObjectWithDepthCount(xpc_object_t *__return_ptr a1@<X8>, NSObject *a2@<X0>, unsigned int a3@<W1>)
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  CFTypeID v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  float v13;
  double v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  _QWORD v20[4];
  id v21;
  char v22;
  _QWORD v23[4];
  id v24;
  char v25;
  void *v26[2];

  v26[1] = *(void **)MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3 >= 0xB)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Object exceeded the max depth"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (const char *)-[NSObject UTF8String](objc_retainAutorelease(v5), "UTF8String");
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid non-UTF8 character(s) in string value"));
    applesauce::xpc::object::object((applesauce::xpc::object *)a1, v6);
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = CFGetTypeID(v7);
    if (v8 == CFBooleanGetTypeID())
    {
      applesauce::xpc::object::object((applesauce::xpc::object *)a1, -[NSObject BOOLValue](v7, "BOOLValue"));
LABEL_40:

      goto LABEL_41;
    }
    v11 = objc_retainAutorelease(v7);
    v12 = *(char *)-[NSObject objCType](v11, "objCType");
    if (v12 <= 80)
    {
      if (v12 > 72)
      {
        if (v12 == 73 || v12 == 76)
          goto LABEL_34;
        goto LABEL_37;
      }
      if (v12 != 66)
      {
        if (v12 == 67)
        {
LABEL_34:
          applesauce::xpc::object::object((applesauce::xpc::object *)a1, -[NSObject unsignedLongLongValue](v11, "unsignedLongLongValue"));
          goto LABEL_40;
        }
LABEL_37:
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = (char *)-[NSObject objCType](objc_retainAutorelease(v11), "objCType");
        objc_msgSend(v18, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid number type in JSON write (%c)"), *v19);
        *a1 = xpc_null_create();
        goto LABEL_40;
      }
    }
    else
    {
      if ((v12 - 99) > 0x10)
        goto LABEL_32;
      if (((1 << (v12 - 99)) & 0x14241) == 0)
      {
        if (v12 == 100)
        {
          -[NSObject doubleValue](v11, "doubleValue");
          goto LABEL_39;
        }
        if (v12 == 102)
        {
          -[NSObject floatValue](v11, "floatValue");
          v14 = v13;
LABEL_39:
          applesauce::xpc::object::object((applesauce::xpc::object *)a1, v14);
          goto LABEL_40;
        }
LABEL_32:
        if (v12 == 81 || v12 == 83)
          goto LABEL_34;
        goto LABEL_37;
      }
    }
    applesauce::xpc::object::object((applesauce::xpc::object *)a1, -[NSObject longLongValue](v11, "longLongValue"));
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    applesauce::xpc::dict::create(v26);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3321888768;
    v23[2] = ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke;
    v23[3] = &__block_descriptor_41_ea8_32c27_ZTSN10applesauce3xpc4dictE_e15_v32__0_8_16_B24l;
    applesauce::xpc::object::object((applesauce::xpc::object *)&v24, v26);
    v25 = a3;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v23);
    applesauce::xpc::object::object(a1, v26);
    v9 = v24;
    v24 = 0;

    v10 = v26[0];
    v26[0] = 0;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26[0] = (void *)0xAAAAAAAAAAAAAAAALL;
      applesauce::xpc::array::create(v26);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3321888768;
      v20[2] = ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke_12;
      v20[3] = &__block_descriptor_41_ea8_32c28_ZTSN10applesauce3xpc5arrayE_e15_v32__0_8Q16_B24l;
      applesauce::xpc::object::object((applesauce::xpc::object *)&v21, v26);
      v22 = a3;
      -[NSObject enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v20);
      applesauce::xpc::object::object((applesauce::xpc::object *)a1, v26);
      v15 = v21;
      v21 = 0;

      v16 = v26[0];
      v26[0] = 0;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_retainAutorelease(v5);
        applesauce::xpc::object::object((applesauce::xpc::object *)a1, (const void *)-[NSObject bytes](v17, "bytes"), -[NSObject length](v17, "length"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid type in JSON write (%@)"), objc_opt_class());
        *a1 = xpc_null_create();
      }
    }
  }
LABEL_41:

}

void sub_1A4D15150(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[2];
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    if (!v7)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid non-UTF8 character(s) in dictionary key"));
    makeXpcFromNSObjectWithDepthCount((uint64_t *)&v11, v6, *(_BYTE *)(a1 + 40) + 1);
    v10[0] = a1 + 32;
    v10[1] = v7;
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)v10, &v11, v12);
    v8 = v12[0];
    v12[0] = 0;

    v9 = v11;
    v11 = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid (non-string) key in dictionary"));
  }

}

void sub_1A4D15330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

applesauce::xpc::object *__copy_helper_block_ea8_32c27_ZTSN10applesauce3xpc4dictE(uint64_t a1, uint64_t a2)
{
  return applesauce::xpc::object::object((applesauce::xpc::object *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c27_ZTSN10applesauce3xpc4dictE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

}

void ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke_12(uint64_t a1, NSObject *a2)
{
  xpc_object_t v3;
  xpc_object_t value[2];

  value[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  makeXpcFromNSObjectWithDepthCount((uint64_t *)value, a2, *(_BYTE *)(a1 + 40) + 1);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value[0]);
  v3 = value[0];
  value[0] = 0;

}

void sub_1A4D15414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

applesauce::xpc::object *__copy_helper_block_ea8_32c28_ZTSN10applesauce3xpc5arrayE(uint64_t a1, uint64_t a2)
{
  return applesauce::xpc::object::object((applesauce::xpc::object *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c28_ZTSN10applesauce3xpc5arrayE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, const void *bytes, size_t length)
{
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;

  v4 = xpc_data_create(bytes, length);
  *(_QWORD *)this = v4;
  if (!v4)
  {
    v5 = xpc_null_create();
    v6 = *(void **)this;
    *(_QWORD *)this = v5;

  }
  return this;
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, uint64_t value)
{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  v3 = xpc_uint64_create(value);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, double a2)
{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  v3 = xpc_double_create(a2);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    v4 = xpc_null_create();
    v5 = *(void **)this;
    *(_QWORD *)this = v4;

  }
  return this;
}

void try_xpc_to_json(xpc_object_t *a1@<X0>, uint64_t *a2@<X8>)
{
  xpc_to_json(a2, a1);
}

void sub_1A4D15688(void *a1)
{
  uint64_t v1;

  try_xpc_to_json(a1, v1);
  JUMPOUT(0x1A4D1567CLL);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(a1, (uint64_t)a2);
}

void sub_1A4D156F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t result, uint64_t a2)
{
  char *v2;
  uint64_t *v3;
  nlohmann::detail::exception *exception;
  char *v5;
  std::string *v6;
  __int128 v7;
  std::string v8;
  __int128 v9;
  std::string::size_type v10;
  uint64_t v11;

  v2 = (char *)result;
  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)result != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
    std::string::basic_string[abi:ne180100]<0>(&v8, v5);
    v6 = std::string::insert(&v8, 0, "type must be array, but is ");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v10 = v6->__r_.__value_.__r.__words[2];
    v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(302, (uint64_t)&v9, exception);
  }
  v3 = *(uint64_t **)(result + 8);
  if (v3 != (uint64_t *)a2)
    return std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__assign_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(a2, *v3, v3[1], (v3[1] - *v3) >> 4);
  return result;
}

void sub_1A4D15840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__assign_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a1 + 16;
  v9 = *(_QWORD *)a1;
  if (a4 > (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vdeallocate((void **)a1);
    if (a4 >> 60)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v10 = *(_QWORD *)(a1 + 16) - *(_QWORD *)a1;
    v11 = v10 >> 3;
    if (v10 >> 3 <= a4)
      v11 = a4;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100]((_QWORD *)a1, v12);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v8, a2, a3, *(_QWORD *)(a1 + 8));
    goto LABEL_11;
  }
  v14 = (*(_QWORD *)(a1 + 8) - v9) >> 4;
  if (v14 < a4)
  {
    v15 = a2 + 16 * v14;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>((uint64_t)&v17, a2, v15, v9);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v8, v15, a3, *(_QWORD *)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = result;
    return result;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>((uint64_t)&v18, a2, a3, v9);
  return std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](a1, v16);
}

void sub_1A4D159F8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1A4D15A00(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vdeallocate(void **a1)
{
  if (*a1)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](a1);
    operator delete(*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t *v8;
  char v10[8];
  uint64_t *v11[2];

  v5 = a2;
  v11[1] = *(uint64_t **)MEMORY[0x1E0C80C00];
  if (a2 == a3)
    return a2;
  v6 = a3;
  do
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v10, v5);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    v7 = *(_BYTE *)a4;
    *(_BYTE *)a4 = v10[0];
    v10[0] = v7;
    v8 = *(uint64_t **)(a4 + 8);
    *(uint64_t **)(a4 + 8) = v11[0];
    v11[0] = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v11, v10[0]);
    v5 += 16;
    a4 += 16;
  }
  while (v5 != v6);
  return v6;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char (&)[37],char [37],0>(uint64_t a1, char *a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[37]>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[37]>(char *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_1A4D15BA0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void AnalyticsSendEventInternal()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "Dropping because event name was null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A4CF5000, v0, v1, "Dropping because event name was non-UTF8", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump()
{
  __assert_rtn("dump", "serializer.hpp", 363, "false");
}

{
  __assert_rtn("dump", "serializer.hpp", 138, "i != val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 139, "std::next(i) == val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 166, "i != val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 167, "std::next(i) == val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 208, "not val.m_value.array->empty()");
}

{
  __assert_rtn("dump", "serializer.hpp", 229, "not val.m_value.array->empty()");
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped()
{
  __assert_rtn("dump_escaped", "serializer.hpp", 625, "false");
}

{
  __assert_rtn("dump_escaped", "serializer.hpp", 562, "false");
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>()
{
  __assert_rtn("dump_integer", "serializer.hpp", 726, "n_chars < number_buffer.size() - 1");
}

void nlohmann::detail::to_chars<double>()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1082, "last - first >= std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1092, "len <= std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1100, "last - first >= 2 + (-kMinExp - 1) + std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1101, "last - first >= std::numeric_limits<FloatType>::max_digits10 + 6");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1064, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::grisu2<double>()
{
  __assert_rtn("grisu2", "to_chars.hpp", 890, "value > 0");
}

{
  __assert_rtn("grisu2", "to_chars.hpp", 889, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::format_buffer()
{
  __assert_rtn("format_buffer", "to_chars.hpp", 979, "min_exp < 0");
}

{
  __assert_rtn("format_buffer", "to_chars.hpp", 980, "max_exp > 0");
}

{
  __assert_rtn("append_exponent", "to_chars.hpp", 926, "e > -1000");
}

{
  __assert_rtn("append_exponent", "to_chars.hpp", 927, "e < 1000");
}

{
  __assert_rtn("format_buffer", "to_chars.hpp", 1006, "k > n");
}

void nlohmann::detail::dtoa_impl::compute_boundaries<double>()
{
  __assert_rtn("compute_boundaries", "to_chars.hpp", 186, "value > 0");
}

{
  __assert_rtn("compute_boundaries", "to_chars.hpp", 185, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::grisu2()
{
  __assert_rtn("grisu2", "to_chars.hpp", 828, "m_plus.e == v.e");
}

{
  __assert_rtn("grisu2", "to_chars.hpp", 827, "m_plus.e == m_minus.e");
}

void nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 466, "e >= -1500");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 467, "e <= 1500");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 472, "index >= 0");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 476, "kAlpha <= cached.e + e + 64");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 477, "kGamma >= cached.e + e + 64");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 473, "static_cast<std::size_t>(index) < kCachedPowers.size()");
}

void nlohmann::detail::dtoa_impl::grisu2_digit_gen()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 601, "M_plus.e >= kAlpha");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 602, "M_plus.e <= kGamma");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 623, "p1 > 0");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 659, "d <= 9");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 757, "p2 <= (std::numeric_limits<std::uint64_t>::max)() / 10");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 766, "d <= 9");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 746, "p2 > delta");
}

void nlohmann::detail::dtoa_impl::grisu2_round()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 545, "len >= 1");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 546, "dist <= delta");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 547, "rest <= delta");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 548, "ten_k > 0");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 573, "buf[len - 1] != '0'");
}

void std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::operator()(uint64_t **a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = **a1;
  v3 = 136315138;
  v4 = v2;
  _os_log_error_impl(&dword_1A4CF5000, a2, OS_LOG_TYPE_ERROR, "Error: event \"%s\" dropped because the payload is neither a dictionary nor null", (uint8_t *)&v3, 0xCu);
}

void nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key()
{
  __assert_rtn("key", "iteration_proxy.hpp", 75, "anchor.m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==()
{
  __assert_rtn("operator==", "iter_impl.hpp", 405, "m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++()
{
  __assert_rtn("operator++", "iter_impl.hpp", 324, "m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key()
{
  __assert_rtn("key", "iter_impl.hpp", 612, "m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*()
{
  __assert_rtn("operator*", "iter_impl.hpp", 242, "m_object != nullptr");
}

{
  __assert_rtn("operator*", "iter_impl.hpp", 248, "m_it.object_iterator != m_object->m_value.object->end()");
}

{
  __assert_rtn("operator*", "iter_impl.hpp", 254, "m_it.array_iterator != m_object->m_value.array->end()");
}

void FrameworkConfiguration::init(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4CF5000, log, OS_LOG_TYPE_ERROR, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (not deserializable)", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void FrameworkConfiguration::init(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_fault_impl(&dword_1A4CF5000, log, OS_LOG_TYPE_FAULT, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (fw end offset [%u] > mmap size [%zu])", (uint8_t *)v3, 0x12u);
}

void FrameworkConfiguration::init(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1A4CF5000, a1, a3, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (invalid version) %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void FrameworkConfiguration::init(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1A4CF5000, a2, a3, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (invalid magic number) %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void FrameworkConfiguration::getExternalConfiguration(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4CF5000, log, OS_LOG_TYPE_DEBUG, "[FrameworkConfiguration] External configs: null", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void FrameworkConfiguration::getExternalConfiguration(_QWORD *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2 - *a1;
  v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl(&dword_1A4CF5000, log, OS_LOG_TYPE_DEBUG, "[FrameworkConfiguration] External configs: present but not parsed (size=%zd)", (uint8_t *)&v4, 0xCu);
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal()
{
  __assert_rtn("scan_literal", "lexer.hpp", 1222, "char_traits<char_type>::to_char_type(current) == literal_text[0]");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string()
{
  __assert_rtn("scan_string", "lexer.hpp", 370, "0x00 <= codepoint and codepoint <= 0x10FFFF");
}

{
  __assert_rtn("scan_string", "lexer.hpp", 250, "current == '\\\"'");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number()
{
  __assert_rtn("scan_number", "lexer.hpp", 928, "false");
}

{
  __assert_rtn("scan_number", "lexer.hpp", 1208, "endptr == token_buffer.data() + token_buffer.size()");
}

{
  __assert_rtn("scan_number", "lexer.hpp", 1175, "endptr == token_buffer.data() + token_buffer.size()");
}

{
  __assert_rtn("scan_number", "lexer.hpp", 1191, "endptr == token_buffer.data() + token_buffer.size()");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget()
{
  __assert_rtn("unget", "lexer.hpp", 1314, "not token_string.empty()");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint()
{
  __assert_rtn("get_codepoint", "lexer.hpp", 188, "0x0000 <= codepoint and codepoint <= 0xFFFF");
}

{
  __assert_rtn("get_codepoint", "lexer.hpp", 162, "current == 'u'");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range()
{
  __assert_rtn("next_byte_in_range", "lexer.hpp", 209, "ranges.size() == 2 or ranges.size() == 4 or ranges.size() == 6");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error()
{
  __assert_rtn("parse_error", "json_sax.hpp", 537, "false");
}

void nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error()
{
  __assert_rtn("parse_error", "json_sax.hpp", 283, "false");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object()
{
  __assert_rtn("end_object", "json_sax.hpp", 450, "not ref_stack.empty()");
}

{
  __assert_rtn("end_object", "json_sax.hpp", 451, "not keep_stack.empty()");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array()
{
  __assert_rtn("end_array", "json_sax.hpp", 502, "not ref_stack.empty()");
}

{
  __assert_rtn("end_array", "json_sax.hpp", 503, "not keep_stack.empty()");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_0("handle_value", "json_sax.hpp", a3, "not keep_stack.empty()");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->()
{
  __assert_rtn("operator->", "iter_impl.hpp", 279, "m_object != nullptr");
}

{
  __assert_rtn("operator->", "iter_impl.hpp", 285, "m_it.object_iterator != m_object->m_value.object->end()");
}

{
  __assert_rtn("operator->", "iter_impl.hpp", 291, "m_it.array_iterator != m_object->m_value.array->end()");
}

void nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("handle_value", "json_sax.hpp", a3, "ref_stack.back()->is_array() or ref_stack.back()->is_object()");
}

{
  OUTLINED_FUNCTION_2_0("handle_value", "json_sax.hpp", a3, "object_element");
}

void analytics_rollover_with_options_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1A4CF5000, v0, v1, "Rollover failed with error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void AnalyticsRolloverWithOptions_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A4CF5000, log, OS_LOG_TYPE_ERROR, "Error: Failed to perform rollover due to %{public}@ (%{public}@)", buf, 0x16u);

}

void analytics_disable_all_transform_sampling_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1A4CF5000, v0, v1, "Failed to disable sampling with error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void analytics_reenable_all_transform_sampling_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1A4CF5000, v0, v1, "Failed to reenable sampling with error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void analytics_notify_tasking_available_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1A4CF5000, v0, v1, "Failed to reconfigure new tasking with error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void CASPIEnter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "Usage of CoreAnalytics is explicitly forbidden on the child side of fork. You must use exec.";
  OUTLINED_FUNCTION_14(&dword_1A4CF5000, MEMORY[0x1E0C81028], a3, "%{public}s", (uint8_t *)&v3);
}

void CoreAnalytics::Client::sendManagementCommandWithReply()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 4.8151e-34);
  OUTLINED_FUNCTION_6(&dword_1A4CF5000, "%s %s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9();
}

void CoreAnalytics::Client::initConnection(int a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2080;
  v5 = xpc_strerror();
  _os_log_error_impl(&dword_1A4CF5000, a2, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v3, 0x12u);
}

void CoreAnalytics::Client::updateDaemonState(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1A4CF5000, a2, a3, "Daemon status did not change; still %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CoreAnalytics::Client::sendCheckinMessage_sync(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1A4CF5000, a2, a3, "Checkin. Running=%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CoreAnalytics::Client::retryXpcMessageHelper_sync()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  OUTLINED_FUNCTION_14(&dword_1A4CF5000, v3, (uint64_t)v3, "Used all retries. Discarding message: %s.", v4);
  if (*(char *)(v0 + 23) < 0)
    OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9();
}

void ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "XPC message reply connection interrupted (daemon probably exited)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CoreAnalytics::Client::handleServerMessage_sync()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  _os_log_fault_impl(&dword_1A4CF5000, v3, OS_LOG_TYPE_FAULT, "#Error: Received unknown event from daemon: %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0)
    OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9();
}

void CoreAnalytics::Client::handleConfigurationChange_sync()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "#Error: Received configuration update from daemon but no config.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "#Error: Received configuration update from daemon but no config size specified.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "#Error: Received configuration update from daemon but was not usable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CoreAnalytics::Client::handleSinkMessageEmit_sync()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "#Error: Received message emit from daemon but no message.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A4CF5000, v0, v1, "#Error: Received message emit from daemon but was not parsable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client29registerConfigurationObserverENSt3__18weak_ptrINS3_21ConfigurationObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke_cold_1(std::__shared_weak_count *a1)
{
  ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
  std::__shared_weak_count::__release_weak(a1);
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_1A4CF5000, v0, v1, "Sending exit barrier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_252_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_1A4CF5000, v0, v1, "Running exit barrier block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 72);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1A4CF5000, a2, OS_LOG_TYPE_FAULT, "Timed out waiting for the exit barrier block. activeSendTransactions=%d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

void try_xpc_to_json(void *a1, uint64_t a2)
{
  __cxa_begin_catch(a1);
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  __cxa_end_catch();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t applesauce::xpc::dyn_cast_or_default()
{
  return MEMORY[0x1E0CFE1D8]();
}

{
  return MEMORY[0x1E0CFE1E0]();
}

{
  return MEMORY[0x1E0CFE1F8]();
}

uint64_t applesauce::xpc::object::to_string(applesauce::xpc::object *this)
{
  return MEMORY[0x1E0CFE200](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1E0DE4190](this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4318](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x1E0DE43E0](a1);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1E0DE4B48]();
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
  MEMORY[0x1E0DE4C38](this);
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
  MEMORY[0x1E0DE4C40](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E4DEAEF8(__p);
}

uint64_t operator delete()
{
  return off_1E4DEAF00();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4DEAF08(__sz);
}

uint64_t operator new()
{
  return off_1E4DEAF10();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1E0C80D28]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C813C0]();
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C81648](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1E0C83B98]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A48](uu, out);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

