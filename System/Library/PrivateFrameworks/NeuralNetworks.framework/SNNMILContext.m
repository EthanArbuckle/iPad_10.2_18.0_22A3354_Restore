@implementation SNNMILContext

- (SNNMILContext)init
{
  SNNMILContext *v2;
  uint64_t v3;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNNMILContext;
  v2 = -[SNNMILContext init](&v6, sel_init);
  MIL::Opsets::Common::CreateMILContext((MIL::Opsets::Common *)v2);
  std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]<MIL::MILContext,std::default_delete<MIL::MILContext>,void>(&v2->_context.__ptr_, &v5);
  v3 = v5;
  v5 = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  MEMORY[0x2494ED5D8](&v2->_opsetName, "ios15");
  return v2;
}

- (SNNMILContext)initWithOpsetName:(id)a3
{
  id v4;
  SNNMILContext *v5;
  uint64_t v6;
  void **p_opsetName;
  __int128 v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SNNMILContext;
  v5 = -[SNNMILContext init](&v11, sel_init);
  MIL::Opsets::Common::CreateMILContext((MIL::Opsets::Common *)v5);
  std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]<MIL::MILContext,std::default_delete<MIL::MILContext>,void>(&v5->_context.__ptr_, (uint64_t *)&v9);
  v6 = v9;
  *(_QWORD *)&v9 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  if (v4)
  {
    objc_msgSend(v4, "cxxString");
  }
  else
  {
    v9 = 0uLL;
    v10 = 0;
  }
  p_opsetName = (void **)&v5->_opsetName;
  if (*((char *)&v5->_opsetName.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(*p_opsetName);
  *(_OWORD *)p_opsetName = v9;
  *((_QWORD *)&v5->_opsetName.__r_.__value_.var0.var1 + 2) = v10;

  return v5;
}

- (void)dealloc
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  objc_super v6;
  __int128 v7;

  v7 = 0uLL;
  std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]((uint64_t)&self->_context, &v7);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SNNMILContext;
  -[SNNMILContext dealloc](&v6, sel_dealloc);
}

- (shared_ptr<MIL::MILContext>)context
{
  MILContext **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<MIL::MILContext> result;

  cntrl = self->_context.__cntrl_;
  *v2 = self->_context.__ptr_;
  v2[1] = (MILContext *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MILContext *)self;
  return result;
}

- (const)platformOpset
{
  return (const void *)MIL::MILContext::GetOpset();
}

- (unique_ptr<const)milValueForString:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>> v6;
  void *__p;
  char v8;
  uint64_t v9;

  v4 = v3;
  v5 = a3;
  MIL::IRTensorValueType::MakeScalar();
  if (v5)
  {
    objc_msgSend(v5, "cxxString");
  }
  else
  {
    __p = 0;
    v8 = 0;
  }
  MIL::IRTensorValueType::MakeStringValue();
  if (v8 < 0)
    operator delete(__p);
  *v4 = v9;

  return v6;
}

