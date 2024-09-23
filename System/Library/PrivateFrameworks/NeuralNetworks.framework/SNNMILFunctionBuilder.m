@implementation SNNMILFunctionBuilder

- (SNNMILFunctionBuilder)initWithName:(id)a3 context:(id)a4 location:(id)a5
{
  id v9;
  id v10;
  id v11;
  SNNMILFunctionBuilder *v12;
  uint64_t v13;
  SNNMILSourceLocation *location;
  uint64_t v15;
  NSMutableArray *outputNames;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SNNMILFunctionBuilder;
  v12 = -[SNNMILFunctionBuilder init](&v18, sel_init);
  objc_storeStrong((id *)&v12->_name, a3);
  objc_storeWeak((id *)&v12->_context, v10);
  +[SNNMILSourceLocation locationOrEmpty:](SNNMILSourceLocation, "locationOrEmpty:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  location = v12->_location;
  v12->_location = (SNNMILSourceLocation *)v13;

  v15 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  outputNames = v12->_outputNames;
  v12->_outputNames = (NSMutableArray *)v15;

  return v12;
}

- (basic_string<char,)milName
{
  void *v1;
  void *v3;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  id v5;

  objc_msgSend(v1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cxxString");
  }
  else
  {
    retstr->__r_.__value_.var0.var1.__data_ = 0;
    retstr->__r_.__value_.var0.var1.__size_ = 0;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = 0;
  }

  return result;
}

- (id)build
{
  SNNMILFunction *function;
  SNNMILFunction *v3;
  SNNMILSourceLocation *location;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count_vtbl *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  id WeakRetained;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const void *v22;
  void **v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  SNNMILFunction *v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count_vtbl *v31;
  void *v32;
  void *v33;
  SNNMILFunction *v34;
  SNNMILFunction *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  void *__p[2];
  uint64_t v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  void *__dst[2];
  unint64_t v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  __int128 v52;
  __int128 v53;
  int v54;
  _QWORD v55[3];
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;

  function = self->_function;
  if (function)
  {
    v3 = function;
    return v3;
  }
  location = self->_location;
  if (!location)
  {
    v59 = 0;
    goto LABEL_10;
  }
  -[SNNMILSourceLocation milLocation](location, "milLocation");
  v7 = v52;
  v59 = v52;
  if (!(_QWORD)v52)
  {
LABEL_10:
    v60 = 0;
    v56 = 0;
    v57 = 0;
    goto LABEL_11;
  }
  v8 = (std::__shared_weak_count *)operator new();
  v9 = (std::__shared_weak_count_vtbl *)v52;
  v8->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137AAC8;
  v8->__shared_weak_owners_ = 0;
  v8[1].__vftable = v9;
  v60 = v8;
  v56 = v7;
  v57 = v8;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
LABEL_11:
  memset(v55, 0, sizeof(v55));
  v52 = 0u;
  v53 = 0u;
  v54 = 1065353216;
  MIL::IRBlock::Make();
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)&v52);
  *(_QWORD *)&v52 = v55;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
  v12 = v57;
  if (v57)
  {
    v13 = (unint64_t *)&v57->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v50 = v59;
  v51 = v60;
  if (v60)
  {
    v15 = (unint64_t *)&v60->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v18 = objc_msgSend(WeakRetained, "platformOpset");
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18);
  v21 = (void *)v20;
  if (v20 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v22 = (const void *)v19;
  if (v20 >= 0x17)
  {
    v24 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17)
      v24 = v20 | 7;
    v25 = v24 + 1;
    v23 = (void **)operator new(v24 + 1);
    __dst[1] = v21;
    v49 = v25 | 0x8000000000000000;
    __dst[0] = v23;
  }
  else
  {
    HIBYTE(v49) = v20;
    v23 = __dst;
    if (!v20)
      goto LABEL_27;
  }
  memmove(v23, v22, (size_t)v21);
LABEL_27:
  *((_BYTE *)v21 + (_QWORD)v23) = 0;
  v52 = 0u;
  v53 = 0u;
  v54 = 1065353216;
  MIL::IRFunction::Make();
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)&v52);
  if (SHIBYTE(v49) < 0)
    operator delete(__dst[0]);

  v26 = v51;
  if (v51)
  {
    v27 = (unint64_t *)&v51->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = [SNNMILFunction alloc];
  v46 = v55[0];
  if (v55[0])
  {
    v30 = (std::__shared_weak_count *)operator new();
    v31 = (std::__shared_weak_count_vtbl *)v55[0];
    v30->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137AB28;
    v30->__shared_owners_ = 0;
    v30->__shared_weak_owners_ = 0;
    v30[1].__vftable = v31;
  }
  else
  {
    v30 = 0;
  }
  v47 = v30;
  v55[0] = 0;
  -[SNNMILFunctionBuilder name](self, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "cxxString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v45 = 0;
  }
  v34 = -[SNNMILFunction initWithFunction:name:](v29, "initWithFunction:name:", &v46, __p);
  v35 = self->_function;
  self->_function = v34;

  if (SHIBYTE(v45) < 0)
    operator delete(__p[0]);

  v36 = v47;
  if (v47)
  {
    v37 = (unint64_t *)&v47->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v3 = self->_function;
  v39 = v55[0];
  v55[0] = 0;
  if (v39)
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  v40 = v58;
  v58 = 0;
  if (v40)
    (*(void (**)(uint64_t))(*(_QWORD *)v40 + 8))(v40);
  v41 = v60;
  if (v60)
  {
    v42 = (unint64_t *)&v60->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  return v3;
}

- (id)placeholderWithShape:(id)a3 dataType:(unint64_t)a4 name:(id)a5 location:(id)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id WeakRetained;
  void *v14;
  MIL::IRConstantDimension *v15;
  uint64_t v16;
  uint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  SNNMILNamedValue *v33;
  id v35;
  id v36;
  id obj;
  void *__p;
  std::__shared_weak_count *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  void **p_p;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v36 = a5;
  v35 = a6;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        v14 = WeakRetained;
        if (WeakRetained)
        {
          objc_msgSend(WeakRetained, "context");
          v15 = (MIL::IRConstantDimension *)__p;
        }
        else
        {
          v15 = 0;
          __p = 0;
          v40 = 0;
        }
        v16 = MIL::IRConstantDimension::Make(v15, (MILContext *)objc_msgSend(v12, "unsignedIntegerValue"));
        if (v40)
        {
          p_shared_owners = &v40->__shared_owners_;
          do
            v18 = __ldaxr((unint64_t *)p_shared_owners);
          while (__stlxr(v18 - 1, (unint64_t *)p_shared_owners));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
          }
        }

        v19 = v48;
        if (v48 >= v49)
        {
          v21 = ((char *)v48 - (_BYTE *)v47) >> 3;
          if ((unint64_t)(v21 + 1) >> 61)
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          v22 = ((char *)v49 - (_BYTE *)v47) >> 2;
          if (v22 <= v21 + 1)
            v22 = v21 + 1;
          if ((unint64_t)((char *)v49 - (_BYTE *)v47) >= 0x7FFFFFFFFFFFFFF8)
            v23 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v23 = v22;
          if (v23)
            v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v49, v23);
          else
            v24 = 0;
          v25 = (uint64_t *)&v24[8 * v21];
          *v25 = v16;
          v20 = v25 + 1;
          v27 = (char *)v47;
          v26 = (char *)v48;
          if (v48 != v47)
          {
            do
            {
              v28 = *((_QWORD *)v26 - 1);
              v26 -= 8;
              *--v25 = v28;
            }
            while (v26 != v27);
            v26 = (char *)v47;
          }
          v47 = v25;
          v48 = v20;
          v49 = (uint64_t *)&v24[8 * v23];
          if (v26)
            operator delete(v26);
        }
        else
        {
          *v48 = v16;
          v20 = v19 + 1;
        }
        v48 = v20;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v9);
  }

  v42 = 0;
  v29 = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v29, "context");
  v30 = MIL::IRTensorValueType::MakeWithShape();
  if (v40)
  {
    v31 = &v40->__shared_owners_;
    do
      v32 = __ldaxr((unint64_t *)v31);
    while (__stlxr(v32 - 1, (unint64_t *)v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }

  v42 = v30;
  if (v36)
  {
    objc_msgSend(v36, "cxxString");
  }
  else
  {
    __p = 0;
    v40 = 0;
    v41 = 0;
  }
  p_p = &__p;
  v50 = &v42;
  std::__tree<std::__value_type<std::string,MIL::IRValueType const*>,std::__map_value_compare<std::string,std::__value_type<std::string,MIL::IRValueType const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MIL::IRValueType const*>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<MIL::IRTensorValueType const*&>>((uint64_t **)&self->_inputs, (const void **)&__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_p, &v50);
  if (SHIBYTE(v41) < 0)
    operator delete(__p);
  v33 = -[SNNMILNamedValue initWithName:]([SNNMILNamedValue alloc], "initWithName:", v36);
  if (v47)
  {
    v48 = (uint64_t *)v47;
    operator delete(v47);
  }

  return v33;
}

- (id)placeholderWithShape:(id)a3 dataType:(unint64_t)a4 location:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILFunctionBuilder placeholderWithShape:dataType:name:location:](self, "placeholderWithShape:dataType:name:location:", v8, a4, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)retainOutputsWithNames:(id)a3
{
  uint64_t v4;
  vector<std::string, std::allocator<std::string>> *p_outputs;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char *value;
  char *end;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::string *v15;
  std::string *v16;
  void *v17;
  id obj;
  void *__p[2];
  std::string::size_type v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  std::__split_buffer<std::string> __v;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    p_outputs = &self->_outputs;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(v8, "cxxString");
        }
        else
        {
          *(_OWORD *)__p = 0uLL;
          v21 = 0;
        }
        end = (char *)self->_outputs.__end_;
        value = (char *)self->_outputs.__end_cap_.__value_;
        if (end >= value)
        {
          v11 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_outputs->__begin_) >> 3);
          v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          v13 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)p_outputs->__begin_) >> 3);
          if (2 * v13 > v12)
            v12 = 2 * v13;
          if (v13 >= 0x555555555555555)
            v14 = 0xAAAAAAAAAAAAAAALL;
          else
            v14 = v12;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&self->_outputs.__end_cap_;
          if (v14)
            v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&self->_outputs.__end_cap_, v14);
          else
            v15 = 0;
          v16 = v15 + v11;
          __v.__first_ = v15;
          __v.__begin_ = v16;
          __v.__end_cap_.__value_ = &v15[v14];
          v16->__r_.__value_.__r.__words[2] = v21;
          *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
          v21 = 0;
          *(_OWORD *)__p = 0uLL;
          __v.__end_ = v16 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)&self->_outputs, &__v);
          v17 = self->_outputs.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          self->_outputs.__end_ = v17;
        }
        else
        {
          *((_QWORD *)end + 2) = v21;
          *(_OWORD *)end = *(_OWORD *)__p;
          self->_outputs.__end_ = end + 24;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  return 1;
}

