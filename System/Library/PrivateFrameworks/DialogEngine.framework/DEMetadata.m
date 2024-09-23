@implementation DEMetadata

- (DEMetadata)init
{
  DEMetadata *v2;
  DEMetadata *v3;
  void *v5[20];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DEMetadata;
  v2 = -[DEMetadata init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    LOBYTE(v5[0]) = 0;
    v6 = 0;
    -[DEMetadata setObj:](v2, "setObj:", v5);
    if (v6)
      siri::dialogengine::PropertyBase::~PropertyBase(v5);
  }
  return v3;
}

- (DEMetadata)initWithOpt:(const void *)a3
{
  DEMetadata *v4;
  void *v6[20];
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DEMetadata;
  v4 = -[DEMetadata init](&v8, sel_init);
  if (v4)
  {
    std::__optional_copy_base<siri::dialogengine::ObjectInput,false>::__optional_copy_base[abi:ne180100]((siri::dialogengine::PropertyBase *)v6, (uint64_t)a3);
    -[DEMetadata setObj:](v4, "setObj:", v6);
    if (v7)
      siri::dialogengine::PropertyBase::~PropertyBase(v6);
  }
  return v4;
}

- (id)sampleValues:(id)a3
{
  -[DEMetadata sampleValues:locale:](self, "sampleValues:locale:", a3, &stru_1E793AF80);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sampleValues:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  std::string *p_p;
  void *v13;
  int v14;
  id v15;
  id v16;
  std::string __p;
  uint64_t v19;
  uint64_t v20;
  void *v21[20];
  unsigned __int8 v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "This")
    && (objc_msgSend(v7, "isEqualToString:", &stru_1E793AF80) & 1) != 0
    && (-[DEMetadata Obj](self, "Obj"), v22))
  {
    siri::dialogengine::PropertyBase::GetSampleValueAsArray((siri::dialogengine::PropertyBase *)v21, &v19);
    v9 = v19;
    for (i = v20; v9 != i; v9 += 24)
    {
      if (*(char *)(v9 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v9, *(_QWORD *)(v9 + 8));
      }
      else
      {
        v11 = *(_OWORD *)v9;
        __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v9 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v19;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    v14 = v22;
    v15 = v8;
    if (v14)
      siri::dialogengine::PropertyBase::~PropertyBase(v21);
  }
  else
  {
    v16 = v8;
  }

  return v8;
}

- (optional<siri::dialogengine::ObjectInput>)Obj
{
  uint64_t v1;
  optional<siri::dialogengine::ObjectInput> *result;

  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 8), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__23792);
  return result;
}

- (void)setObj:(optional<siri::dialogengine::ObjectInput> *)a3
{
  objc_copyCppObjectAtomic(&self->_Obj, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__23791);
}

- (void).cxx_destruct
{
  if (self[2]._Obj.var0.var1.mName.__r_.__value_.var0.var0.__data_[8])
    siri::dialogengine::PropertyBase::~PropertyBase((void **)&self->_Obj);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 168) = 0;
  return self;
}

+ (id)schemaInput:(id)a3 typeName:(id)a4 inputName:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  uint64_t v11;
  int v12;
  DEMetadata *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v18[2];
  char v19;
  void *__p;
  std::string v21;
  std::string v22;
  std::string v23;
  std::string v24;
  std::string v25;
  std::string v26;
  __int16 v27;
  char v28;
  int v29;
  unsigned __int8 v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  void (**v33)(siri::dialogengine::ObjectInput *__hidden);
  std::string v34;
  std::string v35;
  std::string v36;
  std::string v37;
  std::string v38;
  std::string v39;
  __int16 v40;
  char v41;
  int v42;
  char v43;

  v7 = a4;
  v8 = a5;
  v9 = (const char *)objc_msgSend(a3, "This");
  LOBYTE(v33) = 0;
  v43 = 0;
  v10 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  siri::dialogengine::ObjectRegistry::GetObject((uint64_t)v9, (const std::string::value_type **)&__p, &v31);
  if (v21.__r_.__value_.__s.__data_[15] < 0)
    operator delete(__p);
  v11 = v31;
  if (v31)
  {
    std::string::basic_string[abi:ne180100]<0>(v18, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    siri::dialogengine::ObjectSchema::GetInput(v11, v9, (const void **)v18, 0, (uint64_t)&__p);
    v12 = v30;
    if (v43 == v30)
    {
      if (!v43)
      {
LABEL_11:
        if (v12)
          siri::dialogengine::PropertyBase::~PropertyBase(&__p);
        if (v19 < 0)
          operator delete(v18[0]);
        goto LABEL_15;
      }
      std::string::operator=(&v34, &v21);
      std::string::operator=(&v35, &v22);
      std::string::operator=(&v36, &v23);
      std::string::operator=(&v37, &v24);
      std::string::operator=(&v38, &v25);
      std::string::operator=(&v39, &v26);
      v40 = v27;
      v41 = v28;
      v42 = v29;
    }
    else if (v43)
    {
      siri::dialogengine::PropertyBase::~PropertyBase((void **)&v33);
      v43 = 0;
    }
    else
    {
      siri::dialogengine::PropertyBase::PropertyBase((siri::dialogengine::PropertyBase *)&v33, (const siri::dialogengine::PropertyBase *)&__p);
      v33 = &off_1E793ADA8;
      v42 = v29;
      v43 = 1;
    }
    v12 = v30;
    goto LABEL_11;
  }
LABEL_15:
  v13 = -[DEMetadata initWithOpt:]([DEMetadata alloc], "initWithOpt:", &v33);
  v14 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v43)
    siri::dialogengine::PropertyBase::~PropertyBase((void **)&v33);

  return v13;
}

@end
