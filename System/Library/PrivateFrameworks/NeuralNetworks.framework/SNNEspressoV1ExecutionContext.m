@implementation SNNEspressoV1ExecutionContext

- (SNNEspressoV1ExecutionContext)initWithMILProgram:(id)a3 primaryComputeUnit:(id)a4 computeUnits:(id)a5 preferredMetalDevice:(id)a6 computePrecision:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t context;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  uint64_t plan;
  void *v30;
  id v31;
  int v32;
  unint64_t *v33;
  unint64_t v34;
  SNNEspressoV1ExecutionContext *v35;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  id v40;
  id v41;
  std::__shared_weak_count *v42;
  __int128 v43;
  objc_super v44;

  v40 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v41 = a7;
  v44.receiver = self;
  v44.super_class = (Class)SNNEspressoV1ExecutionContext;
  v18 = -[SNNEspressoV1ExecutionContext init](&v44, sel_init);
  if (!objc_msgSend(v16, "count"))
    __assert_rtn("-[SNNEspressoV1ExecutionContext initWithMILProgram:primaryComputeUnit:computeUnits:preferredMetalDevice:computePrecision:error:]", "SNNEspressoExecutors.mm", 139, "computeUnits.count > 0");
  objc_storeStrong((id *)v18 + 3, a4);
  objc_storeStrong((id *)v18 + 4, a5);
  objc_storeStrong((id *)v18 + 5, a7);
  v19 = v40;
  v20 = objc_msgSend(*((id *)v18 + 3), "kind");
  if (v17 && v20 == 2)
    espresso_device_id_for_metal_device();
  objc_msgSend(v15, "platform", v40);
  context = espresso_create_context();
  *((_QWORD *)v18 + 6) = context;
  if (context)
  {
    v22 = +[SNNComputeUnit bitmakForComputeUnits:](SNNComputeUnit, "bitmakForComputeUnits:", v16);
    if (v22 && espresso_context_set_int_option())
    {
      if (a8)
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[SNNError invalidEspressoContextErrorForMethod:description:](SNNError, "invalidEspressoContextErrorForMethod:description:", v23, CFSTR("Invalid compute unit selection."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
        *a8 = v24;

      }
    }
    else
    {
      if (objc_msgSend(*((id *)v18 + 3), "kind", v22) == 2)
      {
        Espresso::get_internal_context(*((Espresso **)v18 + 6), v25);
        v26 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
        *(_DWORD *)(v43 + 68) = 0;
        if (v26)
        {
          p_shared_owners = (unint64_t *)&v26->__shared_owners_;
          do
            v28 = __ldaxr(p_shared_owners);
          while (__stlxr(v28 - 1, p_shared_owners));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }
      }
      plan = espresso_create_plan();
      *((_QWORD *)v18 + 7) = plan;
      if (plan)
      {
        if (objc_msgSend(v19, "isReferencingBlobFile")
          && (objc_msgSend(v19, "milFilePath"), v30 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v30,
                                                v30))
        {
          objc_msgSend(v19, "milFilePath");
          v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v31, "UTF8String");
          objc_msgSend(v41, "storageType");
          v32 = espresso_plan_add_network();

        }
        else
        {
          if (v19)
            objc_msgSend(v19, "milProgram");
          else
            v42 = 0;
          objc_msgSend(v41, "storageType");
          v32 = espresso_plan_add_cpp_net_from_mil_program_and_reload();
          if (v42)
          {
            v33 = (unint64_t *)&v42->__shared_owners_;
            do
              v34 = __ldaxr(v33);
            while (__stlxr(v34 - 1, v33));
            if (!v34)
            {
              ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
              std::__shared_weak_count::__release_weak(v42);
            }
          }
        }
        if (v32)
        {
          if (a8)
          {
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[SNNError invalidEspressoNetworkErrorForMethod:description:](SNNError, "invalidEspressoNetworkErrorForMethod:description:", v23, CFSTR("Failed to build plan."));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
        }
        else
        {
          Espresso::get_internal_network();
          std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]((uint64_t)v18 + 8, &v43);
          v37 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
          if (*((_QWORD *)&v43 + 1))
          {
            v38 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
            do
              v39 = __ldaxr(v38);
            while (__stlxr(v39 - 1, v38));
            if (!v39)
            {
              ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
              std::__shared_weak_count::__release_weak(v37);
            }
          }
          if (!*((_QWORD *)v18 + 1))
          {
            if (!a8)
              goto LABEL_36;
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[SNNError invalidEspressoNetworkErrorForMethod:description:](SNNError, "invalidEspressoNetworkErrorForMethod:description:", v23, CFSTR("Failed to load network."));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
          espresso_plan_build();
          if (espresso_plan_get_phase() == 1)
          {
            v35 = (SNNEspressoV1ExecutionContext *)v18;
            goto LABEL_37;
          }
          if (a8)
          {
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[SNNError invalidEspressoConfigurationErrorForMethod:description:](SNNError, "invalidEspressoConfigurationErrorForMethod:description:", v23, CFSTR("Invalid built state."));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
        }
      }
      else if (a8)
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[SNNError invalidEspressoPlanErrorForMethod:description:](SNNError, "invalidEspressoPlanErrorForMethod:description:", v23, CFSTR("Failed to create plan."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
    }
  }
  else if (a8)
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[SNNError invalidEspressoContextErrorForMethod:description:](SNNError, "invalidEspressoContextErrorForMethod:description:", v23, CFSTR("Failed to create context."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
LABEL_36:
  v35 = 0;
LABEL_37:

  return v35;
}

- (void)deallocEspressoResources
{
  if (self->_plan)
    espresso_plan_destroy();
  if (self->_context)
    espresso_context_destroy();
}

- (void)dealloc
{
  objc_super v3;

  -[SNNEspressoV1ExecutionContext deallocEspressoResources](self, "deallocEspressoResources");
  v3.receiver = self;
  v3.super_class = (Class)SNNEspressoV1ExecutionContext;
  -[SNNEspressoV1ExecutionContext dealloc](&v3, sel_dealloc);
}

- (id)inputAndOutputNames
{
  void *v3;
  __int128 *i;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::string __p;
  std::__shared_weak_count *v11;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  for (i = (__int128 *)*((_QWORD *)self->_cppNetwork.__ptr_ + 19); i; i = *(__int128 **)i)
  {
    std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100](&__p, i + 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", &__p);
    objc_msgSend(v3, "addObject:", v5);

    v6 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

- (NSArray)globalNames
{
  void *v3;
  __int128 *i;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::string __p;
  std::__shared_weak_count *v11;
  _BYTE v12[16];
  __int128 *v13;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  Espresso::net::all_globals((Espresso::net *)self->_cppNetwork.__ptr_, (uint64_t)v12);
  for (i = v13; i; i = *(__int128 **)i)
  {
    std::pair<std::string const,std::shared_ptr<MIL::IRValue const>>::pair[abi:ne180100](&__p, i + 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", &__p);
    objc_msgSend(v3, "addObject:", v5);

    v6 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v12);
  return (NSArray *)v3;
}

- (NSArray)inputNames
{
  void *v3;
  net *ptr;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  std::string __p;
  char v13;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  ptr = self->_cppNetwork.__ptr_;
  v5 = (_QWORD *)*((_QWORD *)ptr + 29);
  v6 = (_QWORD *)((char *)ptr + 240);
  if (v5 != (_QWORD *)((char *)ptr + 240))
  {
    do
    {
      if (*((char *)v5 + 55) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v5[4], v5[5]);
      else
        __p = *(std::string *)(v5 + 4);
      v13 = *((_BYTE *)v5 + 56);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", &__p);
      objc_msgSend(v3, "addObject:", v7);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v8 = (_QWORD *)v5[1];
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
          v9 = (_QWORD *)v5[2];
          v10 = *v9 == (_QWORD)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
    }
    while (v9 != v6);
  }
  return (NSArray *)v3;
}

- (NSArray)outputNames
{
  void *v3;
  net *ptr;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  std::string __p;
  char v13;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  ptr = self->_cppNetwork.__ptr_;
  v5 = (_QWORD *)*((_QWORD *)ptr + 32);
  v6 = (_QWORD *)((char *)ptr + 264);
  if (v5 != (_QWORD *)((char *)ptr + 264))
  {
    do
    {
      if (*((char *)v5 + 55) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v5[4], v5[5]);
      else
        __p = *(std::string *)(v5 + 4);
      v13 = *((_BYTE *)v5 + 56);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", &__p);
      objc_msgSend(v3, "addObject:", v7);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v8 = (_QWORD *)v5[1];
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
          v9 = (_QWORD *)v5[2];
          v10 = *v9 == (_QWORD)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
    }
    while (v9 != v6);
  }
  return (NSArray *)v3;
}

- (id)shapeForInputWithName:(id)a3
{
  -[SNNEspressoV1ExecutionContext shapeForBlobWithName:](self, "shapeForBlobWithName:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shapeForOutputWithName:(id)a3
{
  -[SNNEspressoV1ExecutionContext shapeForBlobWithName:](self, "shapeForBlobWithName:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shapeForBlobWithName:(id)a3
{
  id v4;
  net *ptr;
  id v6;
  unsigned __int8 *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t *v20;
  unint64_t v21;
  void *__p;
  int v24;
  int v25;
  int v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  void **p_p;
  _QWORD v33[5];
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v6, "UTF8String"));
  p_p = &__p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (__int128 **)&p_p);
  v8 = *((_QWORD *)v7 + 5);
  v9 = (std::__shared_weak_count *)*((_QWORD *)v7 + 6);
  v30 = v8;
  v31 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (v27 < 0)
    operator delete(__p);
  v12 = *(_DWORD *)(v8 + 28);
  Espresso::abstract_blob_container::shape((char *)v8, (uint64_t)&__p);
  if (v12 > 1)
  {
    switch(v12)
    {
      case 2u:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", SHIDWORD(__p));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v13;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (int)__p);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 3u:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v13;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", SHIDWORD(__p));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v15;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (int)__p);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35[2] = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 4u:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v13;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v15;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", SHIDWORD(__p));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2] = v16;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (int)__p);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34[3] = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 5u:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v13;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v15;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v16;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", SHIDWORD(__p));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33[3] = v17;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (int)__p);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33[4] = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_15:

LABEL_16:
        goto LABEL_17;
      default:
        v14 = 0;
        goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (int)__p);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  v19 = v14;
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }
  if (v9)
  {
    v20 = (unint64_t *)&v9->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  return v19;
}

- (unint64_t)dataTypeForBlobWithName:(id)a3
{
  id v4;
  net *ptr;
  id v6;
  unsigned __int8 *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t *v15;
  unint64_t v16;
  void *__p[2];
  char v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  void **v22;

  v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v22 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v22);
  v9 = *((_QWORD *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 6);
  v20 = v9;
  v21 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (v19 < 0)
    operator delete(__p[0]);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 32))(v9);
  v13 = 3;
  switch(v12)
  {
    case 0:
      goto LABEL_26;
    case 1:
      v13 = 2;
      goto LABEL_26;
    case 2:
      v13 = 5;
      goto LABEL_26;
    case 3:
      v13 = 7;
      goto LABEL_26;
    case 4:
      +[SNNLogging framework](SNNLogging, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:].cold.1();
      goto LABEL_24;
    case 5:
      v13 = 10;
      goto LABEL_26;
    case 6:
      +[SNNLogging framework](SNNLogging, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:].cold.2();
      goto LABEL_24;
    case 7:
      v13 = 6;
      goto LABEL_26;
    case 8:
      v13 = 8;
      goto LABEL_26;
    case 9:
      +[SNNLogging framework](SNNLogging, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:].cold.3();
      goto LABEL_24;
    case 10:
      v13 = 11;
      goto LABEL_26;
    case 11:
    case 12:
      v13 = 12;
      goto LABEL_26;
    case 13:
      +[SNNLogging framework](SNNLogging, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SNNEspressoV1ExecutionContext dataTypeForBlobWithName:].cold.4();
LABEL_24:

      goto LABEL_25;
    case 14:
      v13 = 0;
      goto LABEL_26;
    default:
LABEL_25:
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unsupported data type"));
      v13 = 3;
LABEL_26:
      if (v8)
      {
        v15 = (unint64_t *)&v8->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }

      return v13;
  }
}

- (unint64_t)rawSizeForInputWithName:(id)a3
{
  id v4;
  net *ptr;
  id v6;
  unsigned __int8 *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *__p[2];
  char v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  void **v20;

  v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v20 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v20);
  v9 = *((_QWORD *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 6);
  v18 = v9;
  v19 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (v17 < 0)
    operator delete(__p[0]);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 128))(v9);
  if (v8)
  {
    v13 = (unint64_t *)&v8->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v12;
}

- (unint64_t)rawSizeForOutputWithName:(id)a3
{
  id v4;
  net *ptr;
  id v6;
  unsigned __int8 *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *__p[2];
  char v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  void **v20;

  v4 = a3;
  ptr = self->_cppNetwork.__ptr_;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v20 = __p;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v20);
  v9 = *((_QWORD *)v7 + 5);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 6);
  v18 = v9;
  v19 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (v17 < 0)
    operator delete(__p[0]);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 128))(v9);
  if (v8)
  {
    v13 = (unint64_t *)&v8->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v12;
}

- (SNNComputeUnit)primaryComputeUnit
{
  return self->_primaryComputeUnit;
}

- (NSArray)computeUnits
{
  return self->_computeUnits;
}

- (SNNComputePrecision)computePrecision
{
  return self->_computePrecision;
}

- (void)context
{
  return self->_context;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  void *v2;
  uint64_t v3;
  _QWORD v4[2];
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  objc_copyStruct(v4, &self->_network, 16, 1, 0);
  v2 = (void *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)plan
{
  return self->_plan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computePrecision, 0);
  objc_storeStrong((id *)&self->_computeUnits, 0);
  objc_storeStrong((id *)&self->_primaryComputeUnit, 0);
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)&self->_cppNetwork);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)dataTypeForBlobWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_242A44000, v0, v1, "Unsupported data type Espresso::U8 requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dataTypeForBlobWithName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_242A44000, v0, v1, "Unsupported data type Espresso::I4 requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dataTypeForBlobWithName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_242A44000, v0, v1, "Unsupported data type Espresso::U4 requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dataTypeForBlobWithName:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_242A44000, v0, v1, "Unsupported data type Espresso::BFP16 requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