- (BOOL)retainOutputs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = -[SNNMILFunctionBuilder retainOutputsWithNames:](self, "retainOutputsWithNames:", v5);
  return v11;
}

- (id)constantOperationWithValue:(unique_ptr<const)MIL:(std:(id)a4 :(id)a5 default_delete<const MIL::IRValue>>)a3 :IRValue name:location:
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  std::__shared_weak_count_vtbl *v13;
  std::__shared_weak_count *v14;
  std::__shared_weak_count_vtbl *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _QWORD *v18;
  MIL::IRNamedValueType *v19;
  _QWORD *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t i;
  MIL::IRNamedValueType *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count_vtbl *v31;
  std::__shared_weak_count_vtbl *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char *value;
  char *end;
  void *v38;
  _BYTE *begin;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  _QWORD *v47;
  _QWORD *v48;
  char *v49;
  __int128 v50;
  int64x2_t v51;
  void *v52;
  SNNMILNamedValue *v53;
  uint64_t v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  _QWORD v60[3];
  _QWORD v61[5];
  void *__p;
  uint64_t v63;
  uint64_t v64;
  MIL::IRNamedValueType *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD **v69;
  _QWORD *v70[3];
  std::__shared_weak_count *v71;
  void *v72;
  char v73;
  std::__shared_weak_count_vtbl *v74;
  std::__shared_weak_count_vtbl *v75;
  std::__shared_weak_count_vtbl *v76;
  std::__shared_weak_count *v77;
  uint64_t v78;
  uint64_t v79[2];
  std::__shared_weak_count *v80;
  void **v81;
  void **v82;
  int64x2_t v83;
  void *v84;
  __compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *p_end_cap;
  _QWORD v86[5];
  _QWORD v87[3];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "platformOpset");
  std::string::basic_string[abi:ne180100]<0>(&v82, "const");
  MIL::IROpset::TryGetOperatorSharedPtr();
  if (v83.i8[15] < 0)
    operator delete(v82);

  v11 = objc_loadWeakRetained((id *)&self->_context);
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "milValueForString:", v8);
  else
    v79[0] = 0;

  if (v9)
  {
    objc_msgSend(v9, "milLocation");
    v13 = v75;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v72, "");
    MIL::TextFileLocation::Make();
    v13 = v74;
    v74 = 0;
    v75 = v13;
  }
  v76 = v13;
  if (v13)
  {
    v14 = (std::__shared_weak_count *)operator new();
    v15 = v75;
    v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137AAC8;
    v14->__shared_owners_ = 0;
    v14->__shared_weak_owners_ = 0;
    v14[1].__vftable = v15;
  }
  else
  {
    v14 = 0;
  }
  v77 = v14;
  v75 = 0;
  v70[2] = (_QWORD *)v79[1];
  v71 = v80;
  if (v80)
  {
    p_shared_owners = (unint64_t *)&v80->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  v70[0] = 0;
  v70[1] = 0;
  v69 = v70;
  if (v8)
  {
    objc_msgSend(v8, "cxxString");
  }
  else
  {
    __p = 0;
    v63 = 0;
    v64 = 0;
  }
  (*((void (**)(void **))*a3.var0.var0->var0 + 4))(a3.var0.var0->var0);
  MIL::IRNamedValueType::Make();
  v87[0] = v65;
  if (v65)
  {
    v18 = (_QWORD *)operator new();
    v19 = v65;
    *v18 = &unk_25137AB88;
    v18[1] = 0;
    v18[2] = 0;
    v18[3] = v19;
  }
  else
  {
    v18 = 0;
  }
  v87[1] = v18;
  v65 = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v82 = (void **)&v66;
  v83.i8[0] = 0;
  v20 = operator new(0x10uLL);
  v66 = v20;
  v68 = v20 + 2;
  *v20 = v87[0];
  v20[1] = v18;
  if (v18)
  {
    v21 = v18 + 1;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v67 = v20 + 2;
  std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100]<char const(&)[4],std::unique_ptr<MIL::IRValue const>,0>(&v82, "val", (uint64_t *)a3.var0.var0);
  std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100]<char const(&)[5],std::unique_ptr<MIL::IRValue const>,0>(v86, "name", v79);
  std::unordered_map<std::string,std::shared_ptr<MIL::IRValue const>>::unordered_map((uint64_t)v61, (unsigned __int8 *)&v82, 2);
  memset(v60, 0, sizeof(v60));
  MIL::IROperation::Make();
  v81 = (void **)v60;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100](&v81);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v61);
  for (i = 0; i != -10; i -= 5)
  {
    std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)&v86[i + 3]);
    if (SHIBYTE(v86[i + 2]) < 0)
      operator delete((void *)v86[i]);
  }
  v82 = (void **)&v66;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100](&v82);
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)v87);
  v24 = v65;
  v65 = 0;
  if (v24)
  {
    MIL::IRNamedValueType::~IRNamedValueType(v24);
    MEMORY[0x2494ED668]();
  }
  if (SHIBYTE(v64) < 0)
    operator delete(__p);
  std::__tree<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>>>::destroy((uint64_t)&v69, v70[0]);
  v25 = v71;
  if (v71)
  {
    v26 = (unint64_t *)&v71->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v77;
  if (v77)
  {
    v29 = (unint64_t *)&v77->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v75;
  v75 = 0;
  if (v31)
    (*((void (**)(std::__shared_weak_count_vtbl *))v31->~__shared_weak_count + 1))(v31);
  if (!v9)
  {
    v32 = v74;
    v74 = 0;
    if (v32)
      (*((void (**)(std::__shared_weak_count_vtbl *))v32->~__shared_weak_count + 1))(v32);
    if (v73 < 0)
      operator delete(v72);
  }
  v33 = v78;
  v61[0] = v78;
  if (v78)
  {
    v34 = (_QWORD *)operator new();
    v35 = v78;
    *v34 = &unk_25137AC48;
    v34[1] = 0;
    v34[2] = 0;
    v34[3] = v35;
  }
  else
  {
    v34 = 0;
  }
  v61[1] = v34;
  v78 = 0;
  value = (char *)self->_operations.__end_cap_.__value_;
  end = (char *)self->_operations.__end_;
  if (end >= value)
  {
    begin = self->_operations.__begin_;
    v40 = (end - begin) >> 4;
    v41 = v40 + 1;
    if ((unint64_t)(v40 + 1) >> 60)
      std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
    v42 = value - begin;
    if (v42 >> 3 > v41)
      v41 = v42 >> 3;
    if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0)
      v43 = 0xFFFFFFFFFFFFFFFLL;
    else
      v43 = v41;
    p_end_cap = &self->_operations.__end_cap_;
    v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&self->_operations.__end_cap_, v43);
    v46 = &v44[16 * v40];
    *(_QWORD *)v46 = v33;
    *((_QWORD *)v46 + 1) = v34;
    v48 = self->_operations.__begin_;
    v47 = self->_operations.__end_;
    if (v47 == v48)
    {
      v51 = vdupq_n_s64((unint64_t)v47);
      v49 = &v44[16 * v40];
    }
    else
    {
      v49 = &v44[16 * v40];
      do
      {
        v50 = *((_OWORD *)v47 - 1);
        v47 -= 2;
        *((_OWORD *)v49 - 1) = v50;
        v49 -= 16;
        *v47 = 0;
        v47[1] = 0;
      }
      while (v47 != v48);
      v51 = *(int64x2_t *)&self->_operations.__begin_;
    }
    v38 = v46 + 16;
    self->_operations.__begin_ = v49;
    self->_operations.__end_ = v46 + 16;
    v83 = v51;
    v52 = self->_operations.__end_cap_.__value_;
    self->_operations.__end_cap_.__value_ = &v44[16 * v45];
    v84 = v52;
    v82 = (void **)v51.i64[0];
    std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer((uint64_t)&v82);
  }
  else
  {
    *(_QWORD *)end = v33;
    *((_QWORD *)end + 1) = v34;
    v38 = end + 16;
  }
  self->_operations.__end_ = v38;
  v53 = -[SNNMILNamedValue initWithName:]([SNNMILNamedValue alloc], "initWithName:", v8);
  v54 = v78;
  v78 = 0;
  if (v54)
    (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
  v55 = v79[0];
  v79[0] = 0;
  if (v55)
    (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
  v56 = v80;
  if (v80)
  {
    v57 = (unint64_t *)&v80->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }

  return v53;
}

- (id)constantValue:(id)a3 name:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "conformsToProtocol:", &unk_25725AB30);
  v11 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (v11)
    objc_msgSend(v11, "milValueWithContext:", WeakRetained);
  else
    v18 = 0;

  v17 = v18;
  v18 = 0;
  -[SNNMILFunctionBuilder constantOperationWithValue:name:location:](self, "constantOperationWithValue:name:location:", &v17, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  v17 = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v15 = v18;
  v18 = 0;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);

  return v13;
}

