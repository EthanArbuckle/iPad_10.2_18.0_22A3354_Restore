@implementation MLArchivingUtils

+ (BOOL)parseModelArchive:(void *)a3 modelType:(int *)a4 compilerVersion:(id *)a5 modelVersion:(id *)a6 error:(id *)a7
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  operator>>((uint64_t)a3);
  if (a4)
    *a4 = 0;
  +[MLModelIOUtils deserializeVersionInfoFromArchive:error:](MLModelIOUtils, "deserializeVersionInfoFromArchive:error:", a3, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    +[MLModelIOUtils deserializeVersionInfoFromArchive:error:](MLModelIOUtils, "deserializeVersionInfoFromArchive:error:", a3, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v14 != 0;
    if (a6 && v14)
      *a6 = objc_retainAutorelease(v14);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)codedObjectURLFromInputArchiver:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  std::string *p_p;
  void *v8;
  void *v9;
  void *v10;
  std::string __p;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_QWORD *)a3;
  if (*(char *)(*(_QWORD *)a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v5 + 8), *(_QWORD *)(v5 + 16));
  }
  else
  {
    v6 = *(_OWORD *)(v5 + 8);
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 24);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v4, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("CodedObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)codedObjectURLFromOutputArchiver:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  std::string *p_p;
  void *v7;
  void *v8;
  void *v9;
  std::string __p;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *((_QWORD *)a3 + 1);
  if (*(char *)(v5 + 55) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v5 + 32), *(_QWORD *)(v5 + 40));
  else
    __p = *(std::string *)(v5 + 32);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v4, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("CodedObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
