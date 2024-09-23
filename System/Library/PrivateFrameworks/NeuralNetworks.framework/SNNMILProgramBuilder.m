@implementation SNNMILProgramBuilder

- (SNNMILProgramBuilder)init
{
  SNNMILProgramBuilder *v2;
  SNNMILContext *v3;
  SNNMILContext *context;
  uint64_t v5;
  NSMutableArray *functionBuilders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SNNMILProgramBuilder;
  v2 = -[SNNMILProgramBuilder init](&v8, sel_init);
  v3 = objc_alloc_init(SNNMILContext);
  context = v2->_context;
  v2->_context = v3;

  v5 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  functionBuilders = v2->_functionBuilders;
  v2->_functionBuilders = (NSMutableArray *)v5;

  return v2;
}

- (SNNMILProgramBuilder)initWithContext:(id)a3 location:(id)a4
{
  id v7;
  id v8;
  SNNMILProgramBuilder *v9;
  uint64_t v10;
  NSMutableArray *functionBuilders;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SNNMILProgramBuilder;
  v9 = -[SNNMILProgramBuilder init](&v13, sel_init);
  objc_storeStrong((id *)&v9->_context, a3);
  objc_storeStrong((id *)&v9->_location, a4);
  v10 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  functionBuilders = v9->_functionBuilders;
  v9->_functionBuilders = (NSMutableArray *)v10;

  return v9;
}

- (id)build
{
  SNNMILProgram *program;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  SNNMILContext *context;
  std::__shared_weak_count *v16;
  std::__shared_weak_count_vtbl *v17;
  const IRProgram *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  SNNMILProgram *v26;
  MIL::IRProgramValidator *v27;
  SNNMILProgram *v28;
  SNNMILProgram *v29;
  MIL::IRProgramValidator *v30;
  SNNMILProgram *v31;
  MIL::IRProgramValidator *v32;
  MIL::IRProgramValidator *v34;
  void *__p;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  MIL::IRProgramValidator *v42;
  std::__shared_weak_count *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[2];
  int v49;
  MIL::IRProgramValidator **v50;
  void **p_p;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  program = self->_program;
  if (program)
    return program;
  memset(v48, 0, sizeof(v48));
  v49 = 1065353216;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = self->_functionBuilders;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "build");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "name");
          objc_msgSend(v9, "milFunction");
        }
        else
        {
          v10 = objc_alloc(MEMORY[0x24BDD17C8]);
          __p = 0;
          v36 = 0;
          v37 = 0;
          v11 = (void *)objc_msgSend(v10, "initWithCXXString:", &__p);
          if (SHIBYTE(v37) < 0)
            operator delete(__p);

          __p = 0;
          v36 = 0;
          v37 = 0;
          v42 = 0;
          v43 = 0;
        }
        p_p = &__p;
        v50 = &v42;
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRFunction>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<std::shared_ptr<MIL::IRFunction>&&>>((uint64_t)v48, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (__int128 **)&p_p, (uint64_t *)&v50);
        v12 = v43;
        if (v43)
        {
          p_shared_owners = (unint64_t *)&v43->__shared_owners_;
          do
            v14 = __ldaxr(p_shared_owners);
          while (__stlxr(v14 - 1, p_shared_owners));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
        if (SHIBYTE(v37) < 0)
          operator delete(__p);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v5);
  }

  context = self->_context;
  if (context)
  {
    -[SNNMILContext context](context, "context");
  }
  else
  {
    v40 = 0;
    v41 = 0;
  }
  -[SNNMILProgramBuilder milLocation](self, "milLocation");
  v38 = __p;
  if (__p)
  {
    v16 = (std::__shared_weak_count *)operator new();
    v17 = (std::__shared_weak_count_vtbl *)__p;
    v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137AAC8;
    v16->__shared_owners_ = 0;
    v16->__shared_weak_owners_ = 0;
    v16[1].__vftable = v17;
  }
  else
  {
    v16 = 0;
  }
  v39 = v16;
  __p = 0;
  MIL::IRProgram::Make();
  v19 = v39;
  if (v39)
  {
    v20 = (unint64_t *)&v39->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = __p;
  __p = 0;
  if (v22)
    (*(void (**)(void *))(*(_QWORD *)v22 + 8))(v22);
  v23 = v41;
  if (v41)
  {
    v24 = (unint64_t *)&v41->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  MIL::IRProgramValidator::Validate(v42, v18);
  if ((MIL::ValidationResult::IsGood((MIL::ValidationResult *)&__p) & 1) == 0)

  v26 = [SNNMILProgram alloc];
  v27 = v42;
  v42 = 0;
  v34 = v27;
  v28 = -[SNNMILProgram initWithProgram:](v26, "initWithProgram:", &v34);
  v29 = self->_program;
  self->_program = v28;

  v30 = v34;
  v34 = 0;
  if (v30)
    (*(void (**)(MIL::IRProgramValidator *))(*(_QWORD *)v30 + 8))(v30);
  v31 = self->_program;
  MEMORY[0x2494ED2A8](&__p);
  v32 = v42;
  v42 = 0;
  if (v32)
    (*(void (**)(MIL::IRProgramValidator *))(*(_QWORD *)v32 + 8))(v32);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v48);
  return v31;
}

- (unique_ptr<MIL::Location,)milLocation
{
  _QWORD *v2;
  _QWORD *v3;
  SNNMILSourceLocation *location;
  uint64_t v5;
  uint64_t v6;

  v3 = v2;
  location = self->_location;
  if (location)
  {
    return (unique_ptr<MIL::Location, std::default_delete<MIL::Location>>)-[SNNMILSourceLocation milLocation](location, "milLocation");
  }
  else
  {
    v5 = MIL::UnknownLocation::Make(0);
    *v3 = v6;
  }
  return (unique_ptr<MIL::Location, std::default_delete<MIL::Location>>)v5;
}

- (id)functionWithName:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  SNNMILFunctionBuilder *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_functionBuilders;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "name", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) != 0)
        {
          v15 = v12;

          goto LABEL_11;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = -[SNNMILFunctionBuilder initWithName:context:location:]([SNNMILFunctionBuilder alloc], "initWithName:context:location:", v6, self->_context, v7);
  -[NSMutableArray addObject:](self->_functionBuilders, "addObject:", v15);
LABEL_11:

  return v15;
}

- (SNNMILContext)context
{
  return self->_context;
}

- (SNNMILProgram)program
{
  return self->_program;
}

- (SNNMILSourceLocation)location
{
  return self->_location;
}

- (NSMutableArray)functionBuilders
{
  return self->_functionBuilders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionBuilders, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