- (id)constantScalar:(id)a3 name:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v12 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "milValueForString:", v8);
  else
    v18 = 0;

  v17 = v18;
  v18 = 0;
  -[SNNMILFunctionBuilder constantOperationWithValue:name:location:](self, "constantOperationWithValue:name:location:", &v17, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  v17 = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v15 = v18;
  v18 = 0;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);

  return v13;
}

- (id)constantScalar:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILFunctionBuilder constantScalar:name:location:](self, "constantScalar:name:location:", v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)constantScalar:(id)a3 dataType:(unint64_t)a4 name:(id)a5 location:(id)a6
{
  id v10;
  id v11;
  id v12;
  SNNMILDataValue *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[SNNMILDataValue initWithScalar:dataType:]([SNNMILDataValue alloc], "initWithScalar:dataType:", v10, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (v13)
    -[SNNMILDataValue milValueWithContext:](v13, "milValueWithContext:", WeakRetained);
  else
    v20 = 0;

  v19 = v20;
  v20 = 0;
  -[SNNMILFunctionBuilder constantOperationWithValue:name:location:](self, "constantOperationWithValue:name:location:", &v19, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  v19 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = v20;
  v20 = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);

  return v15;
}

- (id)constantTensorWithScalars:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 name:(id)a6 location:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SNNMILDataValue *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[SNNMILDataValue initWithShape:scalars:dataType:]([SNNMILDataValue alloc], "initWithShape:scalars:dataType:", v13, v12, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (v16)
    -[SNNMILDataValue milValueWithContext:](v16, "milValueWithContext:", WeakRetained);
  else
    v23 = 0;

  v22 = v23;
  v23 = 0;
  -[SNNMILFunctionBuilder constantOperationWithValue:name:location:](self, "constantOperationWithValue:name:location:", &v22, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v22;
  v22 = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  v20 = v23;
  v23 = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);

  return v18;
}

- (id)constantScalar:(id)a3 dataType:(unint64_t)a4 location:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILFunctionBuilder constantScalar:dataType:name:location:](self, "constantScalar:dataType:name:location:", v8, a4, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)constantTensorWithScalars:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 location:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILFunctionBuilder constantTensorWithScalars:shape:dataType:name:location:](self, "constantTensorWithScalars:shape:dataType:name:location:", v10, v11, a5, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)constantTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5 name:(id)a6 location:(id)a7
{
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v16 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "milValueForTensorWithBytes:shape:dataType:", a3, v12, a5);
  else
    v22 = 0;

  v21 = v22;
  v22 = 0;
  -[SNNMILFunctionBuilder constantOperationWithValue:name:location:](self, "constantOperationWithValue:name:location:", &v21, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;
  v21 = 0;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  v19 = v22;
  v22 = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);

  return v17;
}

