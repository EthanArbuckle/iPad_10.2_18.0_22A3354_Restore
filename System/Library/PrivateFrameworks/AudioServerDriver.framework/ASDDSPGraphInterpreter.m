@implementation ASDDSPGraphInterpreter

- (ASDDSPGraphInterpreter)init
{
  ASDDSPGraphInterpreter *v2;
  ASDDSPGraphInterpreter *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t (***v8)();
  uint64_t v9;
  _QWORD v11[4];
  ASDDSPGraphInterpreter *v12;
  objc_super v13;
  uint64_t (**v14)();
  char v15;
  uint64_t (***v16)();
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)ASDDSPGraphInterpreter;
  v2 = -[ASDDSPGraphInterpreter init](&v13, sel_init);
  if (!v2)
    return 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __30__ASDDSPGraphInterpreter_init__block_invoke;
  v11[3] = &unk_24DBCA068;
  v3 = v2;
  v12 = v3;
  v14 = &off_24DBC9E00;
  v15 = 0;
  v16 = &v14;
  v7 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v11);
  v8 = v16;
  if (v16 == &v14)
  {
    v9 = 4;
    v8 = &v14;
    goto LABEL_7;
  }
  if (v16)
  {
    v9 = 5;
LABEL_7:
    ((void (*)(uint64_t (***)(), uint64_t, uint64_t, uint64_t))(*v8)[v9])(v8, v4, v5, v6);
  }
  if ((v7 & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

uint64_t __30__ASDDSPGraphInterpreter_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = operator new();
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_OWORD *)(v2 + 192) = 0u;
  *(_QWORD *)(v2 + 208) = 0;
  DSPGraph::Interpreter::Interpreter((DSPGraph::Interpreter *)v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return 1;
}

+ (id)compileFile:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "compileFile:withSubstitutions:includingPaths:", v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)compileText:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "compileText:withSubstitutions:includingPaths:", v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)compileFile:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke;
  v16[3] = &unk_24DBCA700;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

ASDDSPGraph *__71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke(uint64_t *a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  std::__shared_weak_count_vtbl *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count_vtbl *v7;
  ASDDSPGraph *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ASDDSPGraph *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count_vtbl *v19;
  std::__shared_weak_count *v20;
  _QWORD v21[3];
  _OWORD v22[2];
  uint64_t v23;
  std::__shared_weak_count_vtbl *v24;
  std::__shared_weak_count_vtbl *v25;
  std::__shared_weak_count *v26;
  void **v27;

  v2 = a1 + 5;
  objc_msgSend(objc_retainAutorelease((id)a1[5]), "UTF8String");
  v3 = (void *)objc_opt_class();
  if (v3)
  {
    objc_msgSend(v3, "stringMapFromStringDictionary:", a1[6]);
  }
  else
  {
    v23 = 0;
    memset(v22, 0, sizeof(v22));
  }
  v4 = (void *)objc_opt_class();
  if (v4)
    objc_msgSend(v4, "stringVectorFromStringArray:", a1[7]);
  else
    memset(v21, 0, sizeof(v21));
  DSPGraph::Interpreter::compileFile();
  v5 = v24;
  v25 = v24;
  if (v24)
  {
    v6 = (std::__shared_weak_count *)operator new();
    v7 = v24;
    v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_24DBC9EB8;
    v6->__shared_owners_ = 0;
    v6->__shared_weak_owners_ = 0;
    v6[1].__vftable = v7;
  }
  else
  {
    v6 = 0;
  }
  v24 = 0;
  v26 = v6;
  v27 = (void **)v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v27);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v22);
  if (v5)
  {
    v8 = [ASDDSPGraph alloc];
    v19 = v5;
    v20 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[ASDDSPGraph initWithDSPGraph:](v8, "initWithDSPGraph:", &v19);
    v12 = v20;
    if (v20)
    {
      v13 = (unint64_t *)&v20->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke_cold_1(v2);
    v11 = 0;
  }
  v15 = v26;
  if (v26)
  {
    v16 = (unint64_t *)&v26->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v11;
}

- (id)compileText:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke;
  v16[3] = &unk_24DBCA700;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

ASDDSPGraph *__71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  std::__shared_weak_count_vtbl *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count_vtbl *v6;
  ASDDSPGraph *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  ASDDSPGraph *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count_vtbl *v18;
  std::__shared_weak_count *v19;
  _QWORD v20[3];
  _OWORD v21[2];
  uint64_t v22;
  std::__shared_weak_count_vtbl *v23;
  std::__shared_weak_count_vtbl *v24;
  std::__shared_weak_count *v25;
  void **v26;

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  v2 = (void *)objc_opt_class();
  if (v2)
  {
    objc_msgSend(v2, "stringMapFromStringDictionary:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v22 = 0;
    memset(v21, 0, sizeof(v21));
  }
  v3 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v3, "stringVectorFromStringArray:", *(_QWORD *)(a1 + 56));
  else
    memset(v20, 0, sizeof(v20));
  DSPGraph::Interpreter::compileText();
  v4 = v23;
  v24 = v23;
  if (v23)
  {
    v5 = (std::__shared_weak_count *)operator new();
    v6 = v23;
    v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_24DBC9EB8;
    v5->__shared_owners_ = 0;
    v5->__shared_weak_owners_ = 0;
    v5[1].__vftable = v6;
  }
  else
  {
    v5 = 0;
  }
  v23 = 0;
  v25 = v5;
  v26 = (void **)v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v26);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v21);
  if (v4)
  {
    v7 = [ASDDSPGraph alloc];
    v18 = v4;
    v19 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = -[ASDDSPGraph initWithDSPGraph:](v7, "initWithDSPGraph:", &v18);
    v11 = v19;
    if (v19)
    {
      v12 = (unint64_t *)&v19->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke_cold_1();
    v10 = 0;
  }
  v14 = v25;
  if (v25)
  {
    v15 = (unint64_t *)&v25->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v10;
}

+ (unordered_map<std::string,)stringMapFromStringDictionary:()std:()std:(std:(std:(id)a2 :(SEL)a3 string>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unordered_map<std::string, std::string, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::string>>> *result;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
          v13 = (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_impl<char const*,char const*>(retstr, &v14, &v13);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return result;
}

+ (vector<std::string,)stringVectorFromStringArray:(id)a2
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  char *v12;
  char *var1;
  void *v14;
  vector<std::string, std::allocator<std::string>> *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_retainAutorelease(v10);
          v12 = (char *)objc_msgSend(v11, "UTF8String", (_QWORD)v16);
          v20 = v12;
          var1 = (char *)retstr->var1;
          if (var1 >= retstr->var2.var0)
          {
            v14 = (void *)std::vector<std::string>::__emplace_back_slow_path<char const*>((uint64_t *)retstr, &v20);
          }
          else
          {
            std::string::basic_string[abi:ne180100]<0>((_QWORD *)retstr->var1, v12);
            v14 = var1 + 24;
            retstr->var1 = var1 + 24;
          }
          retstr->var1 = v14;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  return result;
}

- (void).cxx_destruct
{
  Interpreter *value;

  value = self->_interpreter.__ptr_.__value_;
  self->_interpreter.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Interpreter *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

void __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Graph %@ couldn't be compiled", (uint8_t *)&v2, 0xCu);
}

void __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Graph couldn't be compiled from text", v0, 2u);
}

@end
