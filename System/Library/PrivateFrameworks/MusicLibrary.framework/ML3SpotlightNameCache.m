@implementation ML3SpotlightNameCache

- (id)_initWithLibrary:(id)a3 cancelHandler:(id)a4
{
  id v7;
  uint64_t (**v8)(_QWORD);
  ML3SpotlightNameCache *v9;
  ML3SpotlightNameCache *v10;
  ML3MusicLibrary *library;
  ML3SpotlightNameCache *v12;
  _QWORD v14[4];
  __CFString *v15;
  ML3SpotlightNameCache *v16;
  uint64_t (**v17)(_QWORD);
  objc_super v18;

  v7 = a3;
  v8 = (uint64_t (**)(_QWORD))a4;
  v18.receiver = self;
  v18.super_class = (Class)ML3SpotlightNameCache;
  v9 = -[ML3SpotlightNameCache init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    library = v10->_library;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke;
    v14[3] = &unk_1E5B63BC8;
    v15 = CFSTR("SELECT name, name_order FROM sort_map");
    v16 = v10;
    v17 = v8;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v14);

  }
  if (v8 && (v8[2](v8) & 1) != 0)
    v12 = 0;
  else
    v12 = v10;

  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3SpotlightNameCache;
  -[ML3SpotlightNameCache dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  void **next;
  void **v4;
  void **value;

  objc_storeStrong((id *)&self->_library, 0);
  next = (void **)self->_map.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void **)*next;
      if (*((char *)next + 47) < 0)
        operator delete(next[3]);
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_map.__table_.__bucket_list_.__ptr_.__value_;
  self->_map.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

void __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke_2;
  v4[3] = &unk_1E5B63BA0;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

void __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  unint64_t v4;
  id v8;
  id v9;
  unint64_t v10;
  std::string::size_type v11;
  uint64_t v12;
  unint64_t v13;
  uint8x8_t v14;
  std::string **v15;
  std::string *i;
  std::string::size_type size;
  std::string **v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  int8x8_t prime;
  void *v25;
  void *v26;
  uint64_t v27;
  std::string *v28;
  std::string::size_type v29;
  uint8x8_t v30;
  unint64_t v31;
  uint8x8_t v32;
  uint64_t v33;
  std::string *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::string **v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  std::string __str;

  v8 = a2;
  v9 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v8, "cStringForColumnIndex:", 0));
  v10 = objc_msgSend(v8, "int64ForColumnIndex:", 1);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v13)
        v4 = v10 % v13;
    }
    else
    {
      v4 = (v13 - 1) & v10;
    }
    v15 = *(std::string ***)(*(_QWORD *)(v12 + 8) + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = (std::string *)i->__r_.__value_.__r.__words[0])
      {
        size = i->__r_.__value_.__l.__size_;
        if (size == v10)
        {
          if (i->__r_.__value_.__r.__words[2] == v10)
            goto LABEL_74;
        }
        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (size >= v13)
              size %= v13;
          }
          else
          {
            size &= v13 - 1;
          }
          if (size != v4)
            break;
        }
      }
    }
  }
  i = (std::string *)operator new(0x30uLL);
  v18 = (std::string **)(v12 + 24);
  i->__r_.__value_.__r.__words[0] = 0;
  i->__r_.__value_.__l.__size_ = v11;
  i->__r_.__value_.__r.__words[2] = v11;
  i[1].__r_.__value_.__r.__words[0] = 0;
  i[1].__r_.__value_.__l.__size_ = 0;
  i[1].__r_.__value_.__r.__words[2] = 0;
  v19 = (float)(unint64_t)(*(_QWORD *)(v12 + 32) + 1);
  v20 = *(float *)(v12 + 40);
  if (!v13 || (float)(v20 * (float)v13) < v19)
  {
    v21 = 1;
    if (v13 >= 3)
      v21 = (v13 & (v13 - 1)) != 0;
    v22 = v21 | (2 * v13);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      prime = (int8x8_t)v23;
    else
      prime = (int8x8_t)v22;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v13 = *(_QWORD *)(v12 + 16);
    if (*(_QWORD *)&prime > v13)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v13)
    {
      v31 = vcvtps_u32_f32((float)*(unint64_t *)(v12 + 32) / *(float *)(v12 + 40));
      if (v13 < 3 || (v32 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        v31 = std::__next_prime(v31);
      }
      else
      {
        v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2)
          v31 = v33;
      }
      if (*(_QWORD *)&prime <= v31)
        prime = (int8x8_t)v31;
      if (*(_QWORD *)&prime >= v13)
      {
        v13 = *(_QWORD *)(v12 + 16);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v25 = operator new(8 * *(_QWORD *)&prime);
          v26 = *(void **)(v12 + 8);
          *(_QWORD *)(v12 + 8) = v25;
          if (v26)
            operator delete(v26);
          v27 = 0;
          *(int8x8_t *)(v12 + 16) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v12 + 8) + 8 * v27++) = 0;
          while (*(_QWORD *)&prime != v27);
          v28 = *v18;
          if (*v18)
          {
            v29 = v28->__r_.__value_.__l.__size_;
            v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(_QWORD *)&prime)
                v29 %= *(_QWORD *)&prime;
            }
            else
            {
              v29 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v12 + 8) + 8 * v29) = v18;
            v34 = (std::string *)v28->__r_.__value_.__r.__words[0];
            if (v28->__r_.__value_.__r.__words[0])
            {
              do
              {
                v35 = v34->__r_.__value_.__l.__size_;
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(_QWORD *)&prime)
                    v35 %= *(_QWORD *)&prime;
                }
                else
                {
                  v35 &= *(_QWORD *)&prime - 1;
                }
                if (v35 != v29)
                {
                  v36 = *(_QWORD *)(v12 + 8);
                  if (!*(_QWORD *)(v36 + 8 * v35))
                  {
                    *(_QWORD *)(v36 + 8 * v35) = v28;
                    goto LABEL_55;
                  }
                  v28->__r_.__value_.__r.__words[0] = v34->__r_.__value_.__r.__words[0];
                  v34->__r_.__value_.__r.__words[0] = **(_QWORD **)(*(_QWORD *)(v12 + 8) + 8 * v35);
                  **(_QWORD **)(*(_QWORD *)(v12 + 8) + 8 * v35) = v34;
                  v34 = v28;
                }
                v35 = v29;