- (id)constantTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5 location:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a6;
  -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILFunctionBuilder constantTensorWithBytes:shape:dataType:name:location:](self, "constantTensorWithBytes:shape:dataType:name:location:", a3, v10, a5, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)constantTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6 name:(id)a7 location:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v20 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "milValueForTensorBlobWithFilename:shape:dataType:offset:", v14, v15, a5, v16);
  else
    v26 = 0;

  v25 = v26;
  v26 = 0;
  -[SNNMILFunctionBuilder constantOperationWithValue:name:location:](self, "constantOperationWithValue:name:location:", &v25, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v25;
  v25 = 0;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  v23 = v26;
  v26 = 0;
  if (v23)
    (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);

  return v21;
}

- (id)constantTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6 location:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNNMILFunctionBuilder constantTensorBlobWithFilename:shape:dataType:offset:name:location:](self, "constantTensorBlobWithFilename:shape:dataType:offset:name:location:", v12, v13, a5, v14, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)outputsByApplyingOperatorNamed:(id)a3 toInputs:(id)a4 outputs:(id)a5 attributes:(id)a6 location:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  __int128 *v22;
  __int128 *v23;
  __int128 *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  SNNMILFunctionBuilder *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  __int128 **v35;
  _QWORD *v36;
  _QWORD *v37;
  char *v38;
  __int128 v39;
  int64x2_t v40;
  void *v41;
  __int128 *v42;
  __int128 *v43;
  __int128 *v44;
  __int128 *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  __int128 **v54;
  _QWORD *v55;
  _QWORD *v56;
  char *v57;
  __int128 v58;
  int64x2_t v59;
  void *v60;
  __int128 *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  _QWORD *v70;
  void *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  _QWORD *v81;
  _QWORD *v82;
  char *v83;
  __int128 v84;
  int64x2_t v85;
  void *v86;
  SNNMILNamedValue *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t m;
  void *v91;
  void *v92;
  id WeakRetained;
  uint64_t *v94;
  id v95;
  std::__shared_weak_count_vtbl *v96;
  std::__shared_weak_count *v97;
  std::__shared_weak_count_vtbl *v98;
  unint64_t *p_shared_owners;
  unint64_t v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  unint64_t v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  std::__shared_weak_count_vtbl *v107;
  std::__shared_weak_count_vtbl *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  char *value;
  char *end;
  void *v114;
  _BYTE *begin;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t **v122;
  _QWORD *v123;
  _QWORD *v124;
  char *v125;
  __int128 v126;
  int64x2_t v127;
  void *v128;
  id v129;
  uint64_t *v130;
  std::__shared_weak_count *v131;
  unint64_t *v132;
  unint64_t v133;
  id v135;
  id v136;
  id v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  id obj;
  id v142;
  id i;
  id v144;
  void *v145;
  id v146;
  uint64_t *v147[3];
  std::__shared_weak_count *v148;
  void *v149;
  char v150;
  std::__shared_weak_count_vtbl *v151;
  std::__shared_weak_count_vtbl *v152;
  std::__shared_weak_count_vtbl *v153;
  std::__shared_weak_count *v154;
  __int128 *p_p;
  std::__shared_weak_count *v156;
  uint64_t *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  int64x2_t v162;
  __int128 v163;
  int v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  int64x2_t v172;
  _QWORD v173[2];
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t *v182;
  _QWORD *v183[2];
  void *__p;
  int64x2_t v185;
  void *v186;
  __compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *p_end_cap;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x24BDAC8D0];
  v137 = a3;
  v12 = a4;
  v136 = a5;
  v135 = a6;
  v138 = a7;
  v183[1] = 0;
  v183[0] = 0;
  v182 = (uint64_t *)v183;
  v178 = 0u;
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  obj = v12;
  v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v191, 16);
  if (v140)
  {
    v139 = *(_QWORD *)v179;
    do
    {
      for (i = 0; i != (id)v140; i = (char *)i + 1)
      {
        if (*(_QWORD *)v179 != v139)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * (_QWORD)i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = 0uLL;
        *(_QWORD *)&v163 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          v174 = 0u;
          v175 = 0u;
          v176 = 0u;
          v177 = 0u;
          v142 = v15;
          objc_msgSend(v15, "values");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v174, v190, 16);
          v18 = v142;
          if (v17)
          {
            v19 = *(_QWORD *)v175;
            v18 = v142;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v175 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(id *)(*((_QWORD *)&v174 + 1) + 8 * j);

                v18 = v21;
                -[SNNMILFunctionBuilder milArgumentForSNNMILValue:](self, "milArgumentForSNNMILValue:", v21);
                v22 = p_p;
                v172.i64[0] = (uint64_t)p_p;
                if (p_p)
                {
                  v23 = (__int128 *)operator new();
                  v24 = p_p;
                  *(_QWORD *)v23 = &unk_25137ACA8;
                  *((_QWORD *)v23 + 1) = 0;
                  *((_QWORD *)v23 + 2) = 0;
                  *((_QWORD *)v23 + 3) = v24;
                }
                else
                {
                  v23 = 0;
                }
                v172.i64[1] = (uint64_t)v23;
                p_p = 0;
                v25 = v162.i64[1];
                if (v162.i64[1] >= (unint64_t)v163)
                {
                  v27 = v13;
                  v28 = self;
                  v29 = (v162.i64[1] - v162.i64[0]) >> 4;
                  v30 = v29 + 1;
                  if ((unint64_t)(v29 + 1) >> 60)
                    std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
                  v31 = v163 - v162.i64[0];
                  if ((uint64_t)(v163 - v162.i64[0]) >> 3 > v30)
                    v30 = v31 >> 3;
                  if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
                    v32 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v32 = v30;
                  p_end_cap = (__compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *)&v163;
                  v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&v163, v32);
                  v35 = (__int128 **)&v33[16 * v29];
                  *v35 = v22;
                  v35[1] = v23;
                  v36 = (_QWORD *)v162.i64[1];
                  v37 = (_QWORD *)v162.i64[0];
                  if (v162.i64[1] == v162.i64[0])
                  {
                    v40 = vdupq_n_s64(v162.u64[1]);
                    v38 = &v33[16 * v29];
                    self = v28;
                  }
                  else
                  {
                    v38 = &v33[16 * v29];
                    self = v28;
                    do
                    {
                      v39 = *((_OWORD *)v36 - 1);
                      v36 -= 2;
                      *((_OWORD *)v38 - 1) = v39;
                      v38 -= 16;
                      *v36 = 0;
                      v36[1] = 0;
                    }
                    while (v36 != v37);
                    v40 = v162;
                  }
                  v13 = v27;
                  v26 = v35 + 2;
                  v162.i64[0] = (uint64_t)v38;
                  v162.i64[1] = (uint64_t)(v35 + 2);
                  v185 = v40;
                  v41 = (void *)v163;
                  *(_QWORD *)&v163 = &v33[16 * v34];
                  v186 = v41;
                  __p = (void *)v40.i64[0];
                  std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer((uint64_t)&__p);
                }
                else
                {
                  *(_QWORD *)v162.i64[1] = v22;
                  *(_QWORD *)(v25 + 8) = v23;
                  v26 = (_QWORD *)(v25 + 16);
                }
                v162.i64[1] = (uint64_t)v26;
                v42 = p_p;
                p_p = 0;
                if (v42)
                  (*(void (**)(__int128 *))(*(_QWORD *)v42 + 8))(v42);
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v174, v190, 16);
            }
            while (v17);
          }

          v14 = 0;
        }
        else
        {
          -[SNNMILFunctionBuilder milArgumentForSNNMILValue:](self, "milArgumentForSNNMILValue:", v14);
          v43 = p_p;
          v172.i64[0] = (uint64_t)p_p;
          if (p_p)
          {
            v44 = (__int128 *)operator new();
            v45 = p_p;
            *(_QWORD *)v44 = &unk_25137ACA8;
            *((_QWORD *)v44 + 1) = 0;
            *((_QWORD *)v44 + 2) = 0;
            *((_QWORD *)v44 + 3) = v45;
          }
          else
          {
            v44 = 0;
          }
          v172.i64[1] = (uint64_t)v44;
          p_p = 0;
          v46 = v162.i64[1];
          if (v162.i64[1] >= (unint64_t)v163)
          {
            v48 = (v162.i64[1] - v162.i64[0]) >> 4;
            v49 = v48 + 1;
            if ((unint64_t)(v48 + 1) >> 60)
              std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
            v50 = v163 - v162.i64[0];
            if ((uint64_t)(v163 - v162.i64[0]) >> 3 > v49)
              v49 = v50 >> 3;
            if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
              v51 = 0xFFFFFFFFFFFFFFFLL;
            else
              v51 = v49;
            p_end_cap = (__compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *)&v163;
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&v163, v51);
            v54 = (__int128 **)&v52[16 * v48];
            *v54 = v43;
            v54[1] = v44;
            v55 = (_QWORD *)v162.i64[1];
            v56 = (_QWORD *)v162.i64[0];
            if (v162.i64[1] == v162.i64[0])
            {
              v59 = vdupq_n_s64(v162.u64[1]);
              v57 = &v52[16 * v48];
            }
            else
            {
              v57 = &v52[16 * v48];
              do
              {
                v58 = *((_OWORD *)v55 - 1);
                v55 -= 2;
                *((_OWORD *)v57 - 1) = v58;
                v57 -= 16;
                *v55 = 0;
                v55[1] = 0;
              }
              while (v55 != v56);
              v59 = v162;
            }
            v47 = v54 + 2;
            v162.i64[0] = (uint64_t)v57;
            v162.i64[1] = (uint64_t)(v54 + 2);
            v185 = v59;
            v60 = (void *)v163;
            *(_QWORD *)&v163 = &v52[16 * v53];
            v186 = v60;
            __p = (void *)v59.i64[0];
            std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer((uint64_t)&__p);
          }
          else
          {
            *(_QWORD *)v162.i64[1] = v43;
            *(_QWORD *)(v46 + 8) = v44;
            v47 = (_QWORD *)(v46 + 16);
          }
          v162.i64[1] = (uint64_t)v47;
          v61 = p_p;
          p_p = 0;
          if (v61)
            (*(void (**)(__int128 *))(*(_QWORD *)v61 + 8))(v61);
        }
        if (v13)
        {
          objc_msgSend(v13, "cxxString");
        }
        else
        {
          v185 = 0uLL;
          __p = 0;
        }
        std::__tree<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>>>::__emplace_unique_key_args<std::string,std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>(&v182, (const void **)&__p, (uint64_t)&__p, (uint64_t)&v162);
        if (v185.i8[15] < 0)
          operator delete(__p);
        __p = &v162;
        std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

      }
      v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v191, 16);
    }
    while (v140);
  }

  v145 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v172 = 0uLL;
  v173[0] = 0;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v144 = v136;
  v62 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v168, v189, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v169;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v169 != v63)
          objc_enumerationMutation(v144);
        v65 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * k);
        objc_msgSend(v65, "dimensions");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[SNNMILFunctionBuilder tensorValueTypeWithShape:dataType:](self, "tensorValueTypeWithShape:dataType:", v66, objc_msgSend(v65, "dataType"));

        objc_msgSend(v65, "name");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
          objc_msgSend(v65, "name");
        else
          -[SNNMILFunctionBuilder nextSymbol](self, "nextSymbol");
        v68 = (id)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          objc_msgSend(v68, "cxxString");
        }
        else
        {
          v165 = 0;
          v166 = 0;
          v167 = 0;
        }
        MIL::IRNamedValueType::Make();
        v69 = __p;
        v162.i64[0] = (uint64_t)__p;
        if (__p)
        {
          v70 = (_QWORD *)operator new();
          v71 = __p;
          *v70 = &unk_25137AB88;
          v70[1] = 0;
          v70[2] = 0;
          v70[3] = v71;
        }
        else
        {
          v70 = 0;
        }
        v162.i64[1] = (uint64_t)v70;
        __p = 0;
        if (SHIBYTE(v167) < 0)
          operator delete(v165);
        v72 = v172.i64[1];
        if (v172.i64[1] >= v173[0])
        {
          v74 = (v172.i64[1] - v172.i64[0]) >> 4;
          v75 = v74 + 1;
          if ((unint64_t)(v74 + 1) >> 60)
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          v76 = v173[0] - v172.i64[0];
          if ((v173[0] - v172.i64[0]) >> 3 > v75)
            v75 = v76 >> 3;
          if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF0)
            v77 = 0xFFFFFFFFFFFFFFFLL;
          else
            v77 = v75;
          p_end_cap = (__compressed_pair<std::shared_ptr<MIL::IROperation> *, std::allocator<std::shared_ptr<MIL::IROperation>>> *)v173;
          v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)v173, v77);
          v80 = &v78[16 * v74];
          *(_QWORD *)v80 = v69;
          *((_QWORD *)v80 + 1) = v70;
          v162 = 0uLL;
          v81 = (_QWORD *)v172.i64[1];
          v82 = (_QWORD *)v172.i64[0];
          if (v172.i64[1] == v172.i64[0])
          {
            v85 = vdupq_n_s64(v172.u64[1]);
            v83 = &v78[16 * v74];
          }
          else
          {
            v83 = &v78[16 * v74];
            do
            {
              v84 = *((_OWORD *)v81 - 1);
              v81 -= 2;
              *((_OWORD *)v83 - 1) = v84;
              v83 -= 16;
              *v81 = 0;
              v81[1] = 0;
            }
            while (v81 != v82);
            v85 = v172;
          }
          v73 = v80 + 16;
          v172.i64[0] = (uint64_t)v83;
          v172.i64[1] = (uint64_t)(v80 + 16);
          v185 = v85;
          v86 = (void *)v173[0];
          v173[0] = &v78[16 * v79];
          v186 = v86;
          __p = (void *)v85.i64[0];
          std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer((uint64_t)&__p);
        }
        else
        {
          *(_QWORD *)v172.i64[1] = v69;
          *(_QWORD *)(v72 + 8) = v70;
          v73 = (_QWORD *)(v72 + 16);
          v162 = 0uLL;
        }
        v172.i64[1] = (uint64_t)v73;
        v87 = -[SNNMILNamedValue initWithName:]([SNNMILNamedValue alloc], "initWithName:", v68);
        objc_msgSend(v145, "addObject:", v87);
        -[NSMutableArray addObject:](self->_outputNames, "addObject:", v68);

      }
      v62 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v168, v189, 16);
    }
    while (v62);
  }

  v162 = 0u;
  v163 = 0u;
  v164 = 1065353216;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v146 = v135;
  v88 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v158, v188, 16);
  if (v88)
  {
    v89 = *(_QWORD *)v159;
    do
    {
      for (m = 0; m != v88; ++m)
      {
        if (*(_QWORD *)v159 != v89)
          objc_enumerationMutation(v146);
        v91 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * m);
        objc_msgSend(v146, "objectForKeyedSubscript:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        if (v92)
          objc_msgSend(v92, "milValueWithContext:", WeakRetained);
        else
          v157 = 0;

        if (v91)
        {
          objc_msgSend(v91, "cxxString");
        }
        else
        {
          v185 = 0uLL;
          __p = 0;
        }
        p_p = (__int128 *)&__p;
        v147[0] = (uint64_t *)&v157;
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<std::unique_ptr<MIL::IRValue const> &&>>((uint64_t)&v162, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, &p_p, v147);
        if (v185.i8[15] < 0)
          operator delete(__p);
        v94 = v157;
        v157 = 0;
        if (v94)
          (*(void (**)(uint64_t *))(*v94 + 8))(v94);

      }
      v88 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v158, v188, 16);
    }
    while (v88);
  }

  v95 = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v95, "platformOpset");
  if (v137)
  {
    objc_msgSend(v137, "cxxString");
  }
  else
  {
    v185 = 0uLL;
    __p = 0;
  }
  MIL::IROpset::TryGetOperatorSharedPtr();
  if (v185.i8[15] < 0)
    operator delete(__p);

  if (!p_p)
    __assert_rtn("-[SNNMILFunctionBuilder outputsByApplyingOperatorNamed:toInputs:outputs:attributes:location:]", "SNNMILBuilders.mm", 324, "op");
  if (v138)
  {
    objc_msgSend(v138, "milLocation");
    v96 = v152;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v149, "");
    MIL::TextFileLocation::Make();
    v96 = v151;
    v151 = 0;
    v152 = v96;
  }
  v153 = v96;
  if (v96)
  {
    v97 = (std::__shared_weak_count *)operator new();
    v98 = v152;
    v97->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137AAC8;
    v97->__shared_owners_ = 0;
    v97->__shared_weak_owners_ = 0;
    v97[1].__vftable = v98;
  }
  else
  {
    v97 = 0;
  }
  v154 = v97;
  v152 = 0;
  v147[2] = (uint64_t *)p_p;
  v148 = v156;
  if (v156)
  {
    p_shared_owners = (unint64_t *)&v156->__shared_owners_;
    do
      v100 = __ldxr(p_shared_owners);
    while (__stxr(v100 + 1, p_shared_owners));
  }
  v185 = 0uLL;
  __p = 0;
  MIL::IROperation::Make();
  v147[0] = (uint64_t *)&__p;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)v147);
  v101 = v148;
  if (v148)
  {
    v102 = (unint64_t *)&v148->__shared_owners_;
    do
      v103 = __ldaxr(v102);
    while (__stlxr(v103 - 1, v102));
    if (!v103)
    {
      ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
      std::__shared_weak_count::__release_weak(v101);
    }
  }
  v104 = v154;
  if (v154)
  {
    v105 = (unint64_t *)&v154->__shared_owners_;
    do
      v106 = __ldaxr(v105);
    while (__stlxr(v106 - 1, v105));
    if (!v106)
    {
      ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
      std::__shared_weak_count::__release_weak(v104);
    }
  }
  v107 = v152;
  v152 = 0;
  if (v107)
    (*((void (**)(std::__shared_weak_count_vtbl *))v107->~__shared_weak_count + 1))(v107);
  if (!v138)
  {
    v108 = v151;
    v151 = 0;
    if (v108)
      (*((void (**)(std::__shared_weak_count_vtbl *))v108->~__shared_weak_count + 1))(v108);
    if (v150 < 0)
      operator delete(v149);
  }
  v109 = v157;
  v147[0] = v157;
  if (v157)
  {
    v110 = (uint64_t *)operator new();
    v111 = v157;
    *v110 = (uint64_t)&unk_25137AC48;
    v110[1] = 0;
    v110[2] = 0;
    v110[3] = (uint64_t)v111;
  }
  else
  {
    v110 = 0;
  }
  v147[1] = v110;
  v157 = 0;
  value = (char *)self->_operations.__end_cap_.__value_;
  end = (char *)self->_operations.__end_;
  if (end >= value)
  {
    begin = self->_operations.__begin_;
    v116 = (end - begin) >> 4;
    v117 = v116 + 1;
    if ((unint64_t)(v116 + 1) >> 60)
      std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
    v118 = value - begin;
    if (v118 >> 3 > v117)
      v117 = v118 >> 3;
    if ((unint64_t)v118 >= 0x7FFFFFFFFFFFFFF0)
      v119 = 0xFFFFFFFFFFFFFFFLL;
    else
      v119 = v117;
    p_end_cap = &self->_operations.__end_cap_;
    v120 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<MIL::IRNamedValueType>>>((uint64_t)&self->_operations.__end_cap_, v119);
    v122 = (uint64_t **)&v120[16 * v116];
    *v122 = v109;
    v122[1] = v110;
    v124 = self->_operations.__begin_;
    v123 = self->_operations.__end_;
    if (v123 == v124)
    {
      v127 = vdupq_n_s64((unint64_t)v123);
      v125 = &v120[16 * v116];
    }
    else
    {
      v125 = &v120[16 * v116];
      do
      {
        v126 = *((_OWORD *)v123 - 1);
        v123 -= 2;
        *((_OWORD *)v125 - 1) = v126;
        v125 -= 16;
        *v123 = 0;
        v123[1] = 0;
      }
      while (v123 != v124);
      v127 = *(int64x2_t *)&self->_operations.__begin_;
    }
    v114 = v122 + 2;
    self->_operations.__begin_ = v125;
    self->_operations.__end_ = v122 + 2;
    v185 = v127;
    v128 = self->_operations.__end_cap_.__value_;
    self->_operations.__end_cap_.__value_ = &v120[16 * v121];
    v186 = v128;
    __p = (void *)v127.i64[0];
    std::__split_buffer<std::shared_ptr<MIL::IROperation>>::~__split_buffer((uint64_t)&__p);
  }
  else
  {
    *(_QWORD *)end = v109;
    *((_QWORD *)end + 1) = v110;
    v114 = end + 16;
  }
  self->_operations.__end_ = v114;
  v129 = v145;
  v130 = v157;
  v157 = 0;
  if (v130)
    (*(void (**)(uint64_t *))(*v130 + 8))(v130);
  v131 = v156;
  if (v156)
  {
    v132 = (unint64_t *)&v156->__shared_owners_;
    do
      v133 = __ldaxr(v132);
    while (__stlxr(v133 - 1, v132));
    if (!v133)
    {
      ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
      std::__shared_weak_count::__release_weak(v131);
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)&v162);
  __p = &v172;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  std::__tree<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::shared_ptr<MIL::IRArgument>>>>>::destroy((uint64_t)&v182, v183[0]);
  return v129;
}

