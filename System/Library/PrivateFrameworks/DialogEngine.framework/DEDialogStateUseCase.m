@implementation DEDialogStateUseCase

- (int)usageCount
{
  int v3;
  char *v4[3];
  char *v5[6];

  -[DEDialogState getUseCase](self, "getUseCase");
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((_QWORD *)v5[4]);
  std::__tree<std::string>::destroy((uint64_t)v5, v5[1]);
  std::__tree<std::string>::destroy((uint64_t)v4, v4[1]);
  return v3;
}

- (double)lastTimestamp
{
  double v3;
  char *v4[3];
  char *v5[6];

  -[DEDialogState getUseCase](self, "getUseCase");
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((_QWORD *)v5[4]);
  std::__tree<std::string>::destroy((uint64_t)v5, v5[1]);
  std::__tree<std::string>::destroy((uint64_t)v4, v4[1]);
  return v3;
}

- (id)allRandomIds
{
  id v2;
  char **v3;
  _QWORD *v4;
  void *v5;
  char *v6;
  char **v7;
  BOOL v8;
  char **v10;
  char *v11[2];
  char *v12[3];
  const void **v13[6];

  -[DEDialogState getUseCase](self, "getUseCase");
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v10, v13);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v10;
  if (v10 != v11)
  {
    do
    {
      v4 = v3 + 4;
      if (*((char *)v3 + 55) < 0)
        v4 = (_QWORD *)*v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

      v6 = v3[1];
      if (v6)
      {
        do
        {
          v7 = (char **)v6;
          v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (char **)v3[2];
          v8 = *v7 == (char *)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != v11);
  }
  std::__tree<std::string>::destroy((uint64_t)&v10, v11[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy(v13[4]);
  std::__tree<std::string>::destroy((uint64_t)v13, (char *)v13[1]);
  std::__tree<std::string>::destroy((uint64_t)v12, v12[1]);
  return v2;
}

- (BOOL)hasAllRandomId:(id)a3
{
  id v4;
  id v5;
  char **v6;
  void *__p[2];
  char v9;
  char *v10[3];
  uint64_t v11;
  char *v12[5];

  v4 = a3;
  -[DEDialogState getUseCase](self, "getUseCase");
  v5 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = (char **)std::__tree<std::string>::find<std::string>((uint64_t)&v11, (const void **)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((_QWORD *)v12[3]);
  std::__tree<std::string>::destroy((uint64_t)&v11, v12[0]);
  std::__tree<std::string>::destroy((uint64_t)v10, v10[1]);

  return v12 != v6;
}

- (id)lastRandomIds
{
  id v2;
  char **v3;
  _QWORD *v4;
  void *v5;
  char *v6;
  char **v7;
  BOOL v8;
  char **v10;
  char *v11[2];
  const void **v12[3];
  char *v13[6];

  -[DEDialogState getUseCase](self, "getUseCase");
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v10, v12);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v10;
  if (v10 != v11)
  {
    do
    {
      v4 = v3 + 4;
      if (*((char *)v3 + 55) < 0)
        v4 = (_QWORD *)*v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

      v6 = v3[1];
      if (v6)
      {
        do
        {
          v7 = (char **)v6;
          v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (char **)v3[2];
          v8 = *v7 == (char *)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != v11);
  }
  std::__tree<std::string>::destroy((uint64_t)&v10, v11[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((_QWORD *)v13[4]);
  std::__tree<std::string>::destroy((uint64_t)v13, v13[1]);
  std::__tree<std::string>::destroy((uint64_t)v12, (char *)v12[1]);
  return v2;
}

- (id)groundingUsage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  double *v9;
  double *v10;
  void *v11;
  DEGroundingInfo *v12;
  std::string *v13;
  void *v14;
  id v15;
  std::string v17;
  void *__p;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE *v23;
  std::string v24;
  char v25[16];
  char *v26[3];
  char *v27[6];

  v4 = a3;
  -[DEDialogState getUseCase](self, "getUseCase");
  v5 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v5, "UTF8String"));
  siri::dialogengine::DialogStateUseCase::GetGroundingUsage((uint64_t)v25, (const void **)&__p, (uint64_t)&v21);
  if (SHIBYTE(v20) < 0)
    operator delete(__p);
  __p = 0;
  v19 = 0;
  v20 = 0;
  v6 = v21;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, v22, (uint64_t)v23, (v23 - (_BYTE *)v22) >> 3);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = __p;
  v9 = v19;
  if (__p != v19)
  {
    v10 = (double *)__p;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      ++v10;
    }
    while (v10 != v9);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v17, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  else
    v17 = v24;
  v12 = [DEGroundingInfo alloc];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = &v17;
  else
    v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13, *(_OWORD *)&v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__r.__words[2]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DEGroundingInfo init:timeStamps:text:](v12, "init:timeStamps:text:", v6, v7, v14);

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  if (v8)
    operator delete(v8);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy((_QWORD *)v27[4]);
  std::__tree<std::string>::destroy((uint64_t)v27, v27[1]);
  std::__tree<std::string>::destroy((uint64_t)v26, v26[1]);

  return v15;
}

- (id)allGroundings
{
  id v2;
  _QWORD **v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  DEGroundingInfo *v7;
  std::string *p_p;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  _QWORD **v14;
  BOOL v15;
  std::string __p;
  void *v18[3];
  _QWORD *v19;
  void *v20;
  _BYTE *v21;
  uint64_t v22;
  std::string v23;
  _QWORD **v24;
  _QWORD *v25[2];
  char *v26[3];
  char *v27[3];
  const void **v28[4];

  -[DEDialogState getUseCase](self, "getUseCase");
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  std::map<std::string,siri::dialogengine::GroundingInfo>::map[abi:ne180100]((uint64_t)&v24, v28);
  v3 = v24;
  if (v24 != v25)
  {
    do
    {
      v4 = v3[8];
      v19 = v3[7];
      v21 = 0;
      v22 = 0;
      v20 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v20, v4, (uint64_t)v3[9], v3[9] - v4);
      if (*((char *)v3 + 111) < 0)
        std::string::__init_copy_ctor_external(&v23, (const std::string::value_type *)v3[11], (std::string::size_type)v3[12]);
      else
        v23 = *(std::string *)(v3 + 11);
      memset(v18, 0, sizeof(v18));
      v5 = v19;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v18, v20, (uint64_t)v21, (v21 - (_BYTE *)v20) >> 3);
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
      else
        __p = v23;
      v7 = [DEGroundingInfo alloc];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[DEGroundingInfo init:timeStamps:text:](v7, "init:timeStamps:text:", v5, v6, v9);
      v11 = v3 + 4;

      if (*((char *)v3 + 55) < 0)
        v11 = (_QWORD *)*v11;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v10, v12);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);

      if (v18[0])
        operator delete(v18[0]);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v23.__r_.__value_.__l.__data_);
      if (v20)
      {
        v21 = v20;
        operator delete(v20);
      }
      v13 = v3[1];
      if (v13)
      {
        do
        {
          v14 = (_QWORD **)v13;
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (_QWORD **)v3[2];
          v15 = *v14 == v3;
          v3 = v14;
        }
        while (!v15);
      }
      v3 = v14;
    }
    while (v14 != v25);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy(v25[0]);
  std::__tree<std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::GroundingInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::GroundingInfo>>>::destroy(v28[1]);
  std::__tree<std::string>::destroy((uint64_t)v27, v27[1]);
  std::__tree<std::string>::destroy((uint64_t)v26, v26[1]);
  return v2;
}

@end