- (unique_ptr<const)milValueForTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5
{
  _QWORD *v5;
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t i;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t Scalar;
  void *v31;
  unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>> v32;
  unint64_t v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *__p;
  uint64_t *v46;
  uint64_t *v47;
  _BYTE v48[128];
  uint64_t v49;

  v9 = v5;
  v49 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  __p = 0;
  v46 = 0;
  v47 = 0;
  v36 = v10;
  if (v10)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v12)
    {
      v33 = a5;
      v34 = a3;
      v35 = v9;
      v13 = *(_QWORD *)v42;
      v14 = 1;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "unsignedIntegerValue", v33, v34, v35);
          v18 = MIL::IRConstantDimension::Make((MIL::IRConstantDimension *)self->_context.__ptr_, (MILContext *)objc_msgSend(v16, "unsignedIntegerValue"));
          v19 = v18;
          v20 = v46;
          if (v46 >= v47)
          {
            v22 = ((char *)v46 - (_BYTE *)__p) >> 3;
            if ((unint64_t)(v22 + 1) >> 61)
              std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
            v23 = ((char *)v47 - (_BYTE *)__p) >> 2;
            if (v23 <= v22 + 1)
              v23 = v22 + 1;
            if ((unint64_t)((char *)v47 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
              v24 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v24 = v23;
            if (v24)
              v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v47, v24);
            else
              v25 = 0;
            v26 = (uint64_t *)&v25[8 * v22];
            *v26 = v19;
            v21 = v26 + 1;
            v28 = (char *)__p;
            v27 = (char *)v46;
            if (v46 != __p)
            {
              do
              {
                v29 = *((_QWORD *)v27 - 1);
                v27 -= 8;
                *--v26 = v29;
              }
              while (v27 != v28);
              v27 = (char *)__p;
            }
            __p = v26;
            v46 = v21;
            v47 = (uint64_t *)&v25[8 * v24];
            if (v27)
              operator delete(v27);
          }
          else
          {
            *v46 = v18;
            v21 = v20 + 1;
          }
          v14 *= v17;
          v46 = v21;
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v12);
      a3 = v34;
      v9 = v35;
    }
    else
    {
      v14 = 1;
    }

  }
  else
  {
    v14 = 1;
  }
  if (v36)
    Scalar = MIL::IRTensorValueType::MakeWithShape();
  else
    Scalar = MIL::IRTensorValueType::MakeScalar();
  switch((*(unsigned int (**)(uint64_t))(*(_QWORD *)Scalar + 88))(Scalar))
  {
    case 2u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<BOOL>::__init_with_size[abi:ne180100]<BOOL *,BOOL *>(&v38, a3, (_BYTE *)a3 + v14, v14);
      MIL::IRTensorValueType::MakeBoolValue();
      v31 = v38;
      *v9 = v37;
      if (v31)
        goto LABEL_48;
      break;
    case 4u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<MIL::Fp16>::__init_with_size[abi:ne180100]<MIL::Fp16*,MIL::Fp16*>(&v38, a3, (uint64_t)a3 + 2 * v14, v14);
      MIL::IRTensorValueType::MakeFloat16Value();
      goto LABEL_46;
    case 5u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v38, a3, (uint64_t)a3 + 4 * v14, v14);
      MIL::IRTensorValueType::MakeFloat32Value();
      goto LABEL_46;
    case 6u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v38, a3, (uint64_t)a3 + 8 * v14, v14);
      MIL::IRTensorValueType::MakeFloat64Value();
      goto LABEL_46;
    case 9u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<signed char>::__init_with_size[abi:ne180100]<signed char *,signed char *>(&v38, a3, (uint64_t)a3 + v14, v14);
      MIL::IRTensorValueType::MakeInt8Value();
      goto LABEL_46;
    case 0xAu:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<short>::__init_with_size[abi:ne180100]<short *,short *>(&v38, a3, (uint64_t)a3 + 2 * v14, v14);
      MIL::IRTensorValueType::MakeInt16Value();
      goto LABEL_46;
    case 0xBu:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v38, a3, (uint64_t)a3 + 4 * v14, v14);
      MIL::IRTensorValueType::MakeInt32Value();
      goto LABEL_46;
    case 0xCu:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v38, a3, (uint64_t)a3 + 8 * v14, v14);
      MIL::IRTensorValueType::MakeInt64Value();
      goto LABEL_46;
    case 0xEu:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v38, a3, (uint64_t)a3 + v14, v14);
      MIL::IRTensorValueType::MakeUInt8Value();
      goto LABEL_46;
    case 0xFu:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(&v38, a3, (uint64_t)a3 + 2 * v14, v14);
      MIL::IRTensorValueType::MakeUInt16Value();
      goto LABEL_46;
    case 0x10u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v38, a3, (uint64_t)a3 + 4 * v14, v14);
      MIL::IRTensorValueType::MakeUInt32Value();
      goto LABEL_46;
    case 0x11u:
      v38 = 0;
      v39 = 0;
      v40 = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v38, a3, (uint64_t)a3 + 8 * v14, v14);
      MIL::IRTensorValueType::MakeUInt64Value();
LABEL_46:
      v31 = v38;
      *v9 = v37;
      if (v31)
      {
        v39 = v31;
LABEL_48:
        operator delete(v31);
      }
      break;
    default:
      *v9 = 0;
      break;
  }
  if (__p)
  {
    v46 = (uint64_t *)__p;
    operator delete(__p);
  }

  return v32;
}

- (unique_ptr<const)milValueForScalarWithBytes:(void *)a3 dataType:(unint64_t)a4
{
  return (unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>>)-[SNNMILContext milValueForTensorWithBytes:shape:dataType:](self, "milValueForTensorWithBytes:shape:dataType:", a3, 0, a4);
}