- (id)outputsByApplyingOperatorNamed:(id)a3 toInputs:(id)a4 outputs:(id)a5 location:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  -[SNNMILFunctionBuilder outputsByApplyingOperatorNamed:toInputs:outputs:attributes:location:](self, "outputsByApplyingOperatorNamed:toInputs:outputs:attributes:location:", v10, v11, v12, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)nextSymbol
{
  void *v2;
  unint64_t symbolCounter;

  v2 = (void *)MEMORY[0x24BDD17C8];
  symbolCounter = self->_symbolCounter;
  self->_symbolCounter = symbolCounter + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("data_%lu"), symbolCounter);
}

- (const)tensorValueTypeWithShape:(id)a3 dataType:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id WeakRetained;
  void *v10;
  MIL::IRConstantDimension *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  id v25;
  const IRTensorValueType *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v30;
  MIL::IRConstantDimension *v32;
  std::__shared_weak_count *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *__p;
  uint64_t *v39;
  uint64_t *v40;
  _BYTE v41[128];
  uint64_t v42;

  v30 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  __p = 0;
  v39 = 0;
  v40 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        v10 = WeakRetained;
        if (WeakRetained)
        {
          objc_msgSend(WeakRetained, "context");
          v11 = v32;
        }
        else
        {
          v11 = 0;
          v32 = 0;
          v33 = 0;
        }
        v12 = MIL::IRConstantDimension::Make(v11, (MILContext *)objc_msgSend(v8, "unsignedIntegerValue", v30));
        if (v33)
        {
          p_shared_owners = (unint64_t *)&v33->__shared_owners_;
          do
            v14 = __ldaxr(p_shared_owners);
          while (__stlxr(v14 - 1, p_shared_owners));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }

        v15 = v39;
        if (v39 >= v40)
        {
          v17 = ((char *)v39 - (_BYTE *)__p) >> 3;
          if ((unint64_t)(v17 + 1) >> 61)
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          v18 = ((char *)v40 - (_BYTE *)__p) >> 2;
          if (v18 <= v17 + 1)
            v18 = v17 + 1;
          if ((unint64_t)((char *)v40 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
            v19 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v40, v19);
          else
            v20 = 0;
          v21 = (uint64_t *)&v20[8 * v17];
          *v21 = v12;
          v16 = v21 + 1;
          v23 = (char *)__p;
          v22 = (char *)v39;
          if (v39 != __p)
          {
            do
            {
              v24 = *((_QWORD *)v22 - 1);
              v22 -= 8;
              *--v21 = v24;
            }
            while (v22 != v23);
            v22 = (char *)__p;
          }
          __p = v21;
          v39 = v16;
          v40 = (uint64_t *)&v20[8 * v19];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *v39 = v12;
          v16 = v15 + 1;
        }
        v39 = v16;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v5);
  }

  v25 = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v25, "context");
  v26 = (const IRTensorValueType *)MIL::IRTensorValueType::MakeWithShape();
  if (v33)
  {
    v27 = (unint64_t *)&v33->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  if (__p)
  {
    v39 = (uint64_t *)__p;
    operator delete(__p);
  }

  return v26;
}

