@implementation DEGrammarFeature

- (DEGrammarFeature)init
{
  DEGrammarFeature *v2;
  DEGrammarFeature *v3;
  void *__p[2];
  __int128 v6;
  char **v7;
  char *v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEGrammarFeature;
  v2 = -[DEGrammarFeature init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v8 = 0;
    v9 = 0u;
    *(_OWORD *)__p = 0u;
    v6 = 0u;
    v7 = &v8;
    BYTE8(v9) = 1;
    -[DEGrammarFeature setObj:](v2, "setObj:", __p);
    std::__tree<std::string>::destroy((uint64_t)&v7, v8);
    if (SHIBYTE(v6) < 0)
      operator delete(__p[1]);
  }
  return v3;
}

- (NSString)name
{
  void *v2;
  std::string *v3;
  void *v4;
  _BYTE __p[24];
  char *v7[4];
  std::string v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEGrammarFeature Obj](self, "Obj");
  if ((__p[23] & 0x80000000) != 0)
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)__p, *(std::string::size_type *)&__p[8]);
  else
    v8 = *(std::string *)__p;
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v8;
  else
    v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  std::__tree<std::string>::destroy((uint64_t)v7, v7[1]);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  return (NSString *)v4;
}

- (unint64_t)type
{
  int v2;
  unint64_t v3;
  int v5;
  void *__p;
  char v7;
  char *v8[4];

  -[DEGrammarFeature Obj](self, "Obj");
  v2 = v5;
  std::__tree<std::string>::destroy((uint64_t)v8, v8[1]);
  if (v7 < 0)
    operator delete(__p);
  v3 = 1;
  if (v2 == 1)
    v3 = 2;
  if (v2 == 2)
    return 3;
  else
    return v3;
}

- (BOOL)isUniqueValues
{
  int v2;
  void *__p;
  char v5;
  char *v6[3];
  unsigned __int8 v7;

  -[DEGrammarFeature Obj](self, "Obj");
  v2 = v7;
  std::__tree<std::string>::destroy((uint64_t)v6, v6[1]);
  if (v5 < 0)
    operator delete(__p);
  return v2 != 0;
}

- (id)values
{
  void *v3;
  char **v4;
  std::string *p_p;
  void *v6;
  char *v7;
  char **v8;
  BOOL v9;
  std::string __p;
  char v12;
  const void **v13[5];
  char **v14;
  char *v15[2];

  v3 = (void *)objc_opt_new();
  -[DEGrammarFeature Obj](self, "Obj");
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v14, v13);
  std::__tree<std::string>::destroy((uint64_t)v13, (char *)v13[1]);
  if (v12 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  v4 = v14;
  if (v14 != v15)
  {
    do
    {
      if (*((char *)v4 + 55) < 0)
        std::string::__init_copy_ctor_external(&__p, v4[4], (std::string::size_type)v4[5]);
      else
        __p = *(std::string *)(v4 + 4);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v7 = v4[1];
      if (v7)
      {
        do
        {
          v8 = (char **)v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char **)v4[2];
          v9 = *v8 == (char *)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != v15);
  }
  std::__tree<std::string>::destroy((uint64_t)&v14, v15[0]);
  return v3;
}

- (GrammarFeature)Obj
{
  uint64_t v1;
  GrammarFeature *result;

  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 8), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__450);
  return result;
}

- (void)setObj:(GrammarFeature *)a3
{
  objc_copyCppObjectAtomic(&self->_Obj, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__449);
}

- (void).cxx_destruct
{
  std::__tree<std::string>::destroy((uint64_t)&self->_Obj.mName.__r_.var0, (char *)self->_Obj.mName.var0);
  if (*((char *)&self->_Obj.mName.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_Obj.mName.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0uLL;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  *((_BYTE *)self + 64) = 1;
  return self;
}

+ (id)features:(id)a3
{
  id v3;
  uint64_t *Features;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *__p[2];
  char v14;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
  Features = siri::dialogengine::GrammarFeature::GetFeatures((uint64_t)__p);
  if (v14 < 0)
    operator delete(__p[0]);
  v5 = (void *)objc_opt_new();
  if (Features)
  {
    v6 = *Features;
    v7 = Features[1];
    if (*Features != v7)
    {
      v8 = v6 + 32;
      v9 = (_QWORD *)(v6 + 40);
      do
      {
        v10 = objc_opt_new();
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v8 - 32);
        std::string::operator=((std::string *)(v10 + 16), (const std::string *)(v8 - 24));
        v11 = v8 - 32;
        if (v10 + 8 != v8 - 32)
          std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>((uint64_t *)(v10 + 40), *(_QWORD **)v8, v9);
        *(_BYTE *)(v10 + 64) = *(_BYTE *)(v8 + 24);
        objc_msgSend(v5, "addObject:", v10);

        v8 += 64;
        v9 += 8;
      }
      while (v11 + 64 != v7);
    }
  }

  return v5;
}

@end