- (unique_ptr<const)milValueForTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  MIL::IRTensorValueType *Scalar;
  unsigned __int8 *v32;
  uint64_t v33;
  unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>> v34;
  void **v35;
  id v36;
  id v37;
  void *v38;
  char v39;
  void *__p[2];
  char v41;
  void *v42;
  char v43;
  uint64_t v44;
  _OWORD v45[2];
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  uint64_t *v52;
  char *v53;
  void **v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v9 = a4;
  v36 = a6;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v14, "unsignedIntegerValue", v35);
        v15 = MIL::IRConstantDimension::Make((MIL::IRConstantDimension *)self->_context.__ptr_, (MILContext *)objc_msgSend(v14, "unsignedIntegerValue"));
        v16 = v15;
        v17 = v52;
        if (v52 >= (uint64_t *)v53)
        {
          v19 = ((char *)v52 - (_BYTE *)v51) >> 3;
          if ((unint64_t)(v19 + 1) >> 61)
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          v20 = (v53 - (_BYTE *)v51) >> 2;
          if (v20 <= v19 + 1)
            v20 = v19 + 1;
          if ((unint64_t)(v53 - (_BYTE *)v51) >= 0x7FFFFFFFFFFFFFF8)
            v21 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v21 = v20;
          if (v21)
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v53, v21);
          else
            v22 = 0;
          v23 = (uint64_t *)&v22[8 * v19];
          *v23 = v16;
          v18 = v23 + 1;
          v25 = (char *)v51;
          v24 = (char *)v52;
          if (v52 != v51)
          {
            do
            {
              v26 = *((_QWORD *)v24 - 1);
              v24 -= 8;
              *--v23 = v26;
            }
            while (v24 != v25);
            v24 = (char *)v51;
          }
          v51 = v23;
          v52 = v18;
          v53 = &v22[8 * v21];
          if (v24)
            operator delete(v24);
        }
        else
        {
          *v52 = v15;
          v18 = v17 + 1;
        }
        v52 = v18;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v11);
  }

  MIL::IRTensorValueType::MakeWithShape();
  memset(v45, 0, sizeof(v45));
  v46 = 1065353216;
  MIL::IRTensorValueType::MakeScalar();
  std::string::basic_string[abi:ne180100]<0>(&v42, "BLOBFILE");
  MIL::IRTensorValueType::MakeStringValue();
  std::string::basic_string[abi:ne180100]<0>(__p, "type");
  v54 = __p;
  v27 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v45, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v54);
  std::shared_ptr<MIL::IRValue const>::operator=[abi:ne180100]<MIL::IRTensorValue const,std::default_delete<MIL::IRTensorValue const>,void>((_QWORD *)v27 + 5, &v44);
  if (v41 < 0)
    operator delete(__p[0]);
  v28 = v44;
  v44 = 0;
  if (v28)
    (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
  if (v43 < 0)
    operator delete(v42);
  MIL::IRTensorValueType::MakeScalar();
  if (v37)
  {
    objc_msgSend(v37, "cxxString");
  }
  else
  {
    v38 = 0;
    v39 = 0;
  }
  MIL::IRTensorValueType::MakeStringValue();
  std::string::basic_string[abi:ne180100]<0>(__p, "path");
  v54 = __p;
  v29 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v45, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v54);
  std::shared_ptr<MIL::IRValue const>::operator=[abi:ne180100]<MIL::IRTensorValue const,std::default_delete<MIL::IRTensorValue const>,void>((_QWORD *)v29 + 5, &v44);
  if (v41 < 0)
    operator delete(__p[0]);
  v30 = v44;
  v44 = 0;
  if (v30)
    (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
  if (v39 < 0)
    operator delete(v38);
  Scalar = (MIL::IRTensorValueType *)MIL::IRTensorValueType::MakeScalar();
  objc_msgSend(v36, "unsignedLongValue");
  MIL::IRTensorValueType::MakeUInt64Value(Scalar);
  std::string::basic_string[abi:ne180100]<0>(__p, "offset");
  v54 = __p;
  v32 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v45, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v54);
  std::shared_ptr<MIL::IRValue const>::operator=[abi:ne180100]<MIL::IRTensorValue const,std::default_delete<MIL::IRTensorValue const>,void>((_QWORD *)v32 + 5, &v44);
  if (v41 < 0)
    operator delete(__p[0]);
  v33 = v44;
  v44 = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  MIL::IRTensorValueType::MakeValueFromFileProperties();
  *v35 = __p[0];
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v45);
  if (v51)
  {
    v52 = (uint64_t *)v51;
    operator delete(v51);
  }

  return v34;
}

