@implementation NSString(SNN)

- (uint64_t)initWithCXXString:()SNN
{
  if (*((char *)a3 + 23) < 0)
    a3 = (uint64_t *)*a3;
  return objc_msgSend(a1, "initWithCString:encoding:", a3, 4);
}

- (uint64_t)initWithCXXStringNoCopy:()SNN
{
  uint64_t v3;
  uint64_t v4;

  v3 = a3[1];
  if (*((char *)a3 + 23) >= 0)
  {
    v4 = *((unsigned __int8 *)a3 + 23);
  }
  else
  {
    a3 = (uint64_t *)*a3;
    v4 = v3;
  }
  return objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3, v4, 4, 0);
}

- (uint64_t)initWithOwnedCXXStringNoCopy:()SNN
{
  std::string *v5;
  std::string *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3812000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v5 = (std::string *)operator new();
  v6 = v5;
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v5->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 16);
  }
  v19 = (uint64_t)v6;
  v7 = (uint64_t *)v14[6];
  if (*((char *)v7 + 23) < 0)
  {
    v7 = (uint64_t *)*v7;
    v8 = *(_QWORD *)(v14[6] + 8);
  }
  else
  {
    v8 = *((unsigned __int8 *)v7 + 23);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__NSString_SNN__initWithOwnedCXXStringNoCopy___block_invoke;
  v12[3] = &unk_25137A910;
  v12[4] = &v13;
  v9 = objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:deallocator:", v7, v8, 4, v12);
  _Block_object_dispose(&v13, 8);
  v10 = v19;
  v19 = 0;
  if (v10)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v19, v10);
  return v9;
}

- (_QWORD)cxxString
{
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
}

@end