LABEL_55:
                v28 = v34;
                v34 = (std::string *)v34->__r_.__value_.__r.__words[0];
                v29 = v35;
              }
              while (v34);
            }
          }
          v13 = (unint64_t)prime;
          goto LABEL_59;
        }
        v41 = *(void **)(v12 + 8);
        *(_QWORD *)(v12 + 8) = 0;
        if (v41)
          operator delete(v41);
        v13 = 0;
        *(_QWORD *)(v12 + 16) = 0;
      }
    }
LABEL_59:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v11 >= v13)
        v4 = v11 % v13;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v13 - 1) & v11;
    }
  }
  v37 = *(_QWORD *)(v12 + 8);
  v38 = *(std::string ***)(v37 + 8 * v4);
  if (v38)
  {
    i->__r_.__value_.__r.__words[0] = (std::string::size_type)*v38;
LABEL_72:
    *v38 = i;
    goto LABEL_73;
  }
  i->__r_.__value_.__r.__words[0] = (std::string::size_type)*v18;
  *v18 = i;
  *(_QWORD *)(v37 + 8 * v4) = v18;
  if (i->__r_.__value_.__r.__words[0])
  {
    v39 = *(_QWORD *)(i->__r_.__value_.__r.__words[0] + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v39 >= v13)
        v39 %= v13;
    }
    else
    {
      v39 &= v13 - 1;
    }
    v38 = (std::string **)(*(_QWORD *)(v12 + 8) + 8 * v39);
    goto LABEL_72;
  }
LABEL_73:
  ++*(_QWORD *)(v12 + 32);
LABEL_74:
  std::string::operator=(i + 1, &__str);
  v40 = *(_QWORD *)(a1 + 40);
  if (v40)
    LOBYTE(v40) = (*(uint64_t (**)(void))(v40 + 16))();
  *a4 = v40;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && __nameCacheOnce != -1)
    dispatch_once(&__nameCacheOnce, &__block_literal_global_15755);
}

+ (id)copyFromLibrary:(id)a3 cancelHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  if (__nameCacheOnce != -1)
    dispatch_once(&__nameCacheOnce, &__block_literal_global_15755);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15756;
  v20 = __Block_byref_object_dispose__15757;
  v21 = 0;
  v7 = __nameCacheLoadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke;
  block[3] = &unk_1E5B63B78;
  v13 = v5;
  v14 = v6;
  v15 = &v16;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, block);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;

  if (__nameCache && *(_QWORD *)(__nameCache + 56) == a1[4])
    v2 = 0;
  else
    v2 = -[ML3SpotlightNameCache _initWithLibrary:cancelHandler:]([ML3SpotlightNameCache alloc], "_initWithLibrary:cancelHandler:", a1[4], a1[5]);
  v3 = __nameCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke_2;
  block[3] = &unk_1E5B65E48;
  v4 = a1[6];
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_sync(v3, block);

}

void __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)&__nameCache, v2);
    ML3SpotlightNameCacheTimer();
  }
  v3 = (void *)__nameCache;
  if (__nameCache)
    *(_BYTE *)(__nameCache + 48) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

@end