+ (id)valueForIRTensorValueType:(const IRTensorValueType *)a3 name:()basic_string<char
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *p_p;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  MIL::IRDimension **v12;
  MIL::IRDimension **v13;
  uint64_t v14;
  void *v15;
  SNNMILValueDescriptor *v16;
  void *__p;
  char v19;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", a4);
  v6 = (*((uint64_t (**)(const IRTensorValueType *))a3->var0 + 11))(a3) - 2;
  if (v6 < 0x10 && ((0xF79Fu >> v6) & 1) != 0)
  {
    v9 = qword_242C4B308[v6];
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    MIL::IRDataTypeToString();
    if (v19 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(v7, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unsupported data type %s"), p_p);
    if (v19 < 0)
      operator delete(__p);
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v11 = (*((uint64_t (**)(const IRTensorValueType *))a3->var0 + 12))(a3);
  v12 = *(MIL::IRDimension ***)v11;
  v13 = *(MIL::IRDimension ***)(v11 + 8);
  if (*(MIL::IRDimension ***)v11 != v13)
  {
    do
    {
      v14 = MIL::IRDimension::AsConstant(*v12);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 48))(v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v15);

      ++v12;
    }
    while (v12 != v13);
  }
  v16 = -[SNNMILValueDescriptor initWithShape:dataType:name:]([SNNMILValueDescriptor alloc], "initWithShape:dataType:name:", v10, v9, v5);

  return v16;
}

+ (id)valueForIRListValueType:(const IRListValueType *)a3 name:()basic_string<char
{
  return 0;
}

+ (id)valueForIRValueType:(const IRValueType *)a3 name:()basic_string<char
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *data;
  __rep __p;
  std::string value;

  v6 = (*((uint64_t (**)(const IRValueType *, SEL))a3->var0 + 3))(a3, a2);
  if (v6)
  {
    v7 = v6;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      std::string::__init_copy_ctor_external(&value, a4->__r_.__value_.var0.var1.__data_, a4->__r_.__value_.var0.var1.__size_);
    else
      value = (std::string)a4->__r_.__value_;
    +[SNNMILContext valueForIRTensorValueType:name:](SNNMILContext, "valueForIRTensorValueType:name:", v7, &value);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SHIBYTE(value.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return v10;
    data = (char *)value.__r_.__value_.__r.__words[0];
    goto LABEL_14;
  }
  v8 = (*((uint64_t (**)(const IRValueType *))a3->var0 + 4))(a3);
  if (!v8)
  {
    (*((void (**)(const IRValueType *))a3->var0 + 5))(a3);
    (*((void (**)(const IRValueType *))a3->var0 + 6))(a3);
    return 0;
  }
  v9 = v8;
  if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external((std::string *)&__p, a4->__r_.__value_.var0.var1.__data_, a4->__r_.__value_.var0.var1.__size_);
  else
    __p = a4->__r_.__value_;
  +[SNNMILContext valueForIRListValueType:name:](SNNMILContext, "valueForIRListValueType:name:", v9, &__p);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((char *)&__p.var0.var1 + 23) < 0)
  {
    data = __p.var0.var1.__data_;
LABEL_14:
    operator delete(data);
  }
  return v10;
}