- (unique_ptr<MIL::IRArgument,)milArgumentForSNNMILValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unique_ptr<MIL::IRArgument, std::default_delete<MIL::IRArgument>> v12;
  std::__shared_weak_count *v13;
  std::__shared_weak_count_vtbl *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "cxxString");
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }

    MIL::IRArgument::Make();
    if (v15 < 0)
      operator delete(v14);
  }
  else
  {
    objc_msgSend(v4, "conformsToProtocol:", &unk_25725AB30);
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    if (v7)
      objc_msgSend(v7, "milValueWithContext:", WeakRetained);
    else
      v14 = 0;

    if (v14)
    {
      v9 = (std::__shared_weak_count *)operator new();
      v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137ABE8;
      v9->__shared_owners_ = 0;
      v9->__shared_weak_owners_ = 0;
      v9[1].__vftable = v14;
    }
    else
    {
      v9 = 0;
    }
    v13 = v9;
    MIL::IRArgument::Make();
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

  }
  return v12;
}

- (BOOL)isUniqueOutputName:(id)a3
{
  id v4;
  void *v5;
  char *end;
  char *begin;
  __int128 v8;
  size_t v9;
  std::string::size_type size;
  int v11;
  std::string *p_p;
  uint64_t v13;
  void **p_s1;
  int v15;
  int v16;
  int v17;
  int v18;
  BOOL v20;
  BOOL v21;
  char v22;
  char v23;
  std::string __p;
  void *__s1;
  size_t __n;
  uint64_t v28;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cxxString");
  }
  else
  {
    __s1 = 0;
    __n = 0;
    v28 = 0;
  }
  begin = (char *)self->_outputs.__begin_;
  end = (char *)self->_outputs.__end_;
  if (begin != end)
  {
    while (1)
    {
      if (begin[23] < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)begin, *((_QWORD *)begin + 1));
      }
      else
      {
        v8 = *(_OWORD *)begin;
        __p.__r_.__value_.__r.__words[2] = *((_QWORD *)begin + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      if (v28 >= 0)
        v9 = HIBYTE(v28);
      else
        v9 = __n;
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      v11 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __p.__r_.__value_.__l.__size_;
      if (v9 == size)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if (v28 < 0)
        {
          v21 = memcmp(__s1, p_p, __n) == 0;
        }
        else
        {
          if (!HIBYTE(v28))
          {
            v21 = 1;
            if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_31;
LABEL_30:
            operator delete(__p.__r_.__value_.__l.__data_);
            goto LABEL_31;
          }
          v13 = HIBYTE(v28) - 1;
          p_s1 = &__s1;
          do
          {
            v16 = *(unsigned __int8 *)p_s1;
            p_s1 = (void **)((char *)p_s1 + 1);
            v15 = v16;
            v18 = p_p->__r_.__value_.__s.__data_[0];
            p_p = (std::string *)((char *)p_p + 1);
            v17 = v18;
            v20 = v13-- != 0;
            v21 = v15 == v17;
          }
          while (v15 == v17 && v20);
        }
        if (v11 < 0)
          goto LABEL_30;
      }
      else
      {
        v21 = 0;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          goto LABEL_30;
      }
LABEL_31:
      begin += 24;
      v22 = begin == end || v21;
      if ((v22 & 1) != 0)
      {
        v23 = !v21;
        goto LABEL_39;
      }
    }
  }
  v23 = 1;
LABEL_39:
  if (SHIBYTE(v28) < 0)
    operator delete(__s1);

  return v23;
}

- (NSString)name
{
  return self->_name;
}

- (SNNMILContext)context
{
  return (SNNMILContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (SNNMILSourceLocation)location
{
  return self->_location;
}

- (SNNMILFunction)function
{
  return self->_function;
}

- (NSMutableArray)outputNames
{
  return self->_outputNames;
}

- (void)setOutputNames:(id)a3
{
  objc_storeStrong((id *)&self->_outputNames, a3);
}

- (void).cxx_destruct
{
  void **p_begin;

  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_function, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_name, 0);
  p_begin = &self->_operations.__begin_;
  std::vector<std::shared_ptr<MIL::IRNamedValueType>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_outputs.__begin_;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  std::__tree<std::__value_type<std::string,MIL::IRValueType const*>,std::__map_value_compare<std::string,std::__value_type<std::string,MIL::IRValueType const*>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MIL::IRValueType const*>>>::destroy((uint64_t)&self->_inputs, (char *)self->_inputs.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end
