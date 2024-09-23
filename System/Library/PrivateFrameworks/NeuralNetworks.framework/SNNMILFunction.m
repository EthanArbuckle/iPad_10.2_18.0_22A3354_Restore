@implementation SNNMILFunction

- (SNNMILFunction)init
{

  return 0;
}

- (SNNMILFunction)initWithFunction:(shared_ptr<MIL:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> IRFunction>)a3 name:
{
  __shared_weak_count *cntrl;
  __int128 *ptr;
  char *v6;
  objc_super v8;

  cntrl = a3.__cntrl_;
  ptr = (__int128 *)a3.__ptr_;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILFunction;
  v6 = -[SNNMILFunction init](&v8, sel_init, a3.__ptr_, a3.__cntrl_, a4);
  std::string::operator=((std::string *)(v6 + 8), (const std::string *)cntrl);
  std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]((uint64_t)(v6 + 32), ptr);
  return (SNNMILFunction *)v6;
}

- (basic_string<char,)name
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (*((char *)&result->__r_.var1 + 3) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, (const std::string::value_type *)result->__r_.__value_.var0.var1.__size_, *((_QWORD *)&result->__r_.__value_.var0.var1 + 2));
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.__value_.var0.var1.__size_;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = *(_QWORD *)&result->__r_.var0;
  }
  return result;
}

- (shared_ptr<MIL::IRFunction>)milFunction
{
  _QWORD *v2;
  int64_t var0;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<MIL::IRFunction> result;

  var0 = self->_name.var0;
  *v2 = *(_QWORD *)&self->_name.__r_.var0;
  v2[1] = var0;
  if (var0)
  {
    v4 = (unint64_t *)(var0 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IRFunction *)self;
  return result;
}

- (NSArray)inputNames
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v4 = (_QWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)&self->_name.__r_.var0 + 128))(*(_QWORD *)&self->_name.__r_.var0);
  v5 = v4 + 1;
  v6 = (_QWORD *)*v4;
  if ((_QWORD *)*v4 != v4 + 1)
  {
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", v6 + 4);
      objc_msgSend(v3, "addObject:", v7);

      v8 = (_QWORD *)v6[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v6[2];
          v10 = *v9 == (_QWORD)v6;
          v6 = v9;
        }
        while (!v10);
      }
      v6 = v9;
    }
    while (v9 != v5);
  }
  return (NSArray *)v3;
}

- (id)inputWithName:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  int v14;
  std::string::size_type v15;
  const std::string::value_type *v16;
  unsigned __int8 *v17;
  void **p_p;
  uint64_t v19;
  void *v20;
  int v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v28;
  std::string v29;
  void *__p;
  size_t v31;
  uint64_t v32;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cxxString");
  }
  else
  {
    __p = 0;
    v31 = 0;
    v32 = 0;
  }
  v6 = (_QWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)&self->_name.__r_.var0 + 128))(*(_QWORD *)&self->_name.__r_.var0);
  v7 = v6 + 1;
  v8 = (_QWORD *)*v6;
  if ((_QWORD *)*v6 == v6 + 1)
  {
LABEL_27:
    v25 = 0;
    goto LABEL_33;
  }
  v9 = HIBYTE(v32);
  v10 = __p;
  v11 = v31;
  if (v32 >= 0)
    v12 = HIBYTE(v32);
  else
    v12 = v31;
  while (1)
  {
    v13 = *((unsigned __int8 *)v8 + 55);
    v14 = (char)v13;
    v15 = v8[5];
    if ((v13 & 0x80u) != 0)
      v13 = v8[5];
    if (v12 != v13)
      goto LABEL_21;
    v16 = (const std::string::value_type *)v8[4];
    v17 = v14 >= 0 ? (unsigned __int8 *)(v8 + 4) : (unsigned __int8 *)v8[4];
    if ((v9 & 0x80) != 0)
      break;
    if (!(_DWORD)v9)
      goto LABEL_28;
    p_p = &__p;
    v19 = v9;
    while (*(unsigned __int8 *)p_p == *v17)
    {
      p_p = (void **)((char *)p_p + 1);
      ++v17;
      if (!--v19)
        goto LABEL_28;
    }
LABEL_21:
    v22 = (_QWORD *)v8[1];
    if (v22)
    {
      do
      {
        v23 = v22;
        v22 = (_QWORD *)*v22;
      }
      while (v22);
    }
    else
    {
      do
      {
        v23 = (_QWORD *)v8[2];
        v24 = *v23 == (_QWORD)v8;
        v8 = v23;
      }
      while (!v24);
    }
    v8 = v23;
    if (v23 == v7)
      goto LABEL_27;
  }
  v28 = v5;
  v20 = v10;
  v21 = memcmp(v10, v17, v11);
  v10 = v20;
  v5 = v28;
  if (v21)
    goto LABEL_21;