+ (id)valueForIRTensorValue:(const IRTensorValue *)a3
{
  uint64_t v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  MIL::IRDimension **v12;
  MIL::IRDimension **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  SNNMILDataValue *v21;
  uint64_t Data;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  SNNMILBlobValue *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  SNNMILDataValue *v61;
  void *v62;
  void *v63;
  float v64;
  id v65;
  uint64_t v67;
  void *v68[2];
  char v69;
  void *v70[2];
  char v71;
  void *v72[2];
  char v73;
  void *__p[2];
  char v75;
  void **v76;

  v4 = (*((uint64_t (**)(const IRTensorValue *, SEL))a3->var0 + 4))(a3, a2);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 88))(v4) - 2;
  if (v5 < 0x10 && ((0xF79Fu >> v5) & 1) != 0)
  {
    v67 = qword_242C4B308[v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCAB8];
    MIL::IRDataTypeToString();
    if (v75 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Unsupported data type %s"), v8);
    if (v75 < 0)
      operator delete(__p[0]);
    v67 = 0;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v10 = (*((uint64_t (**)(const IRTensorValue *))a3->var0 + 4))(a3);
  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 96))(v10);
  v13 = *(MIL::IRDimension ***)v11;
  v12 = *(MIL::IRDimension ***)(v11 + 8);
  v14 = 1;
  while (v13 != v12)
  {
    v15 = MIL::IRDimension::AsConstant(*v13);
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 48))(v15);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v17);
    v14 *= (int)v16;

    ++v13;
  }
  if ((*((unsigned int (**)(const IRTensorValue *))a3->var0 + 10))(a3))
  {
    v18 = (*((uint64_t (**)(const IRTensorValue *))a3->var0 + 11))(a3);
    std::unordered_map<std::string,std::shared_ptr<MIL::IRValue const>>::unordered_map((uint64_t)__p, v18);
    std::string::basic_string[abi:ne180100]<0>(v70, "type");
    v68[0] = v70;
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v70, (uint64_t)&std::piecewise_construct, (__int128 **)v68);
    MIL::IRValue::GetScalar<std::string>();
    if (v71 < 0)
      operator delete(v70[0]);
    if (v73 < 0)
    {
      if (v72[1] != (void *)14)
        goto LABEL_29;
      v19 = (void **)v72[0];
    }
    else
    {
      if (v73 != 14)
        goto LABEL_29;
      v19 = v72;
    }
    v24 = *v19;
    v25 = *(uint64_t *)((char *)v19 + 6);
    if (v24 == (void *)0x4C4259434147454CLL && v25 == 0x454C4946424F4C42)
    {
      +[SNNLogging framework](SNNLogging, "framework");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        +[SNNMILContext valueForIRTensorValue:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

      v21 = 0;
      goto LABEL_38;
    }
LABEL_29:
    std::string::basic_string[abi:ne180100]<0>(v68, "path");
    v76 = v68;
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v68, (uint64_t)&std::piecewise_construct, (__int128 **)&v76);
    MIL::IRValue::GetScalar<std::string>();
    if (v69 < 0)
      operator delete(v68[0]);
    std::string::basic_string[abi:ne180100]<0>(v68, "offset");
    v76 = v68;
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v68, (uint64_t)&std::piecewise_construct, (__int128 **)&v76);
    v27 = MIL::IRValue::GetScalar<unsigned long long>();
    if (v69 < 0)
      operator delete(v68[0]);
    v28 = [SNNMILBlobValue alloc];
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", v70);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SNNMILBlobValue initWithFilename:shape:dataType:offset:](v28, "initWithFilename:shape:dataType:offset:", v29, v9, v67, v30);

    if (v71 < 0)
      operator delete(v70[0]);
LABEL_38:
    if (v73 < 0)
      operator delete(v72[0]);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)__p);
    goto LABEL_96;
  }
  v20 = objc_msgSend(v9, "count");
  v21 = 0;
  switch(v5)
  {
    case 0u:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MIL::IRValue::GetScalar<BOOL>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 0);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<BOOL>();
      if (v14 != v23)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 314, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 1u:
      if (!v20)
      {
        v65 = objc_alloc(MEMORY[0x24BDD17C8]);
        MIL::IRValue::GetScalar<std::string>();
        v60 = (void *)objc_msgSend(v65, "initWithCXXString:", __p);
        if (v75 < 0)
          operator delete(__p[0]);
        v61 = -[SNNMILDataValue initWithStringScalar:]([SNNMILDataValue alloc], "initWithStringScalar:", v60);
        goto LABEL_95;
      }
      +[SNNLogging framework](SNNLogging, "framework");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        +[SNNMILContext valueForIRTensorValue:].cold.3(v48, v49, v50, v51, v52, v53, v54, v55);

