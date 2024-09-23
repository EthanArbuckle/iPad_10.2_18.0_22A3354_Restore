@implementation DERequest

+ (id)parseRequest:(id)a3 params:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  DEExecutionContext *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  DEExecutionContext *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  siri::dialogengine::Context *v24;
  std::__shared_weak_count *v25;
  std::string __p;
  std::string v27;
  std::string v28;
  void *v29[2];
  char v30;
  siri::dialogengine::Context *v31;
  std::__shared_weak_count *v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(v29, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v28, (char *)objc_msgSend(v11, "UTF8String"));
  v12 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&v27, (char *)objc_msgSend(v12, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  siri::dialogengine::ParseRequestFromJson((const char *)v29, &v28, &v27, &__p, &v31);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  if (v30 < 0)
    operator delete(v29[0]);
  v13 = [DEExecutionContext alloc];
  v24 = v31;
  v25 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  v16 = -[DEExecutionContext initWithPtr:](v13, "initWithPtr:", &v24);
  v17 = v25;
  if (v25)
  {
    v18 = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v32;
  if (v32)
  {
    v21 = (unint64_t *)&v32->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v16;
}

@end