LABEL_28:
  v26 = v8[7];
  if (v14 < 0)
    std::string::__init_copy_ctor_external(&v29, v16, v15);
  else
    v29 = *(std::string *)(v8 + 4);
  +[SNNMILContext valueForIRValueType:name:](SNNMILContext, "valueForIRValueType:name:", v26, &v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
LABEL_33:
  if (SHIBYTE(v32) < 0)
    operator delete(__p);

  return v25;
}

- (NSArray)outputNames
{
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v4 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)&self->_name.__r_.var0 + 48))(*(_QWORD *)&self->_name.__r_.var0);
  v5 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 88))(v4);
  v6 = *v5;
  v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", v6);
      objc_msgSend(v3, "addObject:", v8);

      v6 += 24;
    }
    while (v6 != v7);
  }
  return (NSArray *)v3;
}

- (int64_t)operationCount
{
  uint64_t v2;
  uint64_t v3;

  v2 = (*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)&self->_name.__r_.var0 + 48))(*(_QWORD *)&self->_name.__r_.var0, a2);
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 64))(v2);
  return (uint64_t)(*(_QWORD *)(*(_QWORD *)v3 + 8) - **(_QWORD **)v3) >> 4;
}

- (id)operationAtIndex:(int64_t)a3
{
  uint64_t v4;
  MIL::IRObject *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  MIL::IRArgument *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  void *v18;
  SNNMILNamedArgument *v19;
  SNNMILNamedArgument *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  BOOL v25;
  void *v26;
  _QWORD *i;
  void *v28;
  void *v29;
  SNNMILNamedArgument *v30;
  void *v31;
  uint64_t v32;
  MIL::IRNamedValueType **v33;
  MIL::IRNamedValueType **v34;
  uint64_t Type;
  uint64_t Name;
  __int128 v37;
  uint64_t v38;
  void *v39;
  SNNMILOperation *v40;
  void *v42;
  _QWORD *v43;
  std::string v44;
  MIL::IRArgument *v45;
  std::__shared_weak_count *v46;

  v4 = (*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)&self->_name.__r_.var0 + 48))(*(_QWORD *)&self->_name.__r_.var0, a2);
  v5 = *(MIL::IRObject **)(**(_QWORD **)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 64))(v4) + 16 * a3);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", (*(uint64_t (**)(MIL::IRObject *))(*(_QWORD *)v5 + 56))(v5));
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v7 = (_QWORD *)(*(uint64_t (**)(MIL::IRObject *))(*(_QWORD *)v5 + 160))(v5);
  v10 = (_QWORD *)*v7;
  v8 = v7 + 1;
  v9 = v10;
  if (v10 == v8)
    goto LABEL_25;
  v43 = v8;
  do
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", v9 + 4);
    v12 = v9[7];
    v13 = v9[8];
    while (v12 != v13)
    {
      v15 = *(MIL::IRArgument **)v12;
      v14 = *(std::__shared_weak_count **)(v12 + 8);
      v45 = *(MIL::IRArgument **)v12;
      v46 = v14;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }
      if ((*(unsigned int (**)(MIL::IRArgument *))(*(_QWORD *)v15 + 24))(v15))
      {
        +[SNNMILContext valueForIRValue:](SNNMILContext, "valueForIRValue:", MIL::IRArgument::GetValue(v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_13;
        v19 = -[SNNMILNamedArgument initWithKey:value:]([SNNMILNamedArgument alloc], "initWithKey:value:", v11, v18);
        objc_msgSend(v6, "addObject:", v19);
      }
      else
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", MIL::IRArgument::GetName(v15));
        v19 = -[SNNMILNamedValue initWithName:]([SNNMILNamedValue alloc], "initWithName:", v18);
        v20 = -[SNNMILNamedArgument initWithKey:value:]([SNNMILNamedArgument alloc], "initWithKey:value:", v11, v19);
        objc_msgSend(v6, "addObject:", v20);

      }
LABEL_13:

      if (v14)
      {
        v21 = (unint64_t *)&v14->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      v12 += 16;
    }

    v23 = (_QWORD *)v9[1];
    if (v23)
    {
      do
      {
        v24 = v23;
        v23 = (_QWORD *)*v23;
      }
      while (v23);
    }
    else
    {
      do
      {
        v24 = (_QWORD *)v9[2];
        v25 = *v24 == (_QWORD)v9;
        v9 = v24;
      }
      while (!v25);
    }
    v9 = v24;
  }
  while (v24 != v43);