LABEL_68:
      v21 = 0;
      break;
    case 2u:
      break;
    case 3u:
      if (!v20)
      {
        v63 = (void *)MEMORY[0x24BDD16E0];
        MIL::IRValue::GetScalar<float>();
        objc_msgSend(v63, "numberWithDouble:", v64);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 3);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<float>();
      if (v14 != v44)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 338, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 4u:
      if (!v20)
      {
        v62 = (void *)MEMORY[0x24BDD16E0];
        MIL::IRValue::GetScalar<double>();
        objc_msgSend(v62, "numberWithDouble:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 4);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<double>();
      if (v14 != v40)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 326, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 7u:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", MIL::IRValue::GetScalar<signed char>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 5);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<signed char>();
      if (v14 != v42)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 402, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 8u:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", MIL::IRValue::GetScalar<short>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 6);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<short>();
      if (v14 != v56)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 414, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 9u:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)MIL::IRValue::GetScalar<int>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 7);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<int>();
      if (v14 != v57)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 426, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 0xAu:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", MIL::IRValue::GetScalar<long long>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 8);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<long long>();
      if (v14 != v59)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 438, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 0xCu:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", MIL::IRValue::GetScalar<unsigned char>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 9);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<unsigned char>();
      if (v14 != v58)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 354, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 0xDu:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", MIL::IRValue::GetScalar<unsigned short>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 10);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<unsigned short>();
      if (v14 != v39)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 366, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 0xEu:
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", MIL::IRValue::GetScalar<unsigned int>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 11);
        goto LABEL_95;
      }
      Data = MIL::IRTensorValue::GetDataView<unsigned int>();
      if (v14 != v43)
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 378, "contiguousCount == dataView.Size()");
      goto LABEL_80;
    case 0xFu:
      if (v20)
      {
        Data = MIL::IRTensorValue::GetDataView<unsigned long long>();
        if (v14 != v41)
          __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 390, "contiguousCount == dataView.Size()");
LABEL_80:
        v21 = -[SNNMILDataValue initWithShape:bytes:dataType:]([SNNMILDataValue alloc], "initWithShape:bytes:dataType:", v9, Data, v67);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", MIL::IRValue::GetScalar<unsigned long long>());
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v60, 12);
LABEL_95:
        v21 = v61;

      }
      break;
    default:
      v45 = objc_alloc(MEMORY[0x24BDD17C8]);
      MIL::IRDataTypeToString();
      v46 = (void *)objc_msgSend(v45, "initWithCXXString:", __p);
      if (v75 < 0)
        operator delete(__p[0]);
      +[SNNLogging framework](SNNLogging, "framework");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        +[SNNMILContext valueForIRTensorValue:].cold.2((uint64_t)v46, v47);

      goto LABEL_68;
  }
LABEL_96:

  return v21;
}

+ (id)valueForIRValue:(const IRValue *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t Values;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  SNNMILListValue *v12;

  v4 = (*((uint64_t (**)(const IRValue *, SEL))a3->var0 + 5))(a3, a2);
  if (v4)
  {
    +[SNNMILContext valueForIRTensorValue:](SNNMILContext, "valueForIRTensorValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v5 = (void *)(*((uint64_t (**)(const IRValue *))a3->var0 + 6))(a3);
  if (!v5)
  {
    (*((void (**)(const IRValue *))a3->var0 + 7))(a3);
    (*((void (**)(const IRValue *))a3->var0 + 8))(a3);
    return v5;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  Values = MIL::IRListValue::GetValues((MIL::IRListValue *)v5);
  if (v8)
  {
    v9 = (_QWORD *)Values;
    v10 = 16 * v8;
    do
    {
      +[SNNMILContext valueForIRValue:](SNNMILContext, "valueForIRValue:", *v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v6, "addObject:", v11);

      v9 += 2;
      v10 -= 16;
    }
    while (v10);
  }
  v12 = -[SNNMILListValue initWithValues:]([SNNMILListValue alloc], "initWithValues:", v6);

  return v12;
}

- (basic_string<char,)opsetName
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, *(const std::string::value_type **)&result->__r_.var0, result->var0);
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  }
  return result;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_opsetName.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_opsetName.__r_.__value_.var0.var1.__data_);
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)&self->_context);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

+ (void)valueForIRTensorValue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_242A44000, a1, a3, "Legacy weight files are not supported.", a5, a6, a7, a8, 0);
}

+ (void)valueForIRTensorValue:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
}

+ (void)valueForIRTensorValue:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
