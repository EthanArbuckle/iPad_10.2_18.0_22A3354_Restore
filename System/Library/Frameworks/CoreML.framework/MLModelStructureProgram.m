@implementation MLModelStructureProgram

- (MLModelStructureProgram)initWithFunctions:(id)a3
{
  id v4;
  MLModelStructureProgram *v5;
  uint64_t v6;
  NSDictionary *functions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgram;
  v5 = -[MLModelStructureProgram init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    functions = v5->_functions;
    v5->_functions = (NSDictionary *)v6;

  }
  return v5;
}

- (MLModelStructureProgramFunction)mainFunction
{
  void *v2;
  void *v3;
  void *v4;

  -[MLModelStructureProgram functions](self, "functions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLModelStructureProgramFunction *)v4;
}

- (NSDictionary)functions
{
  return self->_functions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functions, 0);
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7
{
  uint64_t v9;
  void *v10;
  uint64_t *i;
  _OWORD *v12;
  std::string::size_type v13;
  char v14;
  MLModelStructureProgramFunction *v15;
  uint64_t v16;
  MLModelStructureProgramFunction *v17;
  void *v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  objc_class *v24;
  __int128 v25;
  uint64_t v26;
  std::string v27;
  std::string::size_type v28;
  _BYTE v29[15];
  char v30;
  int v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  void **v36[2];

  +[MLProgramContainer loadProgramFromCompiledArchive:error:](MLProgramContainer, "loadProgramFromCompiledArchive:error:", a3, a7, a5);
  if (v34)
  {
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v34 + 72))(v34);
    v24 = (objc_class *)a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(v9 + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = *(uint64_t **)(v9 + 16); i; i = (uint64_t *)*i)
    {
      v32 = 0uLL;
      v33 = 0;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v32, (uint64_t)a6->m_components.__begin_, (uint64_t)a6->m_components.__end_, ((char *)a6->m_components.__end_ - (char *)a6->m_components.__begin_) >> 5);
      v12 = i + 2;
      if (*((char *)i + 39) < 0)
      {
        std::string::__init_copy_ctor_external(&v27, (const std::string::value_type *)i[2], i[3]);
      }
      else
      {
        *(_OWORD *)&v27.__r_.__value_.__l.__data_ = *v12;
        v27.__r_.__value_.__r.__words[2] = i[4];
      }
      *(_QWORD *)v29 = v27.__r_.__value_.__l.__size_;
      v13 = v27.__r_.__value_.__r.__words[0];
      *(_QWORD *)&v29[7] = *(std::string::size_type *)((char *)&v27.__r_.__value_.__r.__words[1] + 7);
      v14 = HIBYTE(v27.__r_.__value_.__r.__words[2]);
      memset(&v27, 0, sizeof(v27));
      v28 = v13;
      v30 = v14;
      v31 = 2;
      CoreML::ModelStructure::Path::appendComponent((uint64_t)&v32, (uint64_t)&v28);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28);
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v27.__r_.__value_.__l.__data_);
      v15 = [MLModelStructureProgramFunction alloc];
      v16 = i[5];
      v25 = v32;
      v26 = v33;
      v33 = 0;
      v32 = 0uLL;
      v17 = -[MLModelStructureProgramFunction initWithMILFunction:path:](v15, "initWithMILFunction:path:", v16, &v25);
      v36[0] = (void **)&v25;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v36);
      if (*((char *)i + 39) < 0)
        v12 = *(_OWORD **)v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

      v36[0] = (void **)&v32;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v36);
    }
    v19 = (void *)objc_msgSend([v24 alloc], "initWithFunctions:", v10);

  }
  else
  {
    v19 = 0;
  }
  v20 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  return v19;
}

@end
