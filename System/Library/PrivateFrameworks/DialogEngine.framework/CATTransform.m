@implementation CATTransform

+ (id)capitalize:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  std::string v17;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(v7, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "capitalize");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v17;
  else
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v9;
}

+ (id)lowercase:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  std::string v17;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(v7, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "lowercase");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v17;
  else
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v9;
}

+ (id)lowerFirst:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  std::string v17;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(v7, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "lowerfirst");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v17;
  else
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v9;
}

+ (id)quote:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  std::string v17;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(v7, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "quote");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v17;
  else
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v9;
}

+ (id)uppercase:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  std::string v17;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(v7, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "uppercase");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v17;
  else
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v9;
}

+ (id)upperFirst:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  std::string v17;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(v7, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(__p, "upperfirst");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v17;
  else
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v9;
}

@end
