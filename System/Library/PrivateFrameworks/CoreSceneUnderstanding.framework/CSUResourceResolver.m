@implementation CSUResourceResolver

+ (basic_string<char,)pathForResource:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string *v18;
  std::string *v19;
  int v20;
  uint64_t v21;
  std::string *v22;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  std::string v24;
  std::string v25;
  std::string __p;

  v6 = v3;
  objc_msgSend_bundleForClass_(MEMORY[0x24BDD1488], v2, v1, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourcePath(v8, v9, v10, v11, v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (std::string *)objc_msgSend_UTF8String(v13, v14, v15, v16, v17);
  memset(&v25, 0, sizeof(v25));
  v19 = (std::string *)((char *)v18 - 1);
  do
  {
    v20 = v19->__r_.__value_.__s.__data_[1];
    v19 = (std::string *)((char *)v19 + 1);
  }
  while (v20);
  sub_23A000B20(&v25, v18, v19);
  memset(&v24, 0, sizeof(v24));
  v21 = *(unsigned __int8 *)(v6 + 23);
  if ((v21 & 0x80u) == 0)
    v22 = (std::string *)v6;
  else
    v22 = *(std::string **)v6;
  if ((v21 & 0x80u) != 0)
    v21 = *(_QWORD *)(v6 + 8);
  sub_23A000B20(&v24, v22, (std::string *)((char *)v22 + v21));
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    sub_239FF1F64(&__p, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  else
    __p = v25;
  sub_23A000830((uint64_t)&__p, (std::__fs::filesystem::path *)&v24);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_239FF1F64(retstr, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_19;
    }
    else if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_19;
    }
  }
  else
  {
    retstr->var0.var0 = (__rep)__p;
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    {
LABEL_19:
      operator delete(v24.__r_.__value_.__l.__data_);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_20;
      goto LABEL_17;
    }
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
LABEL_20:
    operator delete(v25.__r_.__value_.__l.__data_);
LABEL_17:

  return result;
}

@end