LABEL_25:
  v26 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  for (i = *(_QWORD **)(MIL::IRObject::GetAttributes(v5) + 16); i; i = (_QWORD *)*i)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", i + 2);
    +[SNNMILContext valueForIRValue:](SNNMILContext, "valueForIRValue:", i[5]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = -[SNNMILNamedArgument initWithKey:value:]([SNNMILNamedArgument alloc], "initWithKey:value:", v28, v29);
      objc_msgSend(v26, "addObject:", v30);

    }
  }
  v31 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v32 = (*(uint64_t (**)(MIL::IRObject *))(*(_QWORD *)v5 + 176))(v5);
  v33 = *(MIL::IRNamedValueType ***)v32;
  v34 = *(MIL::IRNamedValueType ***)(v32 + 8);
  if (*(MIL::IRNamedValueType ***)v32 != v34)
  {
    while (1)
    {
      Type = MIL::IRNamedValueType::GetType(*v33);
      Name = MIL::IRNamedValueType::GetName(*v33);
      if (*(char *)(Name + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v44, *(const std::string::value_type **)Name, *(_QWORD *)(Name + 8));
      }
      else
      {
        v37 = *(_OWORD *)Name;
        v44.__r_.__value_.__r.__words[2] = *(_QWORD *)(Name + 16);
        *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v37;
      }
      +[SNNMILContext valueForIRValueType:name:](SNNMILContext, "valueForIRValueType:name:", Type, &v44);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        break;
      operator delete(v44.__r_.__value_.__l.__data_);
      if (v39)
        goto LABEL_37;
LABEL_38:

      v33 += 2;
      if (v33 == v34)
        goto LABEL_39;
    }
    if (!v38)
      goto LABEL_38;
LABEL_37:
    objc_msgSend(v31, "addObject:", v39);
    goto LABEL_38;
  }
LABEL_39:
  v40 = -[SNNMILOperation initWithOperatorName:inputs:attributes:outputs:]([SNNMILOperation alloc], "initWithOperatorName:inputs:attributes:outputs:", v42, v6, v26, v31);

  return v40;
}

- (NSEnumerator)operationEnumerator
{
  return (NSEnumerator *)self->_function.__ptr_;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function.__ptr_, 0);
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)&self->_name.__r_.var0);
  if (*((char *)&self->_name.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_name.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
