@implementation MLModelAssetResourceFactoryInMemoryImpl

- (MLModelAssetResourceFactoryInMemoryImpl)initWithArchiveData:(id)a3
{
  id v4;
  MLModelAssetResourceFactoryInMemoryImpl *v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;
  _MLModelInputArchiver *v11;
  uint64_t value;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *__p[2];
  char v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  char **v21;
  char *v22[2];
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLModelAssetResourceFactoryInMemoryImpl;
  v5 = -[MLModelAssetResourceFactoryInMemoryImpl init](&v23, sel_init);
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, ".");
    v6 = v4;
    v7 = (std::__shared_weak_count *)operator new(0x50uLL);
    v7->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    v7->__shared_weak_owners_ = 0;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BF40;
    v19 = Archiver::_IArchiveMemoryImpl::_IArchiveMemoryImpl((uint64_t)&v7[1], (uint64_t)__p, v6);
    v20 = v7;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v22[0] = 0;
    v22[1] = 0;
    v21 = v22;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }

    v11 = (_MLModelInputArchiver *)operator new();
    _MLModelInputArchiver::_MLModelInputArchiver(v11, (const IArchive *)&v19);
    value = (uint64_t)v5->_inputArchiver.__ptr_.__value_;
    v5->_inputArchiver.__ptr_.__value_ = v11;
    if (value)
      std::default_delete<_MLModelInputArchiver>::operator()[abi:ne180100](value);
    std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v22[0]);
    v13 = v20;
    if (v20)
    {
      v14 = (unint64_t *)&v20->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (v18 < 0)
      operator delete(__p[0]);
  }

  return v5;
}

- (NSURL)compiledModelURL
{
  return 0;
}

- (id)modelAssetDescriptionWithError:(id *)a3
{
  IArchive::rewind((uint64_t)self->_inputArchiver.__ptr_.__value_);
  return +[MLLoader loadModelAssetDescriptionFromArchive:error:](MLLoader, "loadModelAssetDescriptionFromArchive:error:", self->_inputArchiver.__ptr_.__value_, a3);
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  IArchive::rewind((uint64_t)self->_inputArchiver.__ptr_.__value_);
  +[MLLoader loadModelFromArchive:configuration:error:](MLLoader, "loadModelFromArchive:configuration:error:", self->_inputArchiver.__ptr_.__value_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelStructureWithError:(id *)a3
{
  _MLModelInputArchiver *value;
  void *v6;
  _QWORD v8[3];
  char *v9;
  _BYTE *v10;
  char *v11;
  _BYTE v12[24];
  int v13;
  void **v14;
  char v15;
  void **v16[4];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  IArchive::rewind((uint64_t)self->_inputArchiver.__ptr_.__value_);
  v13 = 0;
  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v16, (uint64_t)v12);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v14 = (void **)&v9;
  v15 = 0;
  v9 = (char *)operator new(0x20uLL);
  v10 = v9;
  v11 = v9 + 32;
  v10 = (_BYTE *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel> const*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel> const*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v16, (uint64_t)&v17, (uint64_t)v9);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v16);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v12);
  value = self->_inputArchiver.__ptr_.__value_;
  memset(v8, 0, sizeof(v8));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (v10 - v9) >> 5);
  +[MLModelStructure loadModelStructureFromCompiledArchive:path:error:](MLModelStructure, "loadModelStructureFromCompiledArchive:path:error:", value, v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = (void **)v8;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v16);
  v16[0] = (void **)&v9;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v16);
  return v6;
}

- (void).cxx_destruct
{
  _MLModelInputArchiver *value;

  value = self->_inputArchiver.__ptr_.__value_;
  self->_inputArchiver.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<_MLModelInputArchiver>::operator()[abi:ne180100]((uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
